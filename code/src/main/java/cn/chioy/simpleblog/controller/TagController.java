package cn.chioy.simpleblog.controller;

import cn.chioy.simpleblog.interceptor.PermissionInterceptor;
import cn.chioy.simpleblog.model.Tag;
import cn.chioy.simpleblog.service.ArticleTagService;
import cn.chioy.simpleblog.service.TagService;
import cn.chioy.simpleblog.util.MyPathKit;
import com.jfinal.aop.Before;

/**
 * Created by seiryuukyuu on 2017/4/28.
 */
public class TagController extends BaseController {
    private TagService service = new TagService();

    public void index() {
        render(MyPathKit.getViewpath("tag/index"));
    }

    @Before(PermissionInterceptor.class)
    public void create() {
        if (!isAllowMethod(POST)) {
            renderIllegalMethod();
            return;
        }
        String tagname = getPara("title");
        if (tagname == null || tagname.equals("")) {
            renderMissParam();
            return;
        }
        if (service.getBy(tagname) != null) {
            renderBooleanResult(true);
            return;
        }
        Tag tag = new Tag();
        tag.set("title", tagname);
        renderBooleanResult(service.save(tag));
    }

    @Before(PermissionInterceptor.class)
    public void update() {
        if (!isAllowMethod(PUT)) {
            renderIllegalMethod();
            return;
        }
        Integer id = getParaToInt("id");
        String tagname = getPara("title");
        if (id == null || tagname == null || tagname.equals("")) {
            renderMissParam();
            return;
        }
        Tag tag = (Tag) service.getById(id);
        tag.set("title", tagname);
        renderBooleanResult(service.update(tag));
    }

    @Before(PermissionInterceptor.class)
    public void delete() {
        if (!isAllowMethod(DELETE)) {
            renderIllegalMethod();
            return;
        }
        Integer id = getParaToInt("id");
        if (id == null) {
            renderMissParam();
            return;
        }
        Tag tag = (Tag) service.getById(id);
        new ArticleTagService().deleteByTagId(id);
        renderBooleanResult(service.remove(tag));
    }

    public void list() {
        renderResult(service.list());
    }
}
