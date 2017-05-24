/**
 * Created by seiryuukyuu on 2017/5/16.
 */
;(function () {
    const configs = new Vue({
        el: "#configs"
        , data: {
            list: []
            , k:''
            , v:''
        }

        , methods: {
            load: function () {
                const me = this;
                me.list = [];
                $.post("/config/list", "", function (data) {
                    me.list = data.code === 200 ? data.data : [];
                    console.log("load configs.");
                });
            }
            , clear: function () {
                this.k = '';
                this.v = '';
            }
        }
    });

    window.BLOG = window.BLOG || {};
    window.BLOG.configs = configs;
})();
