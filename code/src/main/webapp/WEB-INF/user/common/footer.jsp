<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/13
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<footer class="footer-3 text-center-xs space--xs " id="footer">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">

                <ul class="list-inline list--hover">
                    <li>
                        <a href="/">
                            <span class="type--fine-print">Get Started</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="type--fine-print">{{email}}</span>
                        </a>
                    </li>
                </ul>
            </div>

        </div>
        <!--end of row-->
        <div class="row">
            <div class="col-sm-6">
                <p class="type--fine-print">
                    Supercharge your web workflow
                </p>
            </div>
            <div class="col-sm-6 text-right text-center-xs">
                        <span class="type--fine-print">©
                                <span class="update-year">{{year}}</span> {{company}}.</span>
                <template v-for="op in options">
                    <a class="type--fine-print" target="_blank" :href="op.url">{{op.title}}</a>
                </template>
            </div>
        </div>
        <!--end of row-->
    </div>
    <!--end of container-->
</footer>