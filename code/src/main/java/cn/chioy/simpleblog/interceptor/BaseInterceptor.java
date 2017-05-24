package cn.chioy.simpleblog.interceptor;

import cn.chioy.simpleblog.model.User;
import cn.chioy.simpleblog.service.UserTypeService;
import cn.chioy.simpleblog.util.Constant;
import cn.chioy.simpleblog.util.Result;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

import java.util.Map;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public abstract class BaseInterceptor implements Interceptor {

    boolean isGetMethod(Invocation inv) {
        return inv.getController().getRequest().getMethod().toUpperCase().equals("GET");
    }

    void renderNoPermission(Invocation invocation) {
        invocation.getController().renderJson(new Result(Constant.ResultCode.ERROR, "无访问权限！"));
    }

    void renderNotLogin(Invocation invocation){
        invocation.getController().renderJson(new Result(Constant.ResultCode.ERROR, "您未登陆！"));
    }

    boolean isLogined(Invocation invocation) {
        Controller c = invocation.getController();
        return (c.getSessionAttr(Constant.Strings.LOGIN_USER) != null);
    }

    boolean isAdminUser(Invocation invocation) {
        Controller c = invocation.getController();
        User user = c.getSessionAttr(Constant.Strings.LOGIN_USER);
        String type = user.get("type");
        return type.toUpperCase().equals("ADMIN");
    }


}
