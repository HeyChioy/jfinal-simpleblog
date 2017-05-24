package cn.chioy.simpleblog.service;

import com.jfinal.plugin.activerecord.Model;

import java.util.Date;
import java.util.List;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public abstract class BaseService {

    protected abstract Model getDao();

    protected abstract String getTableName();

    String getExceptSql(String where) {
        return " from " + getTableName() + " " + where;
    }

    public boolean save(Model model) {
        model.set("createTime", new Date());
        model.set("updateTime", new Date());
        return model.save();
    }

    public boolean update(Model model) {
        model.set("updateTime", new Date());
        return model.update();
    }

    public boolean remove(Model model) {
        return model.delete();
    }

    public List list() {
        String sql = "select * from " + getTableName() + " order by updateTime desc";
        return getDao().find(sql);
    }

    public Model getById(Object id) {
        return getDao().findById(id);
    }

    String like(Object o) {
        return "%" + o + "%";
    }
}
