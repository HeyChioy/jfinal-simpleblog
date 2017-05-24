/**
 * Created by seiryuukyuu on 2017/5/13.
 */
;(function () {
    const converter = new showdown.Converter();
    const post = new Vue({
        el: "#post",
        data: {
            article: {}
        },
        methods: {
            load: function () {
                const me = this;
                $.post("", {}, function (data) {
                    if(!data.data.id){
                        window.location = "/";
                    }
                    me.article = data.data;
                });
                setTimeout(function () {
                    BLOGUTILS.scrollTo("#post");
                }, 200);
                console.log("load post.");
            },
            convert: function () {
                return converter.makeHtml(this.article.content);
            },
            date: function (str) {
                return BLOGUTILS.date(str);
            }
        }
    });
    window.BLOG = window.BLOG || {};
    window.BLOG.post = post;
})();
