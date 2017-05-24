/**
 * Created by seiryuukyuu on 2017/5/16.
 */
;(function () {
    const editor = new Vue({
        el: "#editor",
        data: {
            data: {
                status: 0,
                category: 0,
                content: '',
                title: ""
            },
            categories: [],
            statuses: [],
            REMOTE: {
                EDIT: "/article/update",
                CREATE: "/article/create"
            }
            , config: {}

            , tips: {
                title: "标题不能不写噢！"
                , content: "内容不能不写噢！"
            }

        },
        methods: {
            save: function () {
                const url = this.REMOTE[this.config.type];
                const me = this;
                $.post(url, this.data, function (data) {
                    const msg = data.code === 404 ? me.tips[data.msg] : data.msg;
                    BLOG.notification.show(msg);
                    if(data.code !== 200){
                        return;
                    }
                    BLOG.notification.show(msg + " 1.5s 后关闭页面");
                    setTimeout(function () {
                        me.close();
                    }, 1500);
                });
            },
            close: function () {
                if (!window.close()) {
                    window.location = document.referrer;
                }
            },
            convert: function (md) {
                return BLOGUTILS.convert(md);
            }
            , initContent: function (me) {
                const config = BLOGUTILS.useObject("editConfig");
                me.config = config ? config : {type: "CREATE"};
                if (config && config.type === "EDIT") {
                    $.post("/article/read/" + config.id, "", function (data) {
                        me.data = data.data;
                        me.data.status  = me.data.status > 1 ? 0 : me.data.status;
                    });
                }
            }
            , load: function () {
                const me = this;
                me.statuses = [
                      {id:0,title:"草稿"}
                    , {id: 1, title: "发布"}
                ];
                $.post("/category/list", "", function (data) {
                    me.categories = data.data;
                });
                this.initContent(me);
            }
        }
    });
    window.BLOG = window.BLOG || {};
    window.BLOG.editor = editor;
})();