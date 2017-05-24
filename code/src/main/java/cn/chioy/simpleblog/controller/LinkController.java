package cn.chioy.simpleblog.controller;

import cn.chioy.simpleblog.interceptor.PermissionInterceptor;
import cn.chioy.simpleblog.model.Link;
import cn.chioy.simpleblog.service.LinkService;
import cn.chioy.simpleblog.util.Constant;
import cn.chioy.simpleblog.util.Result;
import com.jfinal.aop.Before;

/**
 * Created by seiryuukyuu on 2017/4/28.
 */
public class LinkController extends BaseController {

    private LinkService service = new LinkService();

    @Before(PermissionInterceptor.class)
    public void create() {
        if (!isAllowMethod(POST)) {
            renderIllegalMethod();
            return;
        }
        Link link = new Link();
        getModelFromMap(link);
        if (!checkRequirement(link, new String[]{"title", "link", "summary"})) {
            return;
        }
        renderBooleanResult(service.save(link));
    }


    @Before(PermissionInterceptor.class)
    public void update() {
        if (!isAllowMethod(POST)) {
            renderIllegalMethod();
            return;
        }
        Integer id = getParaToInt("id");
        if (id == null) {
            renderMissParam();
            return;
        }
        Link link = (Link) service.getById(id);

        renderBooleanResult(link == null || service.update(getModelFromMap(link)));
    }

    @Before(PermissionInterceptor.class)
    public void delete() {
        Integer id = getParaToInt("id");
        if (id == null) {
            renderJson(new Result(Constant.ResultCode.MISSING));
            return;
        }
        Link link = (Link) service.getById(id);
        renderBooleanResult(link == null || service.remove(link));
    }

    public void list() {
        renderResult(service.list());
    }

}
