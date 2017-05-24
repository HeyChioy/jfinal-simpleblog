<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/16
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section class="bg--secondary space--sm">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="boxed boxed--lg boxed--border">
                    <div class="account-tab">
                        <h4>Configs</h4>
                        <form>
                            <div id="configs" class="row">
                                <vue-config btn-one="添加" btn-tow="清空"
                                            v-bind:k="k" v-bind:v="v"
                                            v-on:set="load" v-on:del="clear">
                                </vue-config>
                                <template v-for="(c,idx) in list">
                                    <vue-config
                                            btn-one="更新" btn-tow="删除"
                                            v-on:del="load" v-on:set="load"
                                            v-bind:id="c.id" v-bind:k="c.k"
                                            v-bind:v="c.v"></vue-config>
                                </template>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

