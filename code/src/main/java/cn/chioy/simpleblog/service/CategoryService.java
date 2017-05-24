package cn.chioy.simpleblog.service;

import cn.chioy.simpleblog.model.Category;
import cn.chioy.simpleblog.util.Constant;
import com.jfinal.plugin.activerecord.Model;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class CategoryService extends BaseService {
    protected Model getDao() {
        return Category.dao;
    }

    protected String getTableName() {
        return Constant.Tables.CATEGORY;
    }


    public Category getBy(String title){
        return (Category) getDao().findFirst("select * from " + getTableName() + " where title = ?", title);
    }
}
