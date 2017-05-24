/**
 * Created by seiryuukyuu on 2017/5/16.
 */
;(function () {
    Vue.component("vue-config", {
        props: ["id", "k", "v","btnOne","btnTow"]
        , template: "\
        <div class='col-sm-12'>\
            <div class='col-sm-3' style='margin-top: 10px;'>\
                <label>Key:</label>\
                <input v-model='cfg.k' type='text'>\
            </div>\
            <div class='col-sm-3' style='margin-top: 10px;'>\
                <label>Value:</label>\
                <input v-model='cfg.v' type='text'>\
            </div>\
            <div class='col-sm-3 col-sm-offset-0 col-xs-offset-1' style='margin-top: 10px;'>\
            <div style='margin-top:32px;' class='btn btn-group'>\
            <a class='btn btn--primary type--uppercase' v-on:click='set(cfg)'>\
            <span class='btn__text'>{{ btnOne }}</span></a>\
            <a class='btn btn--primary-2 type--uppercase' v-on:click='del(cfg.id)'>\
            <span class='btn__text'>{{ btnTow }}</span></a></div></div></div>"
        , data: function () {
            return {
                cfg: {
                    id: this.id,
                    k: this.k,
                    v: this.v
                }
            }
        }
        , methods: {
            set: function (cfg) {
                const me = this;
                $.post("/config/set", cfg, function (data) {
                    me.$emit("set");
                    if(!me.cfg.id){
                        me.cfg.k = "";
                        me.cfg.v = "";
                    }
                });
            }
            , del: function (id) {
                const me = this;
                me.cfg.k = '';
                me.cfg.v = "";
                if (id){
                    $.ajax({
                        url:"/config/delete/" + id
                        , method:"DELETE"
                        , success:function (data) {
                            me.$emit("del");
                        }
                    });
                    return;
                }
                me.$emit("del");
            }
        }
    })
})();
