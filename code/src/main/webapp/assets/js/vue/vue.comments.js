/**
 * Created by seiryuukyuu on 2017/5/14.
 */
;(function () {
    const comments = new Vue({
        el: "#comments",
        data: {
            comments: [],
            isHidden: true
        }
        , methods: {
            total: function () {
                var t = 0;
                for (var i = 0; i < this.comments.length; i++) {
                    if (this.comments[i].replies.length) {
                        t += this.comments[i].replies.length;
                    }
                    t++;
                }
                return t;
            }
            , hasReplies: function (comment) {
                return !!comment.replies.length;
            }
            , avatar: function (email) {
                return BLOGUTILS.avatar(email);
            }
            , date: function (str) {
                return BLOGUTILS.date(str);
            }
            , makeId: function (email, id) {
                return (email + id).replace(/[\.@]/g,"");
            }
            , load: function (cbk) {
                const articleId = new RegExp(/\b\d+/).exec(window.location.pathname)[0];
                const me = this;
                if (!articleId) {
                    return;
                }
                $.post("/comment/get", {article: articleId}, function (data) {
                    if (data.code === 200) {
                        me.comments = data.data;
                        if (me.comments.length) {
                            me.isHidden = false;
                        }
                    }
                    cbk ? cbk() : null;
                });
                console.log("load comment.");
            }
            , reply: function (id, at) {
                BLOG.reply.makeReply(id, at);
                BLOGUTILS.scrollTo("#reply");
            }
        }
    });

    window.BLOG = window.BLOG || {};
    window.BLOG.comments = comments;
})();
