<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/13
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section id="paging">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="pagination">
                    <div class="col-xs-3" style="margin-top:11px">
                        <%--<a class="type--fine-print" style="cursor: pointer">« Newer Posts </a>--%>
                        <a v-on:click="newer" class=" btn-link" style="cursor: pointer">« Newer Posts </a>
                    </div>
                    <div class="col-xs-4" style="text-align: center">
                        <div class="input-select">
                            <select v-model="pageNumber">
                                <template v-for="num in totalPage">
                                    <option v-bind:value="num">{{ num }}</option>
                                </template>
                            </select>
                        </div>
                        <a href="#" class="btn btn-sm btn--white" v-on:click="go">
                            <span class="btn__text">GO</span>
                        </a>
                    </div>
                    <div class="col-xs-3 text-right" style="margin-top:11px">
                        <%--<a class="type--fine-print" style="cursor: pointer">Older Posts »</a>--%>
                            <a  v-on:click="older" class=" btn-link" style="cursor: pointer">Older Posts »</a>
                    </div>
                </div>
            </div>
        </div>
        <!--end of row-->
    </div>
    <!--end of container-->
</section>