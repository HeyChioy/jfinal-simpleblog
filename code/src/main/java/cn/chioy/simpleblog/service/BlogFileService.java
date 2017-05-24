package cn.chioy.simpleblog.service;

import cn.chioy.simpleblog.model.BlogFile;
import cn.chioy.simpleblog.util.Constant;
import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class BlogFileService extends BaseService {
    protected Model getDao() {
        return BlogFile.dao;
    }

    protected String getTableName() {
        return Constant.Tables.FILE;
    }
}
