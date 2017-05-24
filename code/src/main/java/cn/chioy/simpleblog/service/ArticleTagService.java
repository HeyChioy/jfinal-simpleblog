package cn.chioy.simpleblog.service;


import cn.chioy.simpleblog.model.ArticleTag;
import cn.chioy.simpleblog.model.Tag;
import cn.chioy.simpleblog.util.Constant;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class ArticleTagService extends BaseService {

    protected Model getDao() {
        return ArticleTag.dao;
    }

    protected String getTableName() {
        return Constant.Tables.ARTICLE_TAG;
    }

    private ArticleTag getBy(int articleId, int tagId) {
        String select = "select * from " + Constant.Tables.ARTICLE_TAG;
        String sql = select + " where article = ? and tag = ?";
        return ArticleTag.dao.findFirst(sql, articleId, tagId);
    }


    public boolean add(int articleId, int tagId) {
        if (getBy(articleId, tagId) != null) {
            return false;
        }
        ArticleTag articleTag = new ArticleTag();
        articleTag.set("article", articleId);
        articleTag.set("tag", tagId);
        return save(articleTag);
    }

    public boolean remove(int tagId, int articleId) {
        ArticleTag articleTag = getBy(articleId, tagId);
        return articleTag == null || articleTag.delete();
    }


    public List listBy(int articleId) {
        String select = "select tag.* from " + Constant.Tables.ARTICLE_TAG;
        String sql = select + " atag, " + Constant.Tables.TAG + " tag where " +
                " atag.tag = tag.id and " +
                " atag.article = ? ";
        return getDao().find(sql, articleId);
    }

    public Page listBy(int pageNumber, int pageSize, Integer[] tags, int status) {
        String select = "select article.*";

        StringBuilder sb = new StringBuilder("from " + Constant.Tables.ARTICLE + " article, " +
                Constant.Tables.ARTICLE_TAG + " tag " +
                " where article.`status` = ?" +
                " and article.id = tag.article");
        for (Integer i : tags) {
            sb.append(" and tag.tag = ").append(i);
        }
        String except = sb.toString();
        return getDao().paginate(pageNumber, pageSize, select, except, status);
    }

    public boolean deleteByTagId(Integer tagId) {
        String sql = "select * from " + getTableName() + " where tag = ?";
        List list = getDao().find(sql, tagId);
        for(Object o : list){
            if(!((ArticleTag)o).delete()){
                return false;
            }
        }
        return true;
    }

    public boolean deleteByArticleId(Integer articleId) {

        String sql = "select * from " + getTableName() + " where article = ?";
        List list = getDao().find(sql, articleId);
        for(Object o : list){
            if(!((ArticleTag)o).delete()){
                return false;
            }
        }
        return true;
    }
}
