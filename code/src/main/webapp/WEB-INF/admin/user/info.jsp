<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/24
  Time: 上午12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="../common/head.jsp"%>
<body>
<%@include file="../common/nav.light.jsp"%>
<div class="main-container">
    <div class="bg--secondary space--sm">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="boxed boxed--lg boxed--border">
                        <div class="text-block text-center">
                            <img id="avatar" alt="avatar" src="/assets/img/avatar-round-3.png" class="image--sm">
                            <span class="h5" id="username"></span>
                            <span id="email"></span>
                            <span id="label" class="label"></span>
                        </div>
                        <hr>
                        <div class="text-block">
                            <ul class="menu-vertical">
                                <li>
                                    <a href="#" data-toggle-class=".account-tab:not(.hidden);hidden|#account-profile;hidden">修改个人信息</a>
                                </li>
                                <li>
                                    <a href="#" data-toggle-class=".account-tab:not(.hidden);hidden|#account-password;hidden" class="">修改密码</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="boxed boxed--lg boxed--border">
                        <div id="account-profile" class="account-tab">
                            <h4>修改个人信息</h4>
                            <div id="profile">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label>用户名:</label>
                                        <input v-model="data.username" v-on:change="update" type="text" name="name" >
                                    </div>
                                    <div class="col-sm-6">
                                        <label>电子邮箱:</label>
                                        <input v-model="data.email" v-on:change="update" type="email" name="email">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="account-password" class="account-tab hidden">
                            <h4>修改密码</h4>
                            <p>密码必须不少于6个字符</p>
                            <div id="password">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <label>旧密码:</label>
                                        <input v-model="data.oldPwd" type="password" name="old-password">
                                    </div>
                                    <div class="col-sm-6">
                                        <label>新密码:</label>
                                        <input v-model="data.newPwd" type="password" name="new-password">
                                    </div>
                                    <div class="col-sm-6">
                                        <label>重复新密码:</label>
                                        <input v-model="data.repeat" type="password" name="new-password-confirm">
                                    </div>
                                    <div class="col-md-3 col-sm-4" style="margin-top: 10px">
                                        <button v-on:click="changePwd" type="submit" class="btn btn--primary type--uppercase">修改密码</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../common/notification.jsp"%>
</div>
<%@include file="../common/script.jsp"%>
<script src="/assets/js/vue/admin.nav.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/vue.notification.js"></script>
<script src="/assets/js/vue/admin.user.info.js?t=<%=new Date().getTime()%>"></script>
</body>
</html>
