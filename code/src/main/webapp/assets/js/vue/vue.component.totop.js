/**
 * Created by seiryuukyuu on 2017/5/14.
 */
;(function () {
    Vue.component("vue-totop", {
        props:['target']
        , template: "<a class=\"back-to-top active \" v-on:click=\"scroll\" id=\"totop\">\
        <i class=\"stack-interface stack-up-open-big\"></i>\
        </a>"
        , methods: {
            scroll: function () {
                BLOGUTILS.scrollTo(this.target);
            }
        }
    });
})();
