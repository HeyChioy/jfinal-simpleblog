package cn.chioy.simpleblog.interceptor;

import cn.chioy.simpleblog.util.MyPathKit;
import com.jfinal.aop.Invocation;

/**
 * Created by seiryuukyuu on 2017/4/28.
 */
public class PermissionInterceptor extends BaseInterceptor{
    public void intercept(Invocation invocation) {
        if(!isLogined(invocation) || !isAdminUser(invocation)){
            if (isGetMethod(invocation)) {
                invocation.getController().render(MyPathKit.getAdminViewPath("user/login"));
                return;
            }
            renderNoPermission(invocation);
            return;
        }
        invocation.invoke();
    }
}
