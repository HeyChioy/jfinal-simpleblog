package cn.chioy.simpleblog.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class Article extends Model<Article> {
    public static final Article dao = new Article();
}
