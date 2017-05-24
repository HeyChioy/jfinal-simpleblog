package cn.chioy.simpleblog.service;

import cn.chioy.simpleblog.model.Link;
import cn.chioy.simpleblog.util.Constant;
import com.jfinal.plugin.activerecord.Model;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class LinkService extends BaseService {
    protected Model getDao() {
        return Link.dao;
    }

    protected String getTableName() {
        return Constant.Tables.LINK;
    }


}
