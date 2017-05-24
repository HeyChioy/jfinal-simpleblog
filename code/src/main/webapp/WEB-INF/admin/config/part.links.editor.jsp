<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/16
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container col-lg-4">
    <div class="row">
        <div col-xs-12>
            <div class="boxed boxed--lg boxed--border">
                <div id="linkEditor" class="account-tab">
                    <h4>友链管理</h4>
                    <div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label>网站地址:</label>
                                <input type="text" name="Site" v-model="link.link" placeholder="http://your-site.com">
                            </div>
                            <div class="col-sm-6">
                                <label>网站标题:</label>
                                <input type="text" name="display-name" v-model="link.title" placeholder="网站标题">
                            </div>
                            <div class="col-sm-12">
                                <label>网站简介:</label>
                                <textarea v-model="link.summary" rows="4" placeholder="一个简单的网站介绍"></textarea>
                            </div>
                            <div class="col-md-3 col-sm-4" style="margin-top: 20px">
                                <button v-on:click="onSubmit" type="submit" class="btn btn--primary">
                                    {{ link.id ? '更新' : '添加'}}
                                </button>
                            </div>
                            <div class="col-md-3 col-sm-4" style="margin-top: 20px">
                                <button v-on:click="onClear" type="submit" class="btn btn--primary-3">
                                    清空
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>