<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/14
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <hr/>
</div>
<div class="container" id="tags">
    <div class="row">
        <div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
            <div class="row">

                <div class="boxed boxed--borde">
                    <div class="col-sm-12 text-center ">
                        <h5>按标签搜索</h5>
                    </div>
                    <template v-for="t in list">
                        <div class="col-sm-4 text-center">
                            <div class=" ">
                                <div class="inner" onclick="return false"></div>
                                <input v-bind:id="'tag'+t.id" v-model="tags" v-bind:value="t.id" type="checkbox" name="agree">
                            </div>
                            <span>{{t.title}}</span>
                        </div>
                    </template>
                    <div>
                        {{ tags }}
                    </div>

                    <div class="col-sm-12 boxed">
                        <button type="submit" class="btn btn--primary type--uppercase">Submit Planner</button>
                    </div>
                </div>
            </div>
            <!--end of row-->
        </div>
    </div>
    <!--end of row-->
</div>
