/**
 * Created by seiryuukyuu on 2017/5/16.
 */
;(function () {
    const nav = new Vue({
        el:"#nav",
        data:{
            menus:[
                {title:"站点配置",children:[
                    {title:"通用配置",link:"/manage/config"}
                    , {title:"友链配置",link:"/manage/link"}
                    , {title:"文件管理",link:"/manage/file"}
                    , {title:"站点首页", link:"/"}
                ]}
                , {title:"博客管理",children:[
                    {title:"文章列表",link:"/manage/article"}
                    , {title:"分类管理",link:"/manage/category"}
                    , {title:"评论管理", link:"/manage/comment"}
                    , {title:"文件管理", link:"/manage/file"}
                    , {title:"创建新文章", link:"/manage/article/editor"}
                ]}
                , {title:"用户管理",children:[
                    {title:"修改信息",link:"/user/modify"}
                    , {title:"退出登录",link:"/user/logout"}
                ]}
            ]
        }
    });
})();
