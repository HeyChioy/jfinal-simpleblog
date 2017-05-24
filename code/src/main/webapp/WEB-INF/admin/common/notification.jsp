<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/14
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="notification" v-bind:class="{ 'notification--dismissed' : isHidden }" class="notification pos-right pos-bottom col-xs-6 notification--reveal" data-animation="from-right"
     data-notification-link="cookies-1">
    <div class="boxed boxed--border bg--dark border--round">
        <span>{{ message }}</span>
    </div>
</div>
