package cn.chioy.simpleblog.controller;


import cn.chioy.simpleblog.interceptor.PermissionInterceptor;
import cn.chioy.simpleblog.service.ConfigService;
import cn.chioy.simpleblog.util.MyPathKit;
import com.jfinal.aop.Before;

/**
 * Created by seiryuukyuu on 2017/4/28.
 */
public class ConfigController extends BaseController {


    ConfigService service = new ConfigService();

    public void index() {
        render(MyPathKit.getAdminViewPath("config/config"));
    }

    public void list() {
        renderResult(service.list());
    }

    @Before(PermissionInterceptor.class)
    public void set() {
        if(!isAllowMethod(POST)){
            renderIllegalMethod();
            return;
        }
        renderResult(
                service.set(getPara("k", "untitled"),
                        getPara("v", "undefined")));
    }

    public void get() {
        renderResult(service.get(getPara("k", "")));
    }


    @Before(PermissionInterceptor.class)
    public void delete() {
        if(!isAllowMethod(DELETE)){
            renderIllegalMethod();
            return;
        }
        Integer id = getParaToInt();
        if(id == null){
            renderMissParam();
            return;
        }
        renderBooleanResult(service.remove(service.getById(id)));
    }
}
