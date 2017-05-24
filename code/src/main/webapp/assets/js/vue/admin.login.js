/**
 * Created by seiryuukyuu on 2017/5/15.
 */
;(function () {
    const login = new Vue({
        el: '#login'
        , data: {
            form: {
                username: ''
                , passwd: ''
            }
            , tips: {
                username: '你谁呀？'
                , passwd: '密码啥？'

            }
        }
        , methods: {
            onSubmit: function () {
                const me = this;
                $.post("/user/login", me.form, function (data) {
                    if (data.code !== 200) {
                        const msg = me.tips[data.msg] ? me.tips[data.msg] : data.msg;
                        BLOG.notification.show(msg);
                        return;
                    }
                    window.location = "/manage/article";
                });
            }
        }
    });
})();
