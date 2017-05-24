<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/18
  Time: 下午1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="categories">
    <div class="bg--secondary space--sm">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="row">
                        <div class="boxed boxed--lg boxed--border">
                            <div class="col-xs-8">
                                <input v-model="data.title" type="text" class="col-xs-12">
                            </div>
                            <div class="col-xs-4">
                                <a v-on:click="add" class="btn btn--primary-1 type--uppercase">
                                    <span class="btn__text">添加</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <template v-for="c in categories">
        <vue-admin-category v-bind:title="c.title" v-bind:id="c.id" v-on:reload="load"></vue-admin-category>
    </template>
</div>
