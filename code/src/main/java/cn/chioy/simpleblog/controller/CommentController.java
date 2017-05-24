package cn.chioy.simpleblog.controller;

import cn.chioy.simpleblog.interceptor.PermissionInterceptor;
import cn.chioy.simpleblog.model.Comment;
import cn.chioy.simpleblog.service.CommentService;
import cn.chioy.simpleblog.util.Constant;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

/**
 * Created by seiryuukyuu on 2017/4/28.
 */
public class CommentController extends BaseController {

    private CommentService service = new CommentService();
    private Object rootComment;

    public void create() {
        if (!isAllowMethod(POST)) {
            renderIllegalMethod();
            return;
        }
        Comment comment = new Comment();
        Integer replyTo = getParaToInt("replyTo", 0);
        getModelFromMap(comment);
        if(!checkRequirement(comment, new String[]{
                "email","content","article","nickname","site"
        })){
            return;
        }
        comment.set("replyTo", replyTo);
        System.out.println(comment);
        renderBooleanResult(service.addComment(comment));
    }

    @Before(PermissionInterceptor.class)
    public void delete() {
        if (!isAllowMethod(DELETE)) {
            renderIllegalMethod();
            return;
        }
        Integer id = getParaToInt();
        if (id == null) {
            renderMissParam();
            return;
        }
        Comment comment = (Comment) service.getById(id);
        renderBooleanResult(comment == null
                || service.update(
                        comment.set("content", Constant.Strings.COMMENT_DELETE_MESSAGE))
        );
    }

    public void realDelete() {
        if (!isAllowMethod(DELETE)) {
            renderIllegalMethod();
            return;
        }
        Integer id = getParaToInt();
        if (id == null) {
            renderMissParam();
            return;
        }
        Comment comment = (Comment) service.getById(id);
        renderBooleanResult(comment == null
                || service.deleteByComment(comment));
    }

    public void listAbout() {
        if (!isAllowMethod(POST)) {
            renderIllegalMethod();
            return;
        }
        Integer id = getParaToInt();
        if (id == null) {
            renderMissParam();
            return;
        }
        renderResult(service.listAbout(id));
    }

    public void get() {
        Integer articleId = getParaToInt("article");
        if(articleId == null){
            renderMissParam();
            return;
        }
        renderResult(service.getAll(articleId));
    }

    @Before(PermissionInterceptor.class)
    public void paging() {
        Integer pageNumber = getParaToInt("pageNumber", 1);
        Integer pageSize = getParaToInt("pageSize", 10);
        Page page = service.paging(pageNumber, pageSize);
        renderResult(page);
    }

    @Before(PermissionInterceptor.class)
    public void listAll() {
        renderResult(service.listAll());
    }

}
