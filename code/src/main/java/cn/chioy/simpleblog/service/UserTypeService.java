package cn.chioy.simpleblog.service;

import cn.chioy.simpleblog.model.UserType;
import cn.chioy.simpleblog.util.Constant;
import com.jfinal.plugin.activerecord.Model;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class UserTypeService extends BaseService {

    protected Model getDao() {
        return UserType.dao;
    }

    protected String getTableName() {
        return Constant.Tables.USER_TYPE;
    }

}
