package cn.chioy.simpleblog.config;

import cn.chioy.simpleblog.controller.*;
import com.jfinal.config.*;
import com.jfinal.core.JFinal;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class Config extends JFinalConfig {


    public void configConstant(Constants constants) {
        PropKit.use("config.properties");
        constants.setDevMode(PropKit.getBoolean("sys_devMode"));
        constants.setEncoding("UTF-8");
        constants.setViewType(ViewType.JSP);
        constants.setBaseUploadPath(PathKit.getWebRootPath() + "/upload");

    }

    public void configRoute(Routes routes) {
        routes.add("/", IndexController.class);
        routes.add("/config", ConfigController.class);
        routes.add("/user", UserController.class);
        routes.add("/article", ArticleController.class);
        routes.add("/articleTag", ArticleTagController.class);
        routes.add("/category", CategoryController.class);
        routes.add("/comment", CommentController.class);
        routes.add("/link",LinkController.class);
        routes.add("/tag",TagController.class);
        routes.add("/file", FileController.class);
        routes.add("/manage", ManageController.class);
    }

    public void configEngine(Engine engine) {

    }

    public void configPlugin(Plugins me) {
        // 配置数据源
        C3p0Plugin c3p0Plugin = createC3p0Plugin();
        me.add(c3p0Plugin);
        // 配置ActiveRecord插件
        ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
        //测试环境显示执行sql，正式环境不显示
        arp.setShowSql(JFinal.me().getConstants().getDevMode());
        me.add(arp);
        // 所有配置在 MappingKit 中搞定
        _MappingKit.mapping(arp);

        //缓存
        EhCachePlugin ehCachePlugin = new EhCachePlugin();
        me.add(ehCachePlugin);

    }

    public void configInterceptor(Interceptors interceptors) {

    }

    public void configHandler(Handlers handlers) {

    }


    /**
     * 创建c3p0数据源
     * @return
     */
    private static C3p0Plugin createC3p0Plugin() {
        C3p0Plugin c3p0Plugin;
        //根据运行模式，加载数据源配置
        c3p0Plugin = new C3p0Plugin(PropKit.get("db_jdbcUrl"),
                PropKit.get("db_user"),
                PropKit.get("db_password"));
        c3p0Plugin.setAcquireIncrement(10);//一次获取连接数
        c3p0Plugin.setInitialPoolSize(50);//初始化获取连接数
        c3p0Plugin.setMaxIdleTime(60);//60秒未使用回收
        c3p0Plugin.setMaxPoolSize(100);//最大连接数
        return c3p0Plugin;
    }
}
