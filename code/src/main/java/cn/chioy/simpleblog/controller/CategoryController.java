package cn.chioy.simpleblog.controller;

import cn.chioy.simpleblog.interceptor.PermissionInterceptor;
import cn.chioy.simpleblog.model.Article;
import cn.chioy.simpleblog.model.Category;
import cn.chioy.simpleblog.service.ArticleService;
import cn.chioy.simpleblog.service.CategoryService;
import com.jfinal.aop.Before;

import java.util.List;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class CategoryController extends BaseController {

    private CategoryService service = new CategoryService();


    public void list() {
        renderResult(service.list());
    }


    @Before(PermissionInterceptor.class)
    public void create() {
        if (!isAllowMethod(POST)) {
            renderIllegalMethod();
            return;
        }
        String title = getPara("title");
        if (title == null) {
            renderMissParam();
            return;
        }

        if (service.getBy(title) != null) {
            renderBooleanResult(true);
            return;
        }

        Category category = new Category();
        category.set("title", title);
        renderBooleanResult(service.save(category));
    }

    @Before(PermissionInterceptor.class)
    public void update() {
        if (!isAllowMethod(PUT)) {
            renderIllegalMethod();
            return;
        }
        Integer id = getParaToInt("id");
        String title = getPara("title");
        if (id == null || title == null) {
            renderMissParam();
            return;
        }

        Category category = (Category) service.getById(id);
        category.set("title", title);
        renderBooleanResult(service.update(category));
    }

    @Before(PermissionInterceptor.class)
    public void delete() {
        if (!isAllowMethod(POST)) {
            renderIllegalMethod();
            return;
        }

        Integer preDeleteCateId = getParaToInt("id");
        if (preDeleteCateId == null) {
            renderMissParam();
            return;
        }

        moveArticleToDefaultCategory(preDeleteCateId);
        deleteCategory(preDeleteCateId);
    }

    private void moveArticleToDefaultCategory(Integer id) {
        ArticleService articleService = new ArticleService();
        List articles = articleService.listByCategoryId(id);
        for (Object article : articles) {
            articleService.moveTo((Article) article, 0);
        }
    }

    private void deleteCategory(Integer id) {
        Category category = (Category) service.getById(id);
        renderBooleanResult(category == null || service.remove(category));
    }


}
