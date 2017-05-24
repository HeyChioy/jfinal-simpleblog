package cn.chioy.simpleblog.service;

import cn.chioy.simpleblog.model.Status;
import cn.chioy.simpleblog.util.Constant;
import com.jfinal.plugin.activerecord.Model;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class StatusService extends BaseService {
    protected Model getDao() {
        return Status.dao;
    }

    protected String getTableName() {
        return Constant.Tables.STATUS;
    }
}
