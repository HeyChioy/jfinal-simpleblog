/**
 * Created by seiryuukyuu on 2017/5/18.
 */
;(function () {
    const html = "<div class=\"bg--secondary space--sm\">" +
        " <div class=\"container\"> <div class=\"row\"> <div class=\"col-xs-12\">" +
        " <div class=\"row\"> <div class=\"boxed boxed--lg boxed--border\"> <div class=\"col-xs-8\">" +
        " <input type=\"text\" class=\"col-xs-12\" v-model:value=\"data.title\"> </div> <div class=\"col-xs-4\">" +
        " <div class=\"btn btn-group\"> <a class=\"btn btn--primary type--uppercase\" v-on:click=\"update\">" +
        " <span class=\"btn__text\"> 更新 </span> </a> <a class=\"btn btn--primary-2 type--uppercase\" v-on:click=\"del\">" +
        " <span class=\"btn__text\"> 删除 </span> </a> </div> </div> </div> </div> </div> </div> </div></div>";
    Vue.component("vue-admin-category",{
        template:html,
        props:["title","id"],
        data:function () {
            return {
                data:{
                    title:this.title,
                    id:this.id
                }
            }
        },
        methods:{
            update:function () {
                const me = this;
                console.log("update",me.data.title,me.data.id);
                $.post("/category/delete",{id:me.data.id},function (data) {
                    me.$emit("reload");
                });
            }
            , del: function () {
                const me = this;
                console.log("del", me.data.title, me.data.id);
                $.post("/category/delete",{id:me.data.id,title:me.data.title},function (data) {
                    me.$emit("reload");
                })
            }
        }
    });
})();