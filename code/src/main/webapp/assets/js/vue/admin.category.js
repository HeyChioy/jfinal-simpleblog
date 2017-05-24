/**
 * Created by seiryuukyuu on 2017/5/18.
 */
;(function () {
    const categories = new Vue({
        el:"#categories",
        data:{
            categories:[],
            data: {
                title:''
            }
        },
        methods:{
           load: function () {
               const me = this;
               me.categories = [];
               $.post("/category/list","",function (data) {
                   me.categories = data.data;
               });
           }
           , add: function () {
                const me = this;
                if(me.data.title.trim() === ""){
                    BLOG.notification.show("标题不能为空哦~");
                    return;
                }
                $.post("/category/create",me.data,function (data) {
                    me.load();
                });
            }
        }
    });
    categories.load();
})();
