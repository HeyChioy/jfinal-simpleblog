<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="main-sidebar">
    <section class="sidebar" style="height: auto;">
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="treeview">
                <a href="/user/dashboard">Dashboard</a>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-dashboard"></i> <span>站点配置</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/admin/manager/link"><i class="fa fa-circle-o"></i> 友链设置 </a></li>
                    <li class=""><a href="/admin/manager/config"><i class="fa fa-circle-o"></i> 常量设置 </a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-files-o"></i>
                    <span> 文章管理</span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/admin/manager/category"><i class="fa fa-circle-o"></i> 类别管理</a></li>
                    <li><a href="/admin/manager/tag"><i class="fa fa-circle-o"></i> 标签管理</a></li>
                    <li><a href="/admin/manager/article"><i class="fa fa-circle-o"></i> 文章列表</a></li>
                </ul>
            </li>
            <li>
                <a href="/admin/manager/comment"><i class="fa fa-edit"></i> <span>评论管理</span></a>
            </li>

            <li class="treeview">
                <a href="/admin/manager/file"><i class="fa fa-table"></i> <span> 文件管理</span></a>
            </li>
        </ul>
    </section>
</aside>
