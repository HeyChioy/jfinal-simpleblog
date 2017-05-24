<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/16
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <div class="container">
        <div id="search" class="row">
            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                <input v-model="keyword" type="text" placeholder="文章关键字">
            </div>
            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                <select v-model="category">
                    <option value="">所有分类</option>
                    <option value="0">默认分类</option>
                    <template v-for="c in categories">
                        <option v-bind:value="c.id">{{ c.title }}</option>
                    </template>
                </select>
            </div>
            <div class="col-xs-12 col-sm-2 col-md-3 col-lg-3">
                <select v-model="status">
                    <template v-for="s in statuses">
                        <option v-bind:value="s.id">{{ s.title }}</option>
                    </template>
                </select>
            </div>
            <div class="col-xs-12 col-sm-2 col-md-3 col-lg-3">
                <button v-on:click="onSubmit" class="btn btn-primary col-xs-12">搜索</button>
            </div>

        </div>
    </div>
</section>
