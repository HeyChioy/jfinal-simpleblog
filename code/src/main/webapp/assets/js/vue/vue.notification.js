/**
 * Created by seiryuukyuu on 2017/5/14.
 */
;(function () {
    const notification = new Vue({
        el: '#notification',
        data: {
            isHidden: true,
            message: '加载成功！'
        }
        , methods: {
            show: function (message) {
                this.message = message;
                this.isHidden = false;
                const me = this;
                setTimeout(function () {
                    me.isHidden = true;
                }, 1500);
            }
            , hide: function () {
                this.isHidden = true;
            }
        }
    });

    window.BLOG = window.BLOG || {};
    window.BLOG.notification = notification;
})();
