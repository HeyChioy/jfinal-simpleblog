<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/16
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section class="bg--secondary space--sm">
    <div class="container">
        <div id="editor" class="row">
            <div class="col-md-12 col-lg-6">
                <div class="boxed boxed--lg boxed--border">
                    <div class="account-tab">
                        <h4>编辑文章</h4>
                        <div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <label>文章标题</label>
                                    <input v-model="data.title" type="text">
                                </div>
                                <div class="col-xs-12 col-md-6">
                                    <label>所属分类</label>
                                    <select v-model="data.category">
                                        <option value="0">默认分类</option>
                                        <template v-for="c in categories">
                                            <option v-bind:value="c.id">{{c.title}}</option>
                                        </template>
                                    </select>
                                </div>
                                <div class="col-xs-12 col-md-6">
                                    <label>文章状态</label>
                                    <select v-model="data.status">
                                        <template v-for="c in statuses">
                                            <option v-bind:value="c.id">{{c.title}}</option>
                                        </template>
                                    </select>
                                </div>
                                <div class="col-xs-12">
                                    <label>正文</label>
                                    <textarea v-model="data.content" rows="13"></textarea>
                                </div>
                                <div class="col-xs-6" style="margin-top: 20px">
                                    <a v-on:click="save" class="btn btn-primary col-xs-12">
                                    <span class="btn__text">
                                        发布
                                    </span>
                                    </a>
                                </div>
                                <div class="col-xs-6" style="margin-top: 20px">
                                    <a v-on:click="close" class="btn btn-primary-2 col-xs-12">
                                    <span class="btn__text">
                                        取消(关闭）
                                    </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-lg-6">
                <div class="boxed boxed--lg boxed--border">
                    <div class="account-tab">
                        <h4>预览</h4>
                        <div>
                            <div class="row">
                                <div class="row text-center">
                                    <h4>{{ data.title }}</h4>
                                </div>
                            </div>
                            <div class="row">
                                <div v-html="convert(data.content)"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
