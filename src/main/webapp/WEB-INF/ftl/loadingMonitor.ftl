<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>负载监控 - OpenStack Dashboard</title>


    <link rel="stylesheet" href="assets/css/di-route.css" type="text/css" media="screen">
    <link rel="stylesheet" href="assets/css/diy.css" type="text/css">

    <link rel="shortcut icon" href="http://10.128.201.14/static/dashboard/img/favicon.ico">

    <script src="assets/js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="assets/js/highstock.js" type="text/javascript" charset="utf-8"></script>
    <script src="assets/js/highcharts-more.js" type="text/javascript" charset="utf-8"></script>
    <style></style>
</head>
<body>

<div id="container">


    <div class="sidebar">
        <h1 class="brand clearfix"><a href="http://10.128.201.14/horizon/home/">OpenStack Dashboard</a></h1>


        <div class="clearfix">
            <ul class="nav nav-tabs">


                <li class="active">
                    <a href="http://10.128.201.14/horizon/project/" tabindex="1">项目</a>
                </li>


                <li>
                    <a href="http://10.128.201.14/horizon/admin/" tabindex="1">管理员</a>
                </li>


            </ul>
        </div>


        <div id="tenant_switcher" class="dropdown switcher_bar" tabindex="1">


            <a class="dropdown-toggle" data-toggle="dropdown" href="#tenant_switcher">

                <h4>当前项目</h4>
                <h3>s337</h3>

            </a>


            <ul id="tenant_list" class="dropdown-menu">
                <li class="divider"></li>


                <li>
                    <a href="http://10.128.201.14/horizon/auth/switch/0f86add0b55a48bdb8454ae7290f625d/?next=/horizon/project/">cc</a>
                </li>


            </ul>


        </div>


        <h4>管理计算</h4>
        <ul class="main_nav">

            <li>
                <a href="http://10.128.201.14/horizon/project/" tabindex="1">概况</a>
            </li>

            <li>
                <a href="http://10.128.201.14/horizon/project/instances/" tabindex="1">云主机</a>
            </li>

            <li>
                <a href="http://10.128.201.14/horizon/project/volumes/" tabindex="1">云硬盘</a>
            </li>

            <li>
                <a href="http://10.128.201.14/horizon/project/images_and_snapshots/" tabindex="1">镜像 &amp; 快照</a>
            </li>

            <li>
                <a href="http://10.128.201.14/horizon/project/access_and_security/" tabindex="1">访问 &amp; 安全</a>
            </li>

        </ul>


        <h4>管理网络</h4>
        <ul class="main_nav">

            <li>
                <a href="http://10.128.201.14/horizon/project/network_topology/" tabindex="1">网络拓扑</a>
            </li>

            <li>
                <a href="http://10.128.201.14/horizon/project/networks/" tabindex="1">网络</a>
            </li>

            <li>
                <a href="http://10.128.201.14/horizon/project/routers/">路由</a>
            </li>

        </ul>

        <h4>镜像管理</h4>
        <ul class="main_nav">
            <li>
                <a href="singleImage.ftl">副本管理单镜像</a>
            </li>
            <li>
                <a href="imageRepo.ftl">镜像仓库</a>
            </li>
            <li>
                <a href="manageTotal.ftl">副本管理整体</a>
            </li>
        </ul>
        <h4>虚拟机管理</h4>
        <ul class="main_nav">
            <li>
                <a href="vmMonitorLoading.ftl">VM负载监控</a>
            </li>
            <li>
                <a href="netMonitorLoading.ftl">网络负载监控</a>
            </li>
            <li>
                <a href="totalMonitorLoading.ftl">负载监控整体</a>
            </li>
            <li>
                <a href="resourceAllocator.ftl">负载分配</a>
            </li>
        </ul>
        <h4>资源规划</h4>
        <ul class="main_nav">
            <li>
                <a href="loadingMonitor.ftl" class="active" tabindex="1">负载监控</a>
            </li>
            <li>
                <a href="loadingForcast.ftl">负载预测</a>
            </li>
            <li>
                <a href="resourceResize.ftl">资源规划</a>
            </li>
        </ul>
    </div>


    <div id="main_content">
        <div class="topbar">


            <div id="user_info" class="pull-right">
                <span>登录身份： openstack</span>
                <a href="http://10.128.201.14/horizon/settings/">设置</a>

                <a href="http://docs.openstack.org/" target="_new">帮助</a>

                <a href="http://10.128.201.14/horizon/auth/logout/">退出</a>


            </div>


            <div class="page-header">
                <h2>负载监控</h2>
            </div>
        </div>

        <div class="table_wrapper row-fluid">
            <div class="span12">
                <div class="tab-content container" style="border: 0">
                    <div class="sx-10">
                        <div class="graph-border sx-10" style="width: 98%">
                            <div class="graph-header">
                                <h3>负载到达率</h3>
                            </div>
                            <div style="background: white">
                                <div id="loading-reachment-day" class="graph-container"></div>
                                <div id="loading-reachment-hour" class="graph-container"></div>
                            </div>
                        </div>
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>运行时间分布</h3>
                            </div>
                            <div style="background: white; height: 356px">
                                <div class="graph-container graph-text" id="graph-text">
                                    <span class="sx-10">最长运行时间：8 Month</span>
                                    <span class="sx-10">最短运行时间：5 min</span>
                                    <span class="sx-10">平均运行时间：5.9 h</span>
                                    <span class="sx-10">中位运行时间：5 days</span>
                                </div>
                                <div style="background: white;">
                                    <div id="image-usage" class="graph-container sx-5" style="height: 350px; padding: 0; background: white"></div>
                                </div>
                            </div>
                        </div>
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>最近任务负载</h3>
                            </div>
                            <div style="background: white">
                                <div id="popular-image-list" class="graph-table">
                                    <table class="table table-bordered table-striped datatable">
                                        <thead>

                                        <tr>
                                            <th class="sortable anchor normal_column header">虚拟机名</th>
                                            <th class="sortable normal_column header">创建时间</th>
                                            <th class="sortable normal_column header">所属用户</th>
                                            <th class="sortable normal_column header">状态</th>
                                            <th class="sortable normal_column header">运行时间</th>
                                        </tr>


                                        </thead>

                                        <tbody>

                                        <tr class="ajax-update status_up category-project odd" data-display="spark_langren1992"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=c97f5bf0-ffbe-48fc-b816-b602ba898039"
                                            style="display: table-row;">
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/c97f5bf0-ffbe-48fc-b816-b602ba898039/"
                                                        class="">spark_langren1992</a></td>
                                            <td class="sortable normal_column">Oct. 27, 2017, 9:01 a.m.</td>
                                            <td class="status_up sortable normal_column">spark_team</td>
                                            <td class="sortable normal_column">Active</td>
                                            <td class="status_up sortable normal_column">3 min</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public category-project even"
                                            data-display="Ubuntu 15.10" data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=300d0466-641a-46fb-8f52-e897db57379f"
                                            style="display: table-row;">
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/300d0466-641a-46fb-8f52-e897db57379f/"
                                                        class="">Ubuntu 15.10</a></td>
                                            <td class="sortable normal_column">Oct. 27, 2017, 8:59 a.m.</td>
                                            <td class="status_up sortable normal_column">General</td>
                                            <td class="sortable normal_column">Active</td>
                                            <td class="status_up sortable normal_column">5 min</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-project odd" data-display="jiahui-jin's VM2"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=83800116-1316-4402-acf9-c64926565f77"
                                            style="display: table-row;">
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/83800116-1316-4402-acf9-c64926565f77/"
                                                        class="">jiahui-jin's VM2</a></td>
                                            <td class="sortable normal_column">Oct. 27, 2017, 8:56 a.m.</td>
                                            <td class="status_up sortable normal_column">jiahui</td>
                                            <td class="sortable normal_column">Active</td>
                                            <td class="status_up sortable normal_column">8 min</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public category-project odd" data-display="rickey"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=993bafd8-c5a5-41a1-b8fd-b3683264c49e"
                                            style="display: table-row;">
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/993bafd8-c5a5-41a1-b8fd-b3683264c49e/"
                                                        class="">rickey</a></td>
                                            <td class="sortable normal_column">Oct. 27, 2017, 8:50 a.m.</td>
                                            <td class="status_up sortable normal_column">rickey</td>
                                            <td class="sortable normal_column">Active</td>
                                            <td class="status_up sortable normal_column">14 min</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-project even" data-display="cc-analytics"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=498c13a1-62ba-415e-9000-19cdf2ceee87"
                                            style="display: table-row;">

                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/498c13a1-62ba-415e-9000-19cdf2ceee87/"
                                                        class="">cc-analytics</a></td>
                                            <td class="sortable normal_column">Oct. 27, 2017, 8:41 a.m.</td>
                                            <td class="status_up sortable normal_column">spark_team</td>
                                            <td class="sortable normal_column">Active</td>
                                            <td class="status_up sortable normal_column">23 min</td>
                                        </tr>

                                        <tr class="ajax-update status_up category-public category-project even"
                                            data-display="ubuntu_root_123456" data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=5c736b38-b267-4623-9c4f-b90ba4b96e14"
                                            style="display: table-row;">

                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/5c736b38-b267-4623-9c4f-b90ba4b96e14/"
                                                        class="">ubuntu_root_123456</a></td>
                                            <td class="sortable normal_column">Oct. 27, 2017, 8:41 a.m.</td>
                                            <td class="status_up sortable normal_column">General</td>
                                            <td class="sortable normal_column">Active</td>
                                            <td class="status_up sortable normal_column">23 min</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-project odd" data-display="xubuntu_vnc_root"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=2ca4995d-41e7-45ca-b5a4-e04646bb77fe"
                                            style="display: table-row;">

                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/2ca4995d-41e7-45ca-b5a4-e04646bb77fe/"
                                                        class="">xubuntu_vnc_root</a></td>
                                            <td class="sortable normal_column">Oct. 27, 2017, 8:41 a.m.</td>
                                            <td class="status_up sortable normal_column">General</td>
                                            <td class="sortable normal_column">Shutoff</td>
                                            <td class="status_up sortable normal_column">5 min</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public even" data-display="windows2012"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=bbb5981b-31da-4d7c-8990-52346c13d7ac"
                                            style="display: table-row;">

                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/bbb5981b-31da-4d7c-8990-52346c13d7ac/"
                                                        class="">windows2012</a></td>
                                            <td class="sortable normal_column">Oct. 27, 2017, 7:41 a.m.</td>
                                            <td class="status_up sortable normal_column">General</td>
                                            <td class="sortable normal_column">Active</td>
                                            <td class="status_up sortable normal_column">2 h</td>
                                        </tr>

                                        <tr class="ajax-update status_up category-public even" data-display="docker-03"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=bbb5981b-31da-4d7c-8990-52346c13d7ac"
                                            style="display: table-row;">

                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/bbb5981b-31da-4d7c-8990-52346c13d7ac/"
                                                        class="">docker-03</a></td>
                                            <td class="sortable normal_column">Oct. 27, 2017, 6:01 a.m.</td>
                                            <td class="status_up sortable normal_column">General</td>
                                            <td class="sortable normal_column">Active</td>
                                            <td class="status_up sortable normal_column">4 h</td>
                                        </tr>

                                        <tr class="ajax-update status_up category-public even" data-display="docker-04"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=bbb5981b-31da-4d7c-8990-52346c13d7ac"
                                            style="display: table-row;">

                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/bbb5981b-31da-4d7c-8990-52346c13d7ac/"
                                                        class="">docker-04</a></td>
                                            <td class="sortable normal_column">Oct. 27, 2017, 6:01 a.m.</td>
                                            <td class="status_up sortable normal_column">General</td>
                                            <td class="sortable normal_column">Active</td>
                                            <td class="status_up sortable normal_column">4 h</td>
                                        </tr>

                                        </tbody>


                                        <tfoot>

                                        <tr>
                                            <td colspan="8">
                                                <span class="table_count">显示10个条目</span>

                                            </td>
                                        </tr>
                                        </tfoot>


                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="images" style="margin-top: -85px">

                            <div class="table_wrapper">
                                <form action="/horizon/project/images_and_snapshots/" method="POST"><input name="csrfmiddlewaretoken"
                                                                                                           value="x7d15ynYSwfEtR6aK5hhVtqVViuA8G7l"
                                                                                                           type="hidden">

                                    <table id="images" class="table table-bordered table-striped datatable" style="background-color: white">
                                        <thead>

                                        <tr class="table_caption">
                                            <th class="table_header" colspan="8">
                                                <h3 class="table_title">资源用量汇总</h3>
                                            </th>
                                        </tr>


                                        <tr>
                                            <th class="sortable normal_column header">虚拟机名</th>

                                            <th class="sortable normal_column header">运行时间</th>

                                            <th class="sortable normal_column header">实时CPU</th>

                                            <th class="sortable normal_column header">实时内存</th>

                                            <th class="sortable normal_column header">实时上行网络</th>
                                            <th class="sortable normal_column header">实时下行网络</th>

                                            <th class="sortable normal_column header">平均CPU</th>

                                            <th class="sortable normal_column header">平均内存</th>

                                            <th class="sortable normal_column header">平均上行网络</th>

                                            <th class="sortable normal_column header">平均下行网络</th>

                                        </tr>


                                        </thead>

                                        <tbody>

                                        <tr class="ajax-update status_up category-project odd" data-display="_langren1992"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=c97f5bf0-ffbe-48fc-b816-b602ba898039"
                                            id="images__row__c97f5bf0-ffbe-48fc-b816-b602ba898039" style="display: table-row;">
                                            <td class="sortable normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/c97f5bf0-ffbe-48fc-b816-b602ba898039/"
                                                        class="">spark_langren1992</a></td>
                                            <td class="sortable normal_column">Snapshot</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public category-project even"
                                            data-display="Ubuntu 15.10" data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=300d0466-641a-46fb-8f52-e897db57379f"
                                            id="images__row__300d0466-641a-46fb-8f52-e897db57379f" style="display: table-row;">
                                            <td class="sortable normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/300d0466-641a-46fb-8f52-e897db57379f/"
                                                        class="">Ubuntu 15.10</a></td>
                                            <td class="sortable normal_column">Image</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">True</td>
                                            <td class="sortable normal_column">True</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-project odd" data-display="jiahui-jin's VM2"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=83800116-1316-4402-acf9-c64926565f77"
                                            id="images__row__83800116-1316-4402-acf9-c64926565f77" style="display: table-row;">

                                            <td class="sortable normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/83800116-1316-4402-acf9-c64926565f77/"
                                                        class="">jiahui-jin's VM2</a></td>
                                            <td class="sortable normal_column">Snapshot</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public category-project odd" data-display="rickey"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=993bafd8-c5a5-41a1-b8fd-b3683264c49e"
                                            id="images__row__993bafd8-c5a5-41a1-b8fd-b3683264c49e" style="display: table-row;">

                                            <td class="sortable normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/993bafd8-c5a5-41a1-b8fd-b3683264c49e/"
                                                        class="">rickey</a></td>
                                            <td class="sortable normal_column">Image</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">True</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-project even" data-display="cc-analytics"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=498c13a1-62ba-415e-9000-19cdf2ceee87"
                                            id="images__row__498c13a1-62ba-415e-9000-19cdf2ceee87" style="display: table-row;">

                                            <td class="sortable normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/498c13a1-62ba-415e-9000-19cdf2ceee87/"
                                                        class="">cc-analytics</a></td>
                                            <td class="sortable normal_column">Snapshot</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                        </tr>

                                        <tr class="ajax-update status_up category-project odd" data-display="ftp_test_linux"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=9d41c1bc-2ca6-4d46-85cc-513aa1e92e64"
                                            id="images__row__9d41c1bc-2ca6-4d46-85cc-513aa1e92e64" style="display: table-row;">

                                            <td class="sortable normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/9d41c1bc-2ca6-4d46-85cc-513aa1e92e64/"
                                                        class="">ftp_test_linux</a></td>
                                            <td class="sortable normal_column">Snapshot</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-project even" data-display="net_test_ubuntu"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=5a2f2c00-9c73-4ac7-9ebe-92421afd0313"
                                            id="images__row__5a2f2c00-9c73-4ac7-9ebe-92421afd0313" style="display: table-row;">

                                            <td class="sortable normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/5a2f2c00-9c73-4ac7-9ebe-92421afd0313/"
                                                        class="">net_test_ubuntu</a></td>
                                            <td class="sortable normal_column">Snapshot</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-project odd" data-display="tiny_iperf_auto_test"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe"
                                            id="images__row__1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe" style="display: table-row;">

                                            <td class="sortable normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe/"
                                                        class="">tiny_iperf_auto_test</a></td>
                                            <td class="sortable normal_column">Snapshot</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public category-project even"
                                            data-display="ubuntu_root_123456" data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=5c736b38-b267-4623-9c4f-b90ba4b96e14"
                                            id="images__row__5c736b38-b267-4623-9c4f-b90ba4b96e14" style="display: table-row;">

                                            <td class="sortable normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/5c736b38-b267-4623-9c4f-b90ba4b96e14/"
                                                        class="">ubuntu_root_123456</a></td>
                                            <td class="sortable normal_column">Snapshot</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">True</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-project odd" data-display="xubuntu_vnc_root"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=2ca4995d-41e7-45ca-b5a4-e04646bb77fe"
                                            id="images__row__2ca4995d-41e7-45ca-b5a4-e04646bb77fe" style="display: table-row;">

                                            <td class="sortable normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/2ca4995d-41e7-45ca-b5a4-e04646bb77fe/"
                                                        class="">xubuntu_vnc_root</a></td>
                                            <td class="sortable normal_column">Snapshot</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public even" data-display="windows2012"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=bbb5981b-31da-4d7c-8990-52346c13d7ac"
                                            id="images__row__bbb5981b-31da-4d7c-8990-52346c13d7ac" style="display: none;">

                                            <td class="sortable normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/bbb5981b-31da-4d7c-8990-52346c13d7ac/"
                                                        class="">windows2012</a></td>
                                            <td class="sortable normal_column">Image</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">True</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public odd" data-display="ubuntu"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=d6cbd4dc-5252-4e7b-99c1-735a2b05fe55"
                                            id="images__row__d6cbd4dc-5252-4e7b-99c1-735a2b05fe55" style="display: none;">

                                            <td class="sortable normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/d6cbd4dc-5252-4e7b-99c1-735a2b05fe55/"
                                                        class="">ubuntu</a></td>
                                            <td class="sortable normal_column">Image</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">True</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                            <td class="sortable normal_column">False</td>
                                        </tr>


                                        </tbody>


                                        <tfoot>

                                        <tr>
                                            <td colspan="10">
                                                <span class="table_count">显示10个条目</span>

                                            </td>
                                        </tr>
                                        </tfoot>


                                    </table>


                                </form>
                            </div>


                        </div>
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>排队等待概率</h3>
                            </div>
                            <div style="background: white">
                                <div id="image-tx-rate" class="graph-container"></div>
                            </div>
                        </div>

                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>等待时间期望</h3>
                            </div>
                            <div style="background: white">
                                <div id="image-tx-rate1" class="graph-container"></div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>


    <div id="footer">

    </div>


