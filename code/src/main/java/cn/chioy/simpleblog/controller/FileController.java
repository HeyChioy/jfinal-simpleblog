package cn.chioy.simpleblog.controller;

import cn.chioy.simpleblog.interceptor.PermissionInterceptor;
import cn.chioy.simpleblog.model.BlogFile;
import cn.chioy.simpleblog.service.BlogFileService;
import cn.chioy.simpleblog.util.MyPathKit;
import com.jfinal.aop.Before;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created by seiryuukyuu on 2017/5/1.
 */
public class FileController extends BaseController {

    private static final Random random = new Random();
    private BlogFileService service = new BlogFileService();

    @Before(PermissionInterceptor.class)
    public void upload() {
        List<UploadFile> files = getFiles();
        System.out.println(files);
        ArrayList<BlogFile> resultList = new ArrayList<BlogFile>();
        saveToDb(files, resultList);
        renderResult(resultList);
    }

    @Before(PermissionInterceptor.class)
    public void list() {
        renderResult(service.list());
    }

    @Before(PermissionInterceptor.class)
    public void delete() {
        if (!isAllowMethod(POST)) {
            renderIllegalMethod();
            return;
        }
        Integer id = getParaToInt();
        if (id == null) {
            renderMissParam();
            return;
        }
        BlogFile blogFile = (BlogFile) service.getById(id);
        if (blogFile == null) {
            renderBooleanResult(true);
            return;
        }
        String filePath = PathKit.getWebRootPath() + "/" + blogFile.get("src");
        File preDeleteFile = new File(filePath);
        renderBooleanResult((service.remove(blogFile) && preDeleteFile.delete()) || !preDeleteFile.exists() );
    }

    private void saveToDb(List<UploadFile> files, List<BlogFile> resultList) {
        for (UploadFile file : files) {
            String title = file.getFileName();
            String type = getFileType(file);
            String src = getFilePathAndRename(file).replace(PathKit.getWebRootPath(), "");
            if (src != null) {
                BlogFile blogFile = saveBlogFile(title, src, type);
                if (blogFile != null) {
                    resultList.add(blogFile);
                }
            }
        }
    }

    private BlogFile saveBlogFile(String title, String src, String type) {
        BlogFile blogFile = new BlogFile();
        blogFile.set("title", title).set("src", src).set("type", type);
        if (service.save(blogFile)) {
            return blogFile;
        }
        return null;
    }

    private String getFilePathAndRename(UploadFile uploadFile) {
        File file = uploadFile.getFile();
        String uploadPath = uploadFile.getUploadPath();
        String newFileName = uploadPath + getRandomFileName(getFileType(uploadFile), getFileSuffix(uploadFile));
        if (moveFile(file, newFileName)) {
            return newFileName;
        }
        return null;
    }

    private String getFileType(UploadFile uploadFile) {
        String suffix = getFileSuffix(uploadFile);
        return getFileType(suffix);
    }

    private String getFileSuffix(UploadFile uploadFile) {
        return uploadFile.getFileName().substring(uploadFile.getFileName().lastIndexOf("."));
    }

    private String getFileType(String suffix) {
        String[] image = new String[]{".GIF"
                , ".JPG"
                , ".JPEG"
                , ".PNG"};
        for (String n : image) {
            if (suffix.toUpperCase().equals(n)) {
                return "IMAGE";
            }
        }
        return "FILE";
    }

    private boolean moveFile(File file, String newFileName) {
        String folder = newFileName.substring(0, newFileName.lastIndexOf("/"));
        File dir = new File(folder);
        dir.mkdirs();
        File target = new File(newFileName);
        return file.renameTo(target);
    }

    private String getRandomFileName(String fileType, String fileSuffix) {
        return getDateTimeFolder("/yyyy/MM/dd/") + fileType + "_" + getDateTimeFolder() + fileSuffix;
    }

    private String getDateTimeFolder() {
        return String.valueOf(Math.abs(random.nextLong()) + Math.abs(random.nextInt(100)));
    }

    private String getDateTimeFolder(String format) {
        return new SimpleDateFormat(format).format(new Date());
    }
}
