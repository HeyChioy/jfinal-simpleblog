package cn.chioy.simpleblog.util;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class Constant {
    private Constant() {
    }


    public static final class Strings {
        private Strings() {
        }

        public static final String LOGIN_USER = "LOGIN_USER";

        public static final String ERR_MSG = "请求失败，请重试！";
        public static final String SUC_MSG = "请求成功！";
        public static final String MIS_PRM = "参数缺失！";
        public static final String COMMENT_DELETE_MESSAGE = "该评论已被管理员删除";
        public static final String USER_EXIST = "USER EXIST";
        public static final String USER_NOT_EXIST = "USER NOT EXIST";
        public static final String ILLEGAL_REQUEST_METHOD = "非法请求方式！";
        static final String DEFAULT_ADMIN_PAGE_PATH = "/WEB-INF/admin/";
        static final String DEFAULT_VIEW_PATH = "/WEB-INF/user/";
        static final String VIEW_TYPE_SUFFIX = ".jsp";
    }

    public static final class ResultCode {
        private ResultCode() {
        }

        public static int ERROR = 500;
        public static int SUCCESS = 200;
        public static int MISSING = 404;

    }

    public static final class Tables{
        private Tables(){}
        public static final String USER = "blog_user";
        public static final String USER_TYPE = "blog_user_type";
        public static final String ARTICLE = "blog_article";
        public static final String ARTICLE_TAG = "blog_article_tag";
        public static final String CATEGORY = "blog_category";
        public static final String COMMENT = "blog_comment";
        public static final String CONFIG = "blog_config";
        public static final String FILE = "blog_file";
        public static final String LINK = "blog_link";
        public static final String STATUS = "blog_status";
        public static final String TAG = "blog_tag";
    }

}
