package cn.chioy.simpleblog.controller;

import cn.chioy.simpleblog.interceptor.LoginInterceptor;
import cn.chioy.simpleblog.interceptor.PermissionInterceptor;
import cn.chioy.simpleblog.model.User;
import cn.chioy.simpleblog.service.UserService;
import cn.chioy.simpleblog.util.Constant;
import cn.chioy.simpleblog.util.MD5;
import cn.chioy.simpleblog.util.MyPathKit;
import cn.chioy.simpleblog.util.Result;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Record;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class UserController extends BaseController {
    private UserService service = new UserService();

    public void login() {
        if (!isAllowMethod(POST)) {
            render(MyPathKit.getAdminViewPath("user/login"));
            return;
        }
        User u = new User();
        getModelFromMap(u);
        if (!checkRequirement(u, new String[]{"username", "passwd"})) {
            return;
        }
        String name = u.getStr("username");
        String passwd = MD5.getMD5U(u.getStr("passwd"));

        if (name.indexOf('@') > 0 && name.lastIndexOf('.') > name.indexOf('@')) {
            u = service.loginByEmail(name.trim().toLowerCase(), passwd);
        } else {
            u = service.loginByName(name.trim().toLowerCase(), passwd);
        }
        if (u == null) {
            renderJson(new Result(Constant.ResultCode.ERROR, "用户名或密码错误！"));
            return;
        }
        setSessionAttr(Constant.Strings.LOGIN_USER, u);
        renderJson(new Result(Constant.ResultCode.SUCCESS, "登陆成功！"));
    }

    @Before(PermissionInterceptor.class)
    public void dashboard() {
        render(MyPathKit.getAdminViewPath("user/dashboard"));
    }

    public void logout() {
        User user = getSessionAttr(Constant.Strings.LOGIN_USER);
        if (user != null) {
            removeSessionAttr(Constant.Strings.LOGIN_USER);
        }
        if (isDenyMethod(GET)) {
            redirect("/user/login");
            return;
        }
        renderJson(new Result(Constant.ResultCode.SUCCESS, "退出成功！"));
    }


    @Before(LoginInterceptor.class)
    public void modify() {
        if (getMethodType() == GET) {
            render(MyPathKit.getAdminViewPath("user/info"));
            return;
        }

        User u = getSessionAttr(Constant.Strings.LOGIN_USER);
        User user = (User) service.getById(u.get("id"));
        getModelFromMap(user);
        renderBooleanResult(user.update());
        setSessionAttr(Constant.Strings.LOGIN_USER, user);
    }

    @Before(LoginInterceptor.class)
    public void changePwd() {
        if (!isAllowMethod(POST)) {
            return;
        }
        String oldPwd = getPara("oldPwd");
        String newPwd = getPara("newPwd");
        if(oldPwd == null || newPwd == null){
            renderMissParam();
        }
        if(newPwd.length() < 6){
            renderError("新密码太短");
            return;
        }
        User user = (User) getLoginUser();
        if (!user.get("passwd").equals(MD5.getMD5U(oldPwd))) {
            renderError("旧密码错误");
            return;
        }
        renderBooleanResult(service.update(user.set("passwd", MD5.getMD5U(newPwd))));
    }

    public void whoami() {
        User user = getSessionAttr(Constant.Strings.LOGIN_USER);
        if (user == null) {
            renderJson(new Result(Constant.ResultCode.ERROR, "WHO ARE YOU?"));
            return;
        }
        Record tmp = user.toRecord();
        tmp.set("isAdmin", isAdminUser());
        System.out.println(tmp.getStr("email"));
        renderResult(tmp.remove("id", "passwd", "type", "createTime", "updateTime"));
    }

    public void isExist() {
        User u = service.getByNameOrEmail(getPara("name"));
        if (u != null) {
            renderJson(new Result(Constant.ResultCode.SUCCESS, Constant.Strings.USER_EXIST));
            return;
        }
        renderJson(new Result(Constant.ResultCode.SUCCESS, Constant.Strings.USER_NOT_EXIST));
    }

}
