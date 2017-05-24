/**
 * Created by seiryuukyuu on 2017/5/15.
 */
;(function () {
    const tags = new Vue({
        el: '#tags'
        , data: {
              tags: []
            , list: []
        }
        , methods: {
            load: function () {
                const me = this;
                $.post("/tag/list", function (data) {
                    if (data.code === 200) {
                        me.list = data.data;
                    }
                });
            }

            , search: function () {
                const me = this;
                $.post("/articleTag/listArticle", {tags: me.selector}, function (data) {
                    BLOG.result.list = data.code === 200 ? data.data : [];
                });
            }
            , click: function (id) {
                console.log(id);
                $(id).click();
                return false;
            }
            , hock: function (who) {
                console.log(who);
            }
        }
    });

    window.BLOG = window.BLOG || {};
    window.BLOG.tags = tags;
})();