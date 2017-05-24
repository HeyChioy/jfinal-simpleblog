package cn.chioy.simpleblog.service;

import cn.chioy.simpleblog.bean.CommentBean;
import cn.chioy.simpleblog.model.Comment;
import cn.chioy.simpleblog.util.Constant;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class CommentService extends BaseService {
    protected Model getDao() {
        return Comment.dao;
    }

    protected String getTableName() {
        return Constant.Tables.COMMENT;
    }

    private Object findReplayId(Comment comment) {
        System.out.println("findReportTd:" + comment);
        if (comment.getInt("replyTo") == 0) {
            return 0;
        }
        Comment preReport = (Comment) getById(comment.get("replyTo"));
        if (preReport == null) {
            return 0;
        }
        Long replyTo = preReport.get("replyTo");
        while (replyTo != 0) {
            preReport = (Comment) getById(preReport.get("replyTo"));
            replyTo = preReport.get("replyTo");
        }
        return preReport.get("id");
    }

    public boolean addComment(Comment comment) {
        comment.set("replyTo", findReplayId(comment));
        return save(comment);
    }

    public boolean deleteByComment(Comment comment) {
        deleteReply(comment.get("id"));
        return comment.delete();
    }

    public boolean deleteByArticle(int articleId) {
        List list = getDao().find("select * from " + getTableName() + " where article = ?", articleId);
        for (Object o : list) {
            if (!((Comment) o).delete()) {
                return false;
            }
        }
        return true;
    }

    private void deleteReply(Object commentId) {
        List lst = getReportFrom(commentId);
        for (Object l : lst) {
            ((Comment) l).delete();
        }
    }

    private List getReportFrom(Object commentId) {
        return getDao().find("select * from " + getTableName() + " where replyTo = ?", commentId);
    }

    public Object getAll(Integer articleId) {
        ArrayList<CommentBean> list = new ArrayList<CommentBean>();
        String sql = "select id, email, site, nickname, content, createTime from blog_comment where article = ? and replyTo = ?";
        List mainComment = getDao().find(sql + " order by createTime desc", articleId, 0);
        for (Object c : mainComment) {
            CommentBean bean = new CommentBean();
            bean.setComment((Comment) c);
            List replies = getDao().find(sql, articleId, ((Comment) c).get("id"));
            for (Object r : replies) {
                bean.getReplies().add((Comment) r);
            }
            list.add(bean);
        }
        return list;
    }

    public Page paging(int pageNumber, int pageSize) {
        String select = "select b.id, a.title, b.nickname, b.nickname, b.site, b.content, b.email ";
        String exp = "from blog_article a, blog_comment b where a.id = b.article order by b.id desc";
        return getDao().paginate(pageNumber, pageSize, select, exp);
    }

    public List listAll() {
        String sql = "select b.id,a.id article, a.title, b.nickname, " +
                "b.nickname, b.site,b.content, b.email " +
                "from blog_article a, blog_comment b where a.id = b.article order by b.id desc";

        return getDao().find(sql);
    }

    public Record listAbout(int commentId) {
        Record record = new Record();
        Comment comment = (Comment) getById(commentId);
        if (comment == null) {
            return null;
        }
        Comment root = comment.getLong("replyTo") == 0 ? comment : (Comment) getById(comment.get("replyTo"));
        record.set("root", root);
        record.set("children", getReportFrom(root.get("id")));
        return record;
    }

}
