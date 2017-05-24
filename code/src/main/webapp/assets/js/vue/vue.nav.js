;(function () {
    /**
     * Created by seiryuukyuu on 2017/5/13.
     */
    const nav = new Vue({
        el: "#nav",
        data: {
            categories: [],
            tags: [],
            category: localStorage.getItem("cateName") || '全部分类'
        },
        methods: {
            load: function () {
                const me = this;
                $.post("/category/list", {}, function (data) {
                    me.categories = data.data;
                });
                this.category = this.category || "全部分类";
                console.log("load nav.");
            }
            , setCategory: function (idx) {
                if (idx === -2) {
                    this.category = "全部分类";
                }
                if (idx === -1) {
                    this.category = "默认分类";
                }
                if (idx > -1) {
                    this.category = this.categories[idx].title;
                }
                BLOG.articles.config.category = idx >= 0 ? this.categories[idx].id : "";
                if (this.isStartPage()) {
                    BLOG.articles.load();
                } else {
                    window.location = "/";
                }
            }
            , isStartPage: function () {
                return window.location.pathname === "/";
            }
            , go: function (url) {
                BLOGUTILS.newPage(url);
            }
        }
    });
    window.BLOG = window.BLOG || {};
    window.BLOG.nav = nav;
})();

;(function () {
    const search = new Vue({
        el: '#search'
        , data: {
            keyword: ''
        }
        , methods: {
            search: function () {
                const me = this;
                $.post("/article/search", {keyword: this.keyword}, function (data) {
                    if (data.code !== 200) {
                        BLOG.notification.show("貌似出了点问题？");
                        return;
                    }
                    BLOG.articles.pager.list = data.data;
                    BLOG.notification.show("已加载搜索结果");
                    BLOGUTILS.scrollTo("#totop-target");

                })
            }
        }
    });

    window.BLOG = window.BLOG || {};
    window.BLOG.search = search;
})();