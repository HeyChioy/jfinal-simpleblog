package cn.chioy.simpleblog.config;

import cn.chioy.simpleblog.model.*;
import cn.chioy.simpleblog.util.Constant;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class _MappingKit {
    public static void mapping(ActiveRecordPlugin arp) {
        arp.addMapping(Constant.Tables.STATUS, Status.class);
        arp.addMapping(Constant.Tables.LINK, Link.class);
        arp.addMapping(Constant.Tables.FILE, BlogFile.class);
        arp.addMapping(Constant.Tables.CONFIG, cn.chioy.simpleblog.model.Config.class);
        arp.addMapping(Constant.Tables.COMMENT, Comment.class);
        arp.addMapping(Constant.Tables.USER_TYPE, UserType.class);
        arp.addMapping(Constant.Tables.TAG, Tag.class);
        arp.addMapping(Constant.Tables.CATEGORY, Category.class);
        arp.addMapping(Constant.Tables.ARTICLE_TAG, ArticleTag.class);
        arp.addMapping(Constant.Tables.ARTICLE, Article.class);
        arp.addMapping(Constant.Tables.USER, User.class);
    }
}
