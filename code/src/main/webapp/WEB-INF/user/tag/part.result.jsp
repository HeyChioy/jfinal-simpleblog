<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/15
  Time: 00:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div class="tab__content" id="result">
        <div class="row">
            <template v-for="a in list">
                <div class="col-sm-4">
                    <div class="feature feature-1 boxed boxed--border">
                        <h5>{{ a.title }}</h5>
                    </div>
                    <div>{{ summary(a.content) }}</div>
                    <a v-on:click="read(a.id)">阅读更多</a>
                </div>
            </template>
        </div>
    </div>
</div>
