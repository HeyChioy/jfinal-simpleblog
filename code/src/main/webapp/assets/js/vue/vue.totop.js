/**
 * Created by seiryuukyuu on 2017/5/14.
 */
/**
 * 非组件模式
 */
/*
;(function () {

    var totop = new Vue({
        el: "#totop",
        data: {
            target: 'body'
        }
        , methods: {
            scroll: function () {
                BLOGUTILS.scrollTo(this.target);
            }
            , load: function (target) {
                this.target = target || "body";
                console.log("load totop.");
            }
        }
    });
    window.BLOG = window.BLOG || {};
    window.BLOG.totop = totop;
})();
*/
/**
 * 组件模式
 */
;(function () {
    const topot = new Vue({
        el:"#totop"
    })
})();
