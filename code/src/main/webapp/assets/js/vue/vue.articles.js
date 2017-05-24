/**
 * Created by seiryuukyuu on 2017/5/13.
 */
;(function () {
    const articles = new Vue({
        el: "#articles",
        data: {
            pager: {
                pageSize: 6,
            },
            config: {
                category: '',
                status: '',
                keyword: ""
            },
            isHidden: true
        },
        methods: {
            date: function (str) {
                return BLOGUTILS.date(str);
            }
            , read: function (id) {
                localStorage.setItem("article", id);
                BLOGUTILS.newPage("/article/read/" + id)
            }
            , load: function (cbk) {
                const me = this;
                const param = {
                    pageSize: me.pager.pageSize,
                    pageNumber: me.pager.pageNumber,
                    category: me.config.category,
                    status: me.config.status,
                    keyword: me.config.keyword
                };
                const url = "/article/" + (param.keyword ? "search" : "page");
                $.post(url, param, function (data) {
                    if ((data.data.length > -1) ? 1 : 0) {
                        me.pager.list = data.data;
                        return;
                    }
                    me.pager = data.data;
                    me.isHidden = false;
                    BLOGUTILS.scrollTo("#totop-target");
                    BLOG.paging.pageNumber = me.pager.pageNumber;
                    BLOG.paging.totalPage = me.pager.totalPage;
                    BLOG.paging.pageNumber = me.pager.pageNumber;
                    cbk ? cbk() : null;
                    console.log("load article.");
                });
            }
            , summary: function (data) {
                return BLOGUTILS.contentSumamry(data);
            }
            , getImage: function (md) {
                const html = BLOGUTILS.convert(md);
                const images = BLOGUTILS.getImage(html);
                const pics = ["blog-1.jpg"
                    , "blog-single-2.jpg"
                    , "cowork-11.jpg"
                    , "dropdown-1.jpg"
                    , "dropdown-2.jpg"
                    , "inner-5.jpg"
                    , "inner-6.jpg"
                ];
                return images[0] ? images[0] : "/assets/img/" + pics[parseInt(Math.random() * 100 % pics.length)];
            }

            , edit: function (id) {
                BLOGUTILS.setObject("editConfig", {type: "EDIT", id: id});
                window.open("/manage/article/editor");
            }

            , del: function (id, status) {
                const me = this;
                if (status === 2) {
                    this.realDel(id);
                    return;
                }
                $.post("/article/update", {id: id, status: 2}, function (data) {
                    BLOG.notification.show("文章已移动至回收站！");
                    me.load();
                });
            }
            , realDel: function (id) {
                const me = this;
                $.post("/article/delete/" + id,"" , function (data) {
                    BLOG.notification.show("这回真删了，回都回不去了～");
                    me.load();
                });
            }

        }
    });
    window.BLOG = window.BLOG || {};
    window.BLOG.articles = articles;
})();
