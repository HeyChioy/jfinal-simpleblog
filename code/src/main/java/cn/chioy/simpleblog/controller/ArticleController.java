package cn.chioy.simpleblog.controller;

import cn.chioy.simpleblog.interceptor.PermissionInterceptor;
import cn.chioy.simpleblog.model.Article;
import cn.chioy.simpleblog.model.Comment;
import cn.chioy.simpleblog.model.User;
import cn.chioy.simpleblog.service.ArticleService;
import cn.chioy.simpleblog.service.ArticleTagService;
import cn.chioy.simpleblog.service.CommentService;
import cn.chioy.simpleblog.util.Constant;
import cn.chioy.simpleblog.util.MyPathKit;
import com.jfinal.aop.Before;


/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class ArticleController extends BaseController {
    private ArticleService service = new ArticleService();

    public void index() {
        render(MyPathKit.getViewpath("article/post"));
    }

    public void read() {
//        Integer id = getParaToInt("id");
        if(getMethodType() == GET){
            render(MyPathKit.getViewpath("article/post"));
            return;
        }
        Integer id = getParaToInt();
        if (id == null) {
            renderMissParam();
            return;
        }

        Article tmp = (Article) service.getById(id);
        Article article = tmp == null ? new Article() : tmp;
        System.out.println(article);
        if(!isAdminUser() && article.getLong("status") != 1){
            renderResult(article.set("title","Sorry").set("content", " > 博主暂时不想显示该文章哦~"));
            return;
        }
        renderResult(article);
    }

    public void page() {
        Integer pageNumber = getParaToInt("pageNumber", 1);
        Integer pageSize = getParaToInt("pageSize", 10);

        Integer status = 1;
        if (isAdminUser()) {
            status = getParaToInt("status", 1);
        }

        Integer categoryId = getParaToInt("category");
        renderResult(categoryId == null ?
                service.listBy(pageNumber, pageSize, status)
                : service.listBy(pageNumber, pageSize, status, categoryId));
    }


    @Before(PermissionInterceptor.class)
    public void delete() {
        if (isDenyMethod(GET)) {
            renderIllegalMethod();
            return;
        }

        Integer preDeleteArticleId = getParaToInt();
        if(preDeleteArticleId == null){
            renderMissParam();
            return;
        }
        deleteCommentAbout(preDeleteArticleId);
        deleteAllArticleTagAbout(preDeleteArticleId);
        deleteArticle(preDeleteArticleId);
    }

    private void deleteCommentAbout(Integer preDeleteArticleId) {
        new CommentService().deleteByArticle(preDeleteArticleId);
    }

    private void deleteAllArticleTagAbout(Integer preDeleteArticleId) {
        new ArticleTagService().deleteByArticleId(preDeleteArticleId);
    }

    private void deleteArticle(Integer preDeleteArticleId) {
        Article article = (Article) service.getById(preDeleteArticleId);
        renderBooleanResult(article == null || service.remove(article));
    }


    @Before(PermissionInterceptor.class)
    public void create() {
        if (isDenyMethod(GET)) {
            render(MyPathKit.getAdminViewPath("article/create"));
            return;
        }
        Article article = new Article();
        User user = getSessionAttr(Constant.Strings.LOGIN_USER);
        getModelFromMap(article);
        if(!checkRequirement(article, new String[]{"title", "content"})){
            return;
        }
        article.set("category", getParaToInt("category", 0));
        article.set("author", user.get("id"));
        article.set("status", getParaToInt("status", 2));
        renderBooleanResult(service.save(article));
    }

    @Before(PermissionInterceptor.class)
    public void update() {
        if (!isAllowMethod(POST)) {
            render(MyPathKit.getAdminViewPath("article/update"));
            return;
        }
        Object id = getPara("id");
        if (id == null) {
            renderMissParam();
            return;
        }
        Article article = (Article) service.getById(id);
        getModelFromMap(article);
        renderBooleanResult(service.update(article));
    }

    public void search() {
        if(!isAllowMethod(POST)){
            renderIllegalMethod();
            return;
        }
        Integer status = 1;
        if (isAdminUser()) {
            status = getParaToInt("status", 1);
        }
        String keyword = getPara("keyword", "");
        renderResult(service.listBy(keyword, status));
    }

}
