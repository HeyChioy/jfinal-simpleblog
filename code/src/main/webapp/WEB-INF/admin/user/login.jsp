<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/4/27
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="../common/head.jsp" %>
<body>
<div class="main-container">
    <section class="height-100 imagebg text-center" data-overlay="4">
        <div class="background-image-holder" style="background: url(/assets/img/inner-6.jpg); opacity: 1;">
            <img alt="background" src="/assets/img/inner-6.jpg">
        </div>
        <div class="container pos-vertical-center">
            <div class="row">
                <div class="col-sm-7 col-md-5">
                    <h2>Login to continue</h2>
                    <p class="lead">
                        欢迎回来, 登陆你的 SimpleBlog
                    </p>
                    <form id="login" v-on:submit.prevent="onSubmit">
                        <div class="row">
                            <div class="col-sm-12">
                                <input v-model="form.username" type="text" placeholder="Username">
                            </div>
                            <div class="col-sm-12">
                                <input v-model="form.passwd" type="password" placeholder="Password">
                            </div>
                            <div class="col-sm-12">
                                <button class="btn btn--primary type--uppercase" type="submit">Login</button>
                            </div>
                        </div>
                        <!--end of row-->
                    </form>
                    <%--<span class="type--fine-print block">Dont have an account yet?--%>
                    <%--<a href="page-accounts-create-1.html">Create account</a>--%>
                    <%--</span>--%>
                    <%--<spanV class="type--fine-print block">Forgot your username or password?--%>
                    <%--<a href="page-accounts-recover.html">Recover account</a>--%>
                    <%--</span>--%>
                </div>
            </div>
            <!--end of row-->
        </div>
        <!--end of container-->
    </section>
    <%@include file="../common/notification.jsp"%>
</div>
<% long date = new Date().getTime(); %>
<%@include file="../common/script.jsp" %>
<script src="/assets/js/vue/admin.login.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.notification.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.init.js"></script>
<script src="/assets/js/vue/vue.head.js"></script>
</body>
</html>
