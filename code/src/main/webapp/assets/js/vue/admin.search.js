/**
 * Created by seiryuukyuu on 2017/5/16.
 */
;(function () {
    const search = new Vue({
        el: "#search",
        data: {
            categories: [],
            statuses: [
                {title: "草稿", id: 0},
                {title: "已发布", id: 1},
                {title: "已删除", id: 2}
            ],
            category: '',
            status: '1',
            keyword: ''
        },
        methods: {
            load: function () {
                this.loadCategories();
            },

            loadCategories: function () {
                const me = this;
                $.post("/category/list", "", function (data) {
                    if (data.code === 200) {
                        me.categories = data.data;
                    }
                });
            },

            onSubmit: function () {
                BLOG.articles.config.keyword = this.keyword;
                BLOG.articles.config.category = this.category;
                BLOG.articles.config.status = this.status;
                BLOG.articles.load();
            }
        }
    });
    search.load();
})();