</div>
</body>
<script type="text/javascript">
    Highcharts.chart('loading-reachment-hour', {
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },legend: {
            align: 'right',
            x: -30,
            verticalAlign: 'top',
            y: 5,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },
        xAxis: {
            categories: [
                '1:00',
                '2:00',
                '3:00',
                '4:00',
                '5:00',
                '6:00',
                '7:00',
                '8:00',
                '9:00',
                '10:00',
                '11:00',
                '12:00',
                '13:00',
                '14:00',
                '15:00',
                '16:00',
                '17:00',
                '18:00',
                '19:00',
                '20:00',
                '21:00',
                '22:00',
                '23:00',
                '24:00'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: '虚拟机负载到达'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: '虚拟机数量',
            data: [1, 5, 5, 2, 0, 10, 8, 20, 25, 98, 85, 56, 67, 55, 62, 44, 76, 135, 48, 16, 42, 10, 1]

        }]
    });
</script>
<script type="text/javascript">
    Highcharts.chart('loading-reachment-day', {

        title: {
            text: ''
        },
        xAxis: {
            categories: [
                '2017-10-1',
                '2017-10-2',
                '2017-10-3',
                '2017-10-4',
                '2017-10-5',
                '2017-10-6',
                '2017-10-7',
                '2017-10-8',
                '2017-10-9',
                '2017-10-10',
                '2017-10-11',
                '2017-10-12',
                '2017-10-13',
                '2017-10-14',
                '2017-10-15',
                '2017-10-16',
                '2017-10-17',
                '2017-10-18',
                '2017-10-19',
                '2017-10-20',
                '2017-10-21',
                '2017-10-22',
                '2017-10-23',
                '2017-10-24'
            ],
            crosshair: true
        },
        yAxis: {
            title: {
                text: '虚拟机负载到达'
            }
        },
        legend: {
            align: 'right',
            x: -30,
            verticalAlign: 'top',
            y: 5,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },

        plotOptions: {
            series: {
                label: {
                    connectorAllowed: false
                },

            }
        },

        series: [{
            name: '虚拟机数量',
            data: [18, 25, 77, 58, 31, 33, 33, 475, 518, 503,777, 658, 731, 131, 833, 575, 818, 503, 677, 58, 131, 931, 833, 775]
        }],

        responsive: {
            rules: [{
                condition: {
                    maxWidth: 500
                },
                chartOptions: {
                    legend: {
                        layout: 'horizontal',
                        align: 'center',
                        verticalAlign: 'bottom'
                    }
                }
            }]
        }

    });
