package cn.chioy.simpleblog.interceptor;

import com.jfinal.aop.Invocation;

/**
 * Created by seiryuukyuu on 2017/5/24.
 */
public class LoginInterceptor extends BaseInterceptor {
    public void intercept(Invocation invocation) {
        if (!isLogined(invocation)) {
            renderNotLogin(invocation);
        } else {
            invocation.invoke();
        }
    }
}
