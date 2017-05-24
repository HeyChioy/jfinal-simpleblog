/**
 * Created by seiryuukyuu on 2017/5/15.
 */
;(function () {
    const result = new Vue({
        el:'#result'
        , data: {
            list:[]
            , select:[]
        }
        , methods: {
            summary: function (content) {
                return BLOGUTILS.summary(content);
            }
        }
    });

    window.BLOG = window.BLOG || {};
    window.BLOG.result = result;
})();
