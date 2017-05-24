<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/14
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="nav-container ">
    <div class="bar bar--sm visible-xs">
        <div class="container">
            <div class="row">
                <div class="col-xs-3 col-sm-2">
                    <a href="/">
                        <img class="logo logo-dark" alt="logo" src="/assets/img/logo-dark.png" />
                        <img class="logo logo-light" alt="logo" src="/assets/img/logo-light.png" />
                    </a>
                </div>
                <div class="col-xs-9 col-sm-10 text-right">
                    <a href="#" class="hamburger-toggle" data-toggle-class="#menu1;hidden-xs">
                        <i class="icon icon--sm stack-interface stack-menu"></i>
                    </a>
                </div>
            </div>
            <!--end of row-->
        </div>
        <!--end of container-->
    </div>
    <!--end bar-->
    <nav id="menu1" class="bar bar--sm bar-1 hidden-xs hiddem-sm bar--absolute bar--transparent">
        <div class="container">
            <div class="row">
                <div class="col-md-1 col-sm-2 hidden-xs">
                    <div class="bar__module">
                        <a href="/">
                            <img class="logo logo-dark" alt="logo" src="/assets/img/logo-dark.png" />
                            <img class="logo logo-light" alt="logo" src="/assets/img/logo-light.png" />
                        </a>
                    </div>
                    <!--end module-->
                </div>
                <div class="col-md-8 col-sm-6 hidden-xs">
                    <div class="bar__module">
                        <div id="search" class="col-md-6">
                            <div class="bar__module">
                                <input type="search" v-model="keyword" @keyup.enter="search" placeholder="Search site" name="query">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="nav" class="col-md-3 col-sm-4 text-right text-left-xs">
                    <div class="bar__module">
                        <ul class="menu-horizontal text-left">
                            <li class="">
                                <span v-on:click="go('/')" class="dropdown__trigger" style="cursor:pointer">Home</span>
                                <!--end dropdown container-->
                            </li>
                            <li class="dropdown">
                                <span class="dropdown__trigger" style="cursor:pointer">{{category}}</span>
                                <div class="dropdown__container">
                                    <div class="container">
                                        <div class="row">
                                            <div class="dropdown__content col-md-2 col-sm-4">
                                                <ul class="menu-vertical">
                                                    <li v-on:click="setCategory(-2)" class="" style="cursor:pointer">全部分类</li>
                                                    <li v-on:click="setCategory(-1)" class="" style="cursor:pointer">默认分类</li>
                                                    <template v-for="(c, idx) in categories">
                                                        <li v-on:click="setCategory(idx)" style="cursor:pointer">{{c.title}}</li>
                                                    </template>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end dropdown container-->
                            </li>
                        </ul>
                    </div>
                    <!--end module-->
                </div>
            </div>
            <!--end of row-->
        </div>
        <!--end of container-->
    </nav>
</div>