package cn.chioy.simpleblog.service;

import cn.chioy.simpleblog.model.User;
import cn.chioy.simpleblog.util.Constant;
import com.jfinal.plugin.activerecord.Model;


/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class UserService extends BaseService {


    protected Model getDao() {
        return User.dao;
    }

    protected String getTableName() {
        return Constant.Tables.USER;
    }

    public User loginByName(String name, String passwd) {
        return login("username", name, passwd);
    }

    public User loginByEmail(String email, String passwd) {
        return login("email", email, passwd);
    }

    private User login(String type, String nameOrMail, String passwd) {
        String sql = "select * from " + getTableName() + " where `" + type + "` = ? and `passwd` =  ?";
        return (User) getDao().findFirst(sql, nameOrMail, passwd);
    }

    public User getByNameOrEmail(String name) {
        String select = "select * from " + getTableName();
        String sql = select + " where email = ? or name = ?";
        return (User) getDao().findFirst(sql, name, name);
    }
}
