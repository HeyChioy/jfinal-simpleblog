package cn.chioy.simpleblog.service;

import cn.chioy.simpleblog.model.Config;
import cn.chioy.simpleblog.util.Constant;
import com.jfinal.plugin.activerecord.Model;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class ConfigService extends BaseService {
    protected Model getDao() {
        return Config.dao;
    }

    protected String getTableName() {
        return Constant.Tables.CONFIG;
    }

    private Config getBy(String key){
        String select = "select * from " + getTableName();
        String sql = select + " where k = ?";
        return (Config) getDao().findFirst(sql, key);
    }

    public String get(String key){
        Config config = getBy(key);
        if(config == null){
            return "";
        }
        return config.get("v");
    }

    public boolean set(String key, Object value) {
        Config config = getBy(key);
        if(config == null){
            config = new Config();
            config.set("k", key);
            config.set("v", value);
            return save(config);
        }else {
            config.set("v", value);
            return update(config);
        }
    }
}
