package cn.chioy.simpleblog.controller;

import cn.chioy.simpleblog.util.Constant;
import cn.chioy.simpleblog.util.Result;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.TableMapping;

import java.util.Map;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class BaseController extends Controller {

    protected static final int GET = 1;
    protected static final int POST = 2;
    protected static final int PUT = 3;
    protected static final int DELETE = 4;
    protected static final int PATCH = 5;
    protected static final int LOCK = 6;
    protected static final int UNLOCK = 7;

    Model getLoginUser() {
        return (Model) getSessionAttr(Constant.Strings.LOGIN_USER);
    }

    void renderBooleanResult(boolean condition) {
        renderBooleanResult(condition, "");
    }

    private void renderBooleanResult(boolean condition, String msg) {
        if (msg.equals("")) {
            if (condition) {
                msg = Constant.Strings.SUC_MSG;
            } else {
                msg = Constant.Strings.ERR_MSG;
            }
        }
        if (condition) {
            renderJson(new Result(Constant.ResultCode.SUCCESS, msg));
        } else {
            renderJson(new Result(Constant.ResultCode.ERROR, msg));
        }
    }

    void renderResult(Object data) {
        renderJson(new Result(Constant.ResultCode.SUCCESS, Constant.Strings.SUC_MSG, data));
    }

    void renderIllegalMethod() {
        renderJson(new Result(Constant.ResultCode.ERROR, Constant.Strings.ILLEGAL_REQUEST_METHOD));
    }

    void renderMissParam() {
        renderJson(new Result(Constant.ResultCode.MISSING));
    }

    void renderMissParam(String missing) {
        renderJson(new Result(Constant.ResultCode.MISSING, missing));
    }

    void renderError(String msg){
        renderJson(new Result(Constant.ResultCode.ERROR, msg));
    }

    /**
     * 以参数为主，查询数据库是否有该字段，有便添加字段数据
     *
     * @param model
     */
    Model getModelFromMap(Model model) {
        Map<String, Class<?>> column = TableMapping.me().getTable(model.getClass()).getColumnTypeMap();
        Map<String, String[]> map = getParaMap();
        for (String k : map.keySet()) {
            if (!column.containsKey(k)) {
                continue;
            }
            String[] values = map.get(k);
            if(values.length > 1){
                model.set(k, values.toString());
            }else{
                model.set(k, values[0]);
            }
        }
        return model;
    }

    int getMethodType() {
        String type = getRequest().getMethod().toUpperCase();
        if (type.equals("GET")) {
            return GET;
        } else if (type.equals("POST")) {
            return POST;
        } else if (type.equals("PUT")) {
            return PUT;
        } else if (type.equals("PATCH")) {
            return PATCH;
        } else if (type.equals("DELETE")) {
            return DELETE;
        } else if (type.equals("LOCK")) {
            return LOCK;
        } else if (type.equals("UNLOCK")) {
            return UNLOCK;
        }
        return GET;
    }

    boolean isDenyMethod(int methodType) {
        if (getMethodType() == methodType) {
            renderJson(new Result(Constant.ResultCode.ERROR, Constant.Strings.ILLEGAL_REQUEST_METHOD));
            return true;
        }
        return false;
    }

    boolean isAllowMethod(int methodType) {
        boolean condition = getMethodType() == methodType;
        if (condition) {
            return true;
        }
        renderJson(new Result(Constant.ResultCode.ERROR, Constant.Strings.ILLEGAL_REQUEST_METHOD));
        return false;
    }

    boolean isAdminUser() {
        return getLoginUser() != null && getLoginUser().getStr("type").toUpperCase().equals("ADMIN");
    }

    boolean checkRequirement(Model model, String[] keys) {
        Map<String, Class<?>> colum = TableMapping.me().getTable(model.getClass()).getColumnTypeMap();
        for (String key : keys) {
            if (!colum.containsKey(key)) {
                continue;
            }
            System.out.println("checking:[ " + key + " = " + model.get(key) + " ]");
            if (model.get(key) == null || model.get(key).equals("")) {
                renderMissParam(key);
                return false;
            }
        }
        return true;
    }

}
