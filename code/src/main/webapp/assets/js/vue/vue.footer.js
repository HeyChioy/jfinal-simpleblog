/**
 * Created by seiryuukyuu on 2017/5/13.
 */
;(function () {
    const footer = new Vue({
        el:'#footer',
        data:{
            year:2017,
            email:'kyuuseiryuu@gmail.com',
            company:"Ryuu Inc.",
            options:[
                {url:"//chioy.cn",title:"RyuuNote"}
            ]
        },
        methods: {
            load: function () {
                console.log("load footer.");
            }
        }
    });
    window.BLOG = window.BLOG || {};
    window.BLOG.footer = footer;
})();
