<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/13
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="articles">
    <template v-for="a in pager.list">
        <section class="space--xs blog-article-wide">
            <div class="container">
                <div class="row">
                    <div class="cta cta--horizontal text-center-xs">
                        <div class="col-sm-4">
                            <h4>{{date(a.createTime)}}</h4>
                        </div>
                        <div class="col-sm-5">
                            <p class="lead">
                                {{a.title}}
                            </p>
                        </div>
                        <div class="col-sm-3 text-right text-center-xs">
                            <a class="btn type--uppercase" @click="read(a.id)">
                                <span class="btn__text">
                                    查看全文
                                    </span>
                            </a>
                        </div>
                    </div>
                </div>
                <!--end of row-->
            </div>
            <!--end of container-->
        </section>
    </template>
</div>

