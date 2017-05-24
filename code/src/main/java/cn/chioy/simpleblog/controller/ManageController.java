package cn.chioy.simpleblog.controller;

import cn.chioy.simpleblog.interceptor.PermissionInterceptor;
import cn.chioy.simpleblog.model.Article;
import cn.chioy.simpleblog.service.CommentService;
import cn.chioy.simpleblog.util.MyPathKit;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;

/**
 * Created by seiryuukyuu on 2017/5/2.
 */

@Before(PermissionInterceptor.class)
public class ManageController extends BaseController {


    public void comment() {
        render(MyPathKit.getAdminViewPath("comment/index"));
    }

    public void article() {
        render(MyPathKit.getAdminViewPath("article/index"));
    }

    public void tag() {
        render(MyPathKit.getAdminViewPath("tag/index"));
    }

    public void category() {
        render(MyPathKit.getAdminViewPath("category/index"));
    }

    public void link() {
        render(MyPathKit.getAdminViewPath("config/link"));
    }

    public void config() {
        render(MyPathKit.getAdminViewPath("config/config"));
    }

    public void file() {
        render(MyPathKit.getAdminViewPath("file/index"));
    }

    @ActionKey("/manage/article/editor")
    public void createArticle() {
        render(MyPathKit.getAdminViewPath("article/editor"));
    }

    public void test() {
        renderBooleanResult(new CommentService().deleteByArticle(15));
    }


}
