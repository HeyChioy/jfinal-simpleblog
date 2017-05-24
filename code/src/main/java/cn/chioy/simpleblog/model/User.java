package cn.chioy.simpleblog.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class User extends Model<User> {
    public static final User dao =  new User();
}