</script>
<script type="text/javascript">
    // Build the chart
    Highcharts.chart('image-usage', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: ''
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [{
                name: '<1h',
                y: 26.33
            }, {
                name: '1h-5h',
                y: 54.03,
                sliced: true,
                selected: true
            }, {
                name: '6h-24h',
                y: 10.38
            }, {
                name: '1day-2days',
                y: 4.77
            }, {
                name: '2days-7days',
                y: 0.91
            }, {
                name: '>7days',
                y: 0.2
            }]
        }]
    });
</script>

<script type="text/javascript">
    Highcharts.chart('image-tx-rate', {

        title: {
            text: ''
        },
        xAxis: {
            categories: [
                '2017-10-15',
                '2017-10-16',
                '2017-10-17',
                '2017-10-18',
                '2017-10-19',
                '2017-10-20',
                '2017-10-21',
                '2017-10-22',
                '2017-10-23',
                '2017-10-24'
            ],
            crosshair: true
        },
        yAxis: {
            title: {
                text: '概率 (%)'
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle'
        },

        plotOptions: {
            series: {
                label: {
                    connectorAllowed: false
                },

            }
        },

        series: [{
            name: 'AZ-16CPU',
            data: [0.1, 0.12, 0.13, 0.11, 0.08, 0.12, 0.21, 0.15, 0.11, 0.01]
        }, {
            name: 'AZ-32GMEM',
            data: [0.21, 0.12, 0.15, 0.17, 0.08, 0.112, 0.021, 0.115, 0.211, 0.11]
        }, {
            name: 'AZ-DISK',
            data: [0.1, 0.212, 0.213, 0.211, 0.208, 0.312, 0.121, 0.125, 0.151, 0.21]
        }, {
            name: 'AZ-NET',
            data: [0.21, 0.32, 0.13, 0.21, 0.18, 0.22, 0.11, 0.15, 0.31, 0.11]
        }, {
            name: 'AZ-HA',
            data: [0.01, 0.082, 0.0813, 0.0611, 0.108, 0.312, 0.021, 0.115, 0.0811, 0.101]
        }],

        responsive: {
            rules: [{
                condition: {
                    maxWidth: 500
                },
                chartOptions: {
                    legend: {
                        layout: 'horizontal',
                        align: 'center',
                        verticalAlign: 'bottom'
                    }
                }
            }]
        }

    });
</script>
<script type="text/javascript">
    Highcharts.chart('image-tx-rate1', {

        title: {
            text: ''
        },
        xAxis: {
            categories: [
                '2017-10-15',
                '2017-10-16',
                '2017-10-17',
                '2017-10-18',
                '2017-10-19',
                '2017-10-20',
                '2017-10-21',
                '2017-10-22',
                '2017-10-23',
                '2017-10-24'
            ],
            crosshair: true
        },
        yAxis: {
            title: {
                text: '平均等待时间 (秒)'
            }
        },
        legend: {
            layout: 'top',
            align: 'right',
            verticalAlign: 'middle'
        },

        plotOptions: {
            series: {
                label: {
                    connectorAllowed: false
                },
            }
        },

        series: [{
            name: 'AZ-16CPU',
            data: [12.1, 7.12, 10.13, 11.11, 12.08, 13.12, 10.21, 10.15, 20.11, 20.01]
        }, {
            name: 'AZ-32GMEM',
            data: [24.21, 21.12, 22.15, 21.17, 20.08, 36.112, 31.021, 32.115, 33.211, 32.11]
        }, {
            name: 'AZ-DISK',
            data: [10.1, 8.212, 10.213, 9.211, 6.208, 7.312, 9.121, 10.125, 11.151, 12.21]
        }, {
            name: 'AZ-NET',
            data: [2.21, 1.32, 3.13, 5.21, 10.18, 8.22, 9.11, 12.15, 13.31, 15.11]
        }, {
            name: 'AZ-HA',
            data: [1.01, 3.082, 5.0813, 1.0611, 3.108, 5.312, 1.021, 2.115, 2.0811, 1.101]
        }],

        responsive: {
            rules: [{
                condition: {
                    maxWidth: 500
                },
                chartOptions: {
                    legend: {
                        layout: 'horizontal',
                        align: 'center',
                        verticalAlign: 'bottom'
                    }
                }
            }]
        }

    });
</script>

</html>