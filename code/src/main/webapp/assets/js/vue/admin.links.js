/**
 * Created by seiryuukyuu on 2017/5/16.
 */
;(function () {
    const links = new Vue({
        el: "#links"
        , data: {
            list: []
            , editable: false
        }
        , methods: {
            onEdit: function (link) {
                BLOG.editor.link = link;
                BLOGUTILS.scrollTo("body");
            }
            , onDelete: function (link) {
                const me = this;
                $.ajax({
                    method: "POST",
                    url: "/link/delete",
                    data: {id: link.id},
                    success: function (data) {
                        BLOG.notification.show(data.msg);
                        me.load();
                    }
                });
            }
            , load: function () {
                const me = this;
                me.list = [];
                me.editable = location.pathname === "/manage/link";
                $.post("/link/list", "", function (data) {
                    me.list = data.code === 200 ? data.data : [];
                    console.log("load links.");
                });
            }
        }
    });

    const editor = new Vue({
        el: "#linkEditor"
        , data: {
            link: {}
            , tips: {
                title: "请输入标题"
                , link: "请输入网站链接"
                , summary: "还是写点简介吧"
            }
        }
        , methods: {
            onSubmit: function () {
                const url = '/link/' + (this.link.id ? "update" : "create");
                const me = this;
                console.log(url, this.link);
                $.ajax({
                    method: "POST",
                    url: url,
                    data: me.link,
                    success: function (data) {
                        if (data.code === 200) {
                            me.link = {};
                            links.load();
                        }
                        var msg = data.code === 404  ? me.tips[data.msg] : data.msg;
                        msg = msg ? msg : data.msg;
                        BLOG.notification.show(msg);
                    }
                })
            }
            , onClear: function () {
                this.link = {};
                links.load();
            }
        }
    });
    window.BLOG = window.BLOG || {};
    window.BLOG.links = links;
    window.BLOG.editor = editor;
})();
