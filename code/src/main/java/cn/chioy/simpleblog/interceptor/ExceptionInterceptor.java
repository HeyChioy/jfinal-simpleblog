package cn.chioy.simpleblog.interceptor;

import cn.chioy.simpleblog.util.Constant;
import cn.chioy.simpleblog.util.Result;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class ExceptionInterceptor implements Interceptor {
    public void intercept(Invocation invocation) {
        try {
            invocation.invoke();
        }catch (Exception e){
            invocation.getController().renderJson(new Result(Constant.ResultCode.ERROR));
        }
    }
}
