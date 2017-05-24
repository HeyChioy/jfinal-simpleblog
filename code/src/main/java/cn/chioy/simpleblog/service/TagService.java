package cn.chioy.simpleblog.service;

import cn.chioy.simpleblog.model.Tag;
import cn.chioy.simpleblog.util.Constant;
import com.jfinal.plugin.activerecord.Model;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class TagService extends BaseService {
    protected Model getDao() {
        return Tag.dao;
    }

    protected String getTableName() {
        return Constant.Tables.TAG;
    }

    public Tag getBy(String title){
        String sql = "select * from " + getTableName() + " where title = ?";
        return (Tag) getDao().findFirst(sql, title);
    }
}
