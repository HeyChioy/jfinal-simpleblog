<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/14
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="bar bar-3 bar--sm bg--secondary">
    <div class="container">
        <div class="row">
            <div class="col-md-6 text-right text-left-xs text-left-sm">
                <div class="bar__module">
                    <ul id="nav" class="menu-horizontal text-left">
                        <template v-for="m1 in menus">
                            <li class="dropdown">
                                <span class="dropdown__trigger">{{ m1.title }}</span>
                                <div class="dropdown__container">
                                    <div class="container">
                                        <div class="row">
                                            <div class="dropdown__content col-md-2 col-sm-4">
                                                <ul class="menu-vertical">
                                                    <template v-for="m2 in m1.children">
                                                        <li style="cursor:pointer">
                                                            <a v-bind:href="m2.link">{{ m2.title }}</a>
                                                        </li>
                                                    </template>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </template>
                        <!--end dropdown container-->
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
