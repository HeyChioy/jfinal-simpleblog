package cn.chioy.simpleblog.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class Comment extends Model<Comment> {
    public static final Comment dao = new Comment();
}
