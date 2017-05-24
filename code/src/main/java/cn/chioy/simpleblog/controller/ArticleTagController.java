package cn.chioy.simpleblog.controller;

import cn.chioy.simpleblog.interceptor.PermissionInterceptor;
import cn.chioy.simpleblog.service.ArticleTagService;
import com.jfinal.aop.Before;
import com.jfinal.json.Json;

/**
 * Created by seiryuukyuu on 2017/4/28.
 */
public class ArticleTagController extends BaseController {

    private ArticleTagService service = new ArticleTagService();

    @Before(PermissionInterceptor.class)
    public void add() {
        if (isDenyMethod(GET)) {
            renderIllegalMethod();
            return;
        }
        Integer articleId = getParaToInt("article");
        Integer tagId = getParaToInt("tag");
        renderBooleanResult(service.add(articleId, tagId));
    }

    @Before(PermissionInterceptor.class)
    public void delete() {
        if (!isAllowMethod(DELETE)) {
            renderIllegalMethod();
            return;
        }
        Integer tagId = getParaToInt("tag");
        Integer articleId = getParaToInt("article");
        if(articleId == null || tagId == null){
            renderMissParam();
            return;
        }
        renderBooleanResult(service.remove(tagId, articleId));
    }

    public void listTag() {
        Integer articleId = getParaToInt("article");
        if (articleId == null) {
            renderMissParam();
            return;
        }
        renderResult(service.listBy(articleId));
    }

    public void listArticle() {
        Integer[] tags = getParaValuesToInt("tags");
        if(tags == null){
            renderMissParam();
            return;
        }
        Integer status = 1;
        if(isAdminUser()){
            status = getParaToInt("status", 1);
        }
        Integer pageNumber = getParaToInt("pageNumber", 1);
        Integer pageSize = getParaToInt("pageSize", 10);
        System.out.println(Json.getJson().toJson(tags));
        renderResult(service.listBy(pageNumber, pageSize, tags, status));
    }

}