package cn.chioy.simpleblog.service;

import cn.chioy.simpleblog.model.Article;
import cn.chioy.simpleblog.util.Constant;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class ArticleService extends BaseService {
    protected Model getDao() {
        return Article.dao;
    }

    protected String getTableName() {
        return Constant.Tables.ARTICLE;
    }

    public List listByCategoryId(int id) {
        String sql = "select * from " + getTableName();
        return getDao().find(sql + " where category = ? ", id);
    }

    public boolean moveTo(Model model, int categoryId) {
        model.set("category", categoryId);
        return update(model);
    }

    public Page listBy(int pageNumber, int pageSize, int status) {
        String select = "select id, status, title , content, createTime ";
        String except = getExceptSql(" where `status` = ? order by id desc");
        return getDao().paginate(pageNumber, pageSize, select, except, status);
    }

    public Page listBy(int pageNumber, int pageSize, int status, int categoryId) {
        String select = "select id, status, title, content, createTime ";
        String except = getExceptSql("where `status` = ? and category = ? order by id desc");
        return getDao().paginate(pageNumber, pageSize, select, except, status, categoryId);
    }

    public List listBy(String keyword, int status) {
        String select = "select id, status,  title, content, createTime ";
        String except = getExceptSql("where `status` = ? and (title like ? or content like ?) order by id desc");
        return getDao().find(select + except, status, like(keyword), like(keyword));
    }


}
