package cn.chioy.simpleblog.util;

/**
 * Created by seiryuukyuu on 2017/4/30.
 */
public class MyPathKit {
    public static String getAdminViewPath(String pathName) {
        return Constant.Strings.DEFAULT_ADMIN_PAGE_PATH + pathName + Constant.Strings.VIEW_TYPE_SUFFIX;
    }
    public static String getViewpath(String pathName) {
        return Constant.Strings.DEFAULT_VIEW_PATH + pathName + Constant.Strings.VIEW_TYPE_SUFFIX;
    }
}
