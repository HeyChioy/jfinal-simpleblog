/**
 * Created by seiryuukyuu on 2017/5/13.
 */
;(function () {
    const paging = new Vue({
        el: "#paging"
        , data: {
            pageNumber: 1,
            totalPage: 0
        }
        , methods: {
            older: function () {
                if (BLOG.articles.pager.lastPage) {
                    console.log("is last page..");
                    if (BLOG.notification) {
                        BLOG.notification.show("已经是最后一页啦！")
                    }
                    return;
                }
                BLOG.articles.pager.pageNumber++;
                BLOG.articles.load();
            }
            , newer: function () {
                if (BLOG.articles.pager.firstPage) {
                    console.log("is first page..");
                    if (BLOG.notification) {
                        BLOG.notification.show("已经是第一页啦！")
                    }
                    return;
                }
                BLOG.articles.pager.pageNumber--;
                BLOG.articles.load();
            }
            , go: function () {
                BLOG.articles.pager.pageNumber = this.pageNumber;
                BLOG.articles.load();
            }
        }
    });
    localStorage.setItem("allowPageGo", false)
    window.BLOG = window.BLOG || {};
    window.BLOG.paging = paging;
})();