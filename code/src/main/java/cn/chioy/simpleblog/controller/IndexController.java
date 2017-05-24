package cn.chioy.simpleblog.controller;

import cn.chioy.simpleblog.util.MyPathKit;

/**
 * Created by seiryuukyuu on 2017/5/9.
 */
public class IndexController extends BaseController {
    public void index() {
        render(MyPathKit.getViewpath("article/index"));
    }

    public void t() {
        renderText("TEST");
    }
}
