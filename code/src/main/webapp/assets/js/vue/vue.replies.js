/**
 * Created by seiryuukyuu on 2017/5/14.
 */
;(function () {
    const reply = new Vue({
        el: "#reply",
        data: {
            isHidden: false,
            comment: {
                nickname: navigator.appVersion.replace(/[\(\)\;]/g, "").split(" ")[1] + " 用户",
                article: location.pathname.substr(location.pathname.lastIndexOf("/") + 1),
                content: "",
                site: location.protocol + "//" + location.host
            }
            , at: ''
            , cmtIdx: -2
            , tips: {
                email: "请输入邮箱"
                , content: "评论怎么能不写呢～"
                , nickname: "请填写昵称，告诉我你怎么称呼～"
                , site: "站点是啥？加个友链也好哇～"
            }

        },
        methods: {
            onSubmit: function () {
                const me = this;
                if (me.comment.content.indexOf("@") < 0) {
                    me.comment.replyTo = 0;
                }

                $.post("/comment/create", this.comment, function (data) {
                    if (data.code === 200) {
                        me.onSuccess();
                        BLOG.notification.show(data.msg);
                    }
                    if (data.code === 404) {
                        BLOG.notification.show(me.tips[data.msg]);
                    }

                });
            }
            , makeReply: function (idx, nickname) {
                this.cmtIdx = idx;
                const cmt = BLOG.comments.comments[idx];
                this.comment.replyTo = cmt.comment.id;
                this.comment.content += "@" + nickname + "  ";
            }
            , onSuccess: function () {
                const me = this;
                BLOG.comments.load(function () {
                    var id;
                    if (me.cmtIdx > -1) {
                        const cmt = BLOG.comments.comments[me.cmtIdx].comment;
                        id = "#" + BLOG.comments.makeId(cmt.email, cmt.id);
                    } else {
                        id = "hr";
                    }
                    BLOGUTILS.scrollTo(id);
                    me.comment.content = "";
                });
            }
        }
    });

    window.BLOG = window.BLOG || {};
    window.BLOG.reply = reply;
})();
