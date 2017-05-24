<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/15
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="nav-container nav-container--sidebar nav-container--rightr">
    <div id="nav" class="nav-sidebar-column bg--dark">
        <div class="text-center text-block">
            <a href="/user/dashboard">
                <img alt="logo" class="logo" src="/assets/img/logo-light.png">
            </a>
            <p>
                Build Something
                <em>Brilliant.</em>
            </p>
        </div>
        <hr>
        <div class="text-block">
            <ul class="menu-vertical">
                <template v-for="m1 in menus">
                    <li class="dropdown">
                        <span class="dropdown__trigger">{{ m1.title }}</span>
                        <div class="dropdown__container" style="left: 70.5px;">
                            <div class="dropdown__content" style="left: -308.219px;">
                                <ul class="menu-vertical">
                                    <template v-for="m2 in m1.children">
                                        <li>
                                            <a v-bind:href="m2.link">
                                                {{ m2.title }}
                                            </a>
                                        </li>
                                    </template>
                                </ul>
                            </div>
                        </div>
                    </li>
                </template>
            </ul>
        </div>
        <div class="text-block">
            <a class="btn block type--uppercase" href="">
                <span class="btn__text">个人信息</span>
            </a>
            <a class="btn block btn--primary type--uppercase"
               href="">
                <span class="btn__text">退出登陆</span>
            </a>
        </div>
        <hr>
        <div>
            <div>
                <span class="type--fine-print type--fade">
                    © Copyright
                    <span class="update-year">2017</span> Medium Rare
                </span>
            </div>
        </div>
    </div>
    <div class="nav-sidebar-column-toggle visible-xs visible-sm" data-toggle-class=".nav-sidebar-column;active">
        <i class="stack-menu"></i>
    </div>
</div>
