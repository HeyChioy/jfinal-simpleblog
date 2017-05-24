<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/16
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container col-lg-8">
    <div class="tabs-container text-center">
        <div class="tab__content">
            <section>
                <div class="container">
                    <div class="row">
                        <div class="masonry">
                            <div id="links" class="masonry__container">
                                <template v-for="link in list">
                                    <vue-link v-bind:link="link.link" v-bind:id="link.id" v-bind:title="link.title"
                                              v-bind:editable="editable"
                                              v-bind:summary="link.summary"
                                              v-on:edit="onEdit(link)" v-on:delete="onDelete(link)">
                                    </vue-link>
                                </template>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
