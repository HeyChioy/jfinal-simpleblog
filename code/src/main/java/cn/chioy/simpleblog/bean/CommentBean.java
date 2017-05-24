package cn.chioy.simpleblog.bean;

import cn.chioy.simpleblog.model.Comment;

import java.util.ArrayList;

/**
 * Created by seiryuukyuu on 2017/5/14.
 */
public class CommentBean {
    private Comment comment;
    private ArrayList<Comment> replies = new ArrayList<Comment>();

    public Comment getComment() {
        return comment;
    }

    public CommentBean setComment(Comment comment) {
        this.comment = comment;
        return this;
    }

    public ArrayList<Comment> getReplies() {
        return replies;
    }

    public CommentBean setReplies(ArrayList<Comment> replies) {
        this.replies = replies;
        return this;
    }
}
