/**
 * Created by seiryuukyuu on 2017/5/24.
 */
;(function () {
    const profile = new Vue({
        el: "#profile",
        data: {
            data: {
                email: '',
                username: ''
            }
        },
        methods: {
            update: function () {
                const me = this;
                if (!this.checked()) {
                    return;
                }
                $.post("", this.data, function (data) {
                    console.log(data);
                    me.load();
                });
            },
            checked: function () {
                return (!!this.data.email && !!this.data.username) && (this.isEmail(this.data.email));
            },
            isEmail: function (email) {
                const lastDot = email.lastIndexOf(".");
                const lastAt = email.lastIndexOf("@");
                return email.split("@").length = 2 && lastDot > lastAt;
            },
            load: function () {
                const me = this;
                $.post("/user/whoami", "", function (data) {
                    if (data.code !== 200) {
                        window.location = "/user/login";
                    } else {
                        me.data = data.data;
                        $("#avatar").attr("src", BLOGUTILS.avatar(data.data.email));
                        $("#username").text(data.data.username);
                        $("#email").text(data.data.email);
                        $("#label").text(data.data.isAdmin ? "Admin" : "User");
                    }
                });
            }
        }
    });
    const password = new Vue({
        el: "#password",
        data: {
            data: {
                oldPwd: '',
                newPwd: '',
                repeat: ''
            }
        },
        methods: {
            changePwd: function () {
                const me = this;
                if (!me.data.oldPwd || !me.data.newPwd) {
                    BLOG.notification.show("旧密码或新密码不能为空");
                    return;
                }
                if (me.data.newPwd != me.data.repeat) {
                    BLOG.notification.show("两次输入的密码不一致");
                    return;
                }
                $.post("/user/changePwd", me.data, function (data) {
                    BLOG.notification.show(data.msg);
                    me.data = {
                        oldPwd: '',
                        newPwd: '',
                        repeat: ''
                    };
                });
            }
        }
    });
    profile.load();
    window.BLOG = window.BLOG || {};
    window.BLOG.profile = profile;
})();
