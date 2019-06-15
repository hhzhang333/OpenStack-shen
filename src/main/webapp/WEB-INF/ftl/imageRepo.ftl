<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>镜像仓库 - OpenStack Dashboard</title>


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
                <a href="#" class="active" tabindex="1">镜像仓库</a>
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
                <a href="loadingMonitor.ftl">负载监控</a>
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
                <h2>镜像仓库</h2>
            </div>
        </div>

        <div class="images">

            <div class="table_wrapper">
                <form action="/horizon/project/images_and_snapshots/" method="POST"><input name="csrfmiddlewaretoken"
                                                                                           value="x7d15ynYSwfEtR6aK5hhVtqVViuA8G7l"
                                                                                           type="hidden">

                    <table id="images" class="table table-bordered table-striped datatable">
                        <thead>

                        <tr class="table_caption">
                            <th class="table_header" colspan="8">
                                <h3 class="table_title">镜像</h3>

                                <div class="table_actions clearfix">


                                    <div class="table_filter btn-group" data-toggle="buttons-radio">

                                        <button name="images__filter__q" type="submit" value="project"
                                                class="btn btn-small active"><i class="icon-home"></i> 项目 (31)
                                        </button>

                                        <button name="images__filter__q" type="submit" value="shared"
                                                class="btn btn-small"><i class="icon-share"></i> 与我共享 (0)
                                        </button>

                                        <button name="images__filter__q" type="submit" value="public"
                                                class="btn btn-small"><i class="icon-fire"></i> 公有 (11)
                                        </button>

                                    </div>


                                    <a href="/horizon/project/images_and_snapshots/create/" title="创建镜像"
                                       class="btn btn-small ajax-modal btn-create" id="images__action_create">创建镜像</a>


                                    <button class="btn btn-small btn-danger btn-delete disabled"
                                            id="images__action_delete" name="action" value="images__delete"
                                            type="submit">删除 镜像
                                    </button>

                                </div>


                            </th>
                        </tr>


                        <tr>

                            <th class="multi_select_column"><input type="checkbox"></th>
                            <th class="sortable anchor normal_column header">镜像名称</th>
                            <th class="sortable normal_column header">类型</th>
                            <th class="sortable normal_column header">状态</th>
                            <th class="sortable normal_column header">公开</th>
                            <th class="sortable normal_column header">加密</th>
                            <th class="sortable normal_column header">格式</th>
                            <th class="actions_column">动作</th>

                        </tr>


                        </thead>

                        <tbody>

                        <tr class="ajax-update status_up category-project odd" data-display="spark_langren1992"
                            data-update-interval="2500"
                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=c97f5bf0-ffbe-48fc-b816-b602ba898039"
                            id="images__row__c97f5bf0-ffbe-48fc-b816-b602ba898039" style="display: table-row;">
                            <td class="multi_select_column"><input name="object_ids"
                                                                   value="c97f5bf0-ffbe-48fc-b816-b602ba898039"
                                                                   type="checkbox"></td>
                            <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/c97f5bf0-ffbe-48fc-b816-b602ba898039/"
                                        class="">spark_langren1992</a></td>
                            <td class="sortable normal_column">Snapshot</td>
                            <td class="status_up sortable normal_column">Active</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">QCOW2</td>
                            <td class="actions_column">

                                <div class="btn-group"><a
                                            href="/horizon/project/instances/launch?source_id=c97f5bf0-ffbe-48fc-b816-b602ba898039&amp;source_type=instance_snapshot_id"
                                            class="btn btn-small btn-launch ajax-modal"
                                            id="images__row_c97f5bf0-ffbe-48fc-b816-b602ba898039__action_launch_image">运行</a><a
                                            class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                        更多
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu row_actions clearfix">
                                        <li class="clearfix"><a
                                                    href="/horizon/project/volumes/create/?image_id=c97f5bf0-ffbe-48fc-b816-b602ba898039"
                                                    class="btn btn-small ajax-modal btn-camera"
                                                    id="images__row_c97f5bf0-ffbe-48fc-b816-b602ba898039__action_create_volume_from_image">创建云硬盘</a>
                                        </li>
                                        <li class="clearfix"><a
                                                    href="/horizon/project/images_and_snapshots/c97f5bf0-ffbe-48fc-b816-b602ba898039/update/"
                                                    class="btn btn-small ajax-modal btn-edit"
                                                    id="images__row_c97f5bf0-ffbe-48fc-b816-b602ba898039__action_edit">编辑</a>
                                        </li>
                                        <li class="clearfix">
                                            <button class="btn btn-small btn-danger btn-delete"
                                                    id="images__row_c97f5bf0-ffbe-48fc-b816-b602ba898039__action_delete"
                                                    name="action"
                                                    value="images__delete__c97f5bf0-ffbe-48fc-b816-b602ba898039"
                                                    type="submit">删除 镜像
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>


                        <tr class="ajax-update status_up category-public category-project even"
                            data-display="Ubuntu 15.10" data-update-interval="2500"
                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=300d0466-641a-46fb-8f52-e897db57379f"
                            id="images__row__300d0466-641a-46fb-8f52-e897db57379f" style="display: table-row;">
                            <td class="multi_select_column"><input name="object_ids"
                                                                   value="300d0466-641a-46fb-8f52-e897db57379f"
                                                                   type="checkbox"></td>
                            <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/300d0466-641a-46fb-8f52-e897db57379f/"
                                        class="">Ubuntu 15.10</a></td>
                            <td class="sortable normal_column">Image</td>
                            <td class="status_up sortable normal_column">Active</td>
                            <td class="sortable normal_column">True</td>
                            <td class="sortable normal_column">True</td>
                            <td class="sortable normal_column">QCOW2</td>
                            <td class="actions_column">

                                <div class="btn-group"><a
                                            href="/horizon/project/instances/launch?source_id=300d0466-641a-46fb-8f52-e897db57379f&amp;source_type=image_id"
                                            class="btn btn-small btn-launch ajax-modal"
                                            id="images__row_300d0466-641a-46fb-8f52-e897db57379f__action_launch_image">运行</a><a
                                            class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                        更多
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu row_actions clearfix">
                                        <li class="clearfix"><a
                                                    href="/horizon/project/volumes/create/?image_id=300d0466-641a-46fb-8f52-e897db57379f"
                                                    class="btn btn-small ajax-modal btn-camera"
                                                    id="images__row_300d0466-641a-46fb-8f52-e897db57379f__action_create_volume_from_image">创建云硬盘</a>
                                        </li>
                                        <li class="clearfix"><a
                                                    href="/horizon/project/images_and_snapshots/300d0466-641a-46fb-8f52-e897db57379f/update/"
                                                    class="btn btn-small ajax-modal btn-edit"
                                                    id="images__row_300d0466-641a-46fb-8f52-e897db57379f__action_edit">编辑</a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>


                        <tr class="ajax-update status_up category-project odd" data-display="jiahui-jin's VM2"
                            data-update-interval="2500"
                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=83800116-1316-4402-acf9-c64926565f77"
                            id="images__row__83800116-1316-4402-acf9-c64926565f77" style="display: table-row;">
                            <td class="multi_select_column"><input name="object_ids"
                                                                   value="83800116-1316-4402-acf9-c64926565f77"
                                                                   type="checkbox"></td>
                            <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/83800116-1316-4402-acf9-c64926565f77/"
                                        class="">jiahui-jin's VM2</a></td>
                            <td class="sortable normal_column">Snapshot</td>
                            <td class="status_up sortable normal_column">Active</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">QCOW2</td>
                            <td class="actions_column">

                                <div class="btn-group"><a
                                            href="/horizon/project/instances/launch?source_id=83800116-1316-4402-acf9-c64926565f77&amp;source_type=instance_snapshot_id"
                                            class="btn btn-small btn-launch ajax-modal"
                                            id="images__row_83800116-1316-4402-acf9-c64926565f77__action_launch_image">运行</a><a
                                            class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                        更多
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu row_actions clearfix">
                                        <li class="clearfix"><a
                                                    href="/horizon/project/volumes/create/?image_id=83800116-1316-4402-acf9-c64926565f77"
                                                    class="btn btn-small ajax-modal btn-camera"
                                                    id="images__row_83800116-1316-4402-acf9-c64926565f77__action_create_volume_from_image">创建云硬盘</a>
                                        </li>
                                        <li class="clearfix"><a
                                                    href="/horizon/project/images_and_snapshots/83800116-1316-4402-acf9-c64926565f77/update/"
                                                    class="btn btn-small ajax-modal btn-edit"
                                                    id="images__row_83800116-1316-4402-acf9-c64926565f77__action_edit">编辑</a>
                                        </li>
                                        <li class="clearfix">
                                            <button class="btn btn-small btn-danger btn-delete"
                                                    id="images__row_83800116-1316-4402-acf9-c64926565f77__action_delete"
                                                    name="action"
                                                    value="images__delete__83800116-1316-4402-acf9-c64926565f77"
                                                    type="submit">删除 镜像
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>


                        <tr class="ajax-update status_up category-public category-project odd" data-display="rickey"
                            data-update-interval="2500"
                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=993bafd8-c5a5-41a1-b8fd-b3683264c49e"
                            id="images__row__993bafd8-c5a5-41a1-b8fd-b3683264c49e" style="display: table-row;">
                            <td class="multi_select_column"><input name="object_ids"
                                                                   value="993bafd8-c5a5-41a1-b8fd-b3683264c49e"
                                                                   type="checkbox"></td>
                            <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/993bafd8-c5a5-41a1-b8fd-b3683264c49e/"
                                        class="">rickey</a></td>
                            <td class="sortable normal_column">Image</td>
                            <td class="status_up sortable normal_column">Active</td>
                            <td class="sortable normal_column">True</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">QCOW2</td>
                            <td class="actions_column">

                                <div class="btn-group"><a
                                            href="/horizon/project/instances/launch?source_id=993bafd8-c5a5-41a1-b8fd-b3683264c49e&amp;source_type=image_id"
                                            class="btn btn-small btn-launch ajax-modal"
                                            id="images__row_993bafd8-c5a5-41a1-b8fd-b3683264c49e__action_launch_image">运行</a><a
                                            class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                        更多
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu row_actions clearfix">
                                        <li class="clearfix"><a
                                                    href="/horizon/project/volumes/create/?image_id=993bafd8-c5a5-41a1-b8fd-b3683264c49e"
                                                    class="btn btn-small ajax-modal btn-camera"
                                                    id="images__row_993bafd8-c5a5-41a1-b8fd-b3683264c49e__action_create_volume_from_image">创建云硬盘</a>
                                        </li>
                                        <li class="clearfix"><a
                                                    href="/horizon/project/images_and_snapshots/993bafd8-c5a5-41a1-b8fd-b3683264c49e/update/"
                                                    class="btn btn-small ajax-modal btn-edit"
                                                    id="images__row_993bafd8-c5a5-41a1-b8fd-b3683264c49e__action_edit">编辑</a>
                                        </li>
                                        <li class="clearfix">
                                            <button class="btn btn-small btn-danger btn-delete"
                                                    id="images__row_993bafd8-c5a5-41a1-b8fd-b3683264c49e__action_delete"
                                                    name="action"
                                                    value="images__delete__993bafd8-c5a5-41a1-b8fd-b3683264c49e"
                                                    type="submit">删除 镜像
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>


                        <tr class="ajax-update status_up category-project even" data-display="cc-analytics"
                            data-update-interval="2500"
                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=498c13a1-62ba-415e-9000-19cdf2ceee87"
                            id="images__row__498c13a1-62ba-415e-9000-19cdf2ceee87" style="display: table-row;">
                            <td class="multi_select_column"><input name="object_ids"
                                                                   value="498c13a1-62ba-415e-9000-19cdf2ceee87"
                                                                   type="checkbox"></td>
                            <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/498c13a1-62ba-415e-9000-19cdf2ceee87/"
                                        class="">cc-analytics</a></td>
                            <td class="sortable normal_column">Snapshot</td>
                            <td class="status_up sortable normal_column">Active</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">QCOW2</td>
                            <td class="actions_column">

                                <div class="btn-group"><a
                                            href="/horizon/project/instances/launch?source_id=498c13a1-62ba-415e-9000-19cdf2ceee87&amp;source_type=instance_snapshot_id"
                                            class="btn btn-small btn-launch ajax-modal"
                                            id="images__row_498c13a1-62ba-415e-9000-19cdf2ceee87__action_launch_image">运行</a><a
                                            class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                        更多
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu row_actions clearfix">
                                        <li class="clearfix"><a
                                                    href="/horizon/project/volumes/create/?image_id=498c13a1-62ba-415e-9000-19cdf2ceee87"
                                                    class="btn btn-small ajax-modal btn-camera"
                                                    id="images__row_498c13a1-62ba-415e-9000-19cdf2ceee87__action_create_volume_from_image">创建云硬盘</a>
                                        </li>
                                        <li class="clearfix"><a
                                                    href="/horizon/project/images_and_snapshots/498c13a1-62ba-415e-9000-19cdf2ceee87/update/"
                                                    class="btn btn-small ajax-modal btn-edit"
                                                    id="images__row_498c13a1-62ba-415e-9000-19cdf2ceee87__action_edit">编辑</a>
                                        </li>
                                        <li class="clearfix">
                                            <button class="btn btn-small btn-danger btn-delete"
                                                    id="images__row_498c13a1-62ba-415e-9000-19cdf2ceee87__action_delete"
                                                    name="action"
                                                    value="images__delete__498c13a1-62ba-415e-9000-19cdf2ceee87"
                                                    type="submit">删除 镜像
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>

                        <tr class="ajax-update status_up category-project odd" data-display="ftp_test_linux"
                            data-update-interval="2500"
                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=9d41c1bc-2ca6-4d46-85cc-513aa1e92e64"
                            id="images__row__9d41c1bc-2ca6-4d46-85cc-513aa1e92e64" style="display: table-row;">
                            <td class="multi_select_column"><input name="object_ids"
                                                                   value="9d41c1bc-2ca6-4d46-85cc-513aa1e92e64"
                                                                   type="checkbox"></td>
                            <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/9d41c1bc-2ca6-4d46-85cc-513aa1e92e64/"
                                        class="">ftp_test_linux</a></td>
                            <td class="sortable normal_column">Snapshot</td>
                            <td class="status_up sortable normal_column">Active</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">QCOW2</td>
                            <td class="actions_column">

                                <div class="btn-group"><a
                                            href="/horizon/project/instances/launch?source_id=9d41c1bc-2ca6-4d46-85cc-513aa1e92e64&amp;source_type=instance_snapshot_id"
                                            class="btn btn-small btn-launch ajax-modal"
                                            id="images__row_9d41c1bc-2ca6-4d46-85cc-513aa1e92e64__action_launch_image">运行</a><a
                                            class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                        更多
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu row_actions clearfix">
                                        <li class="clearfix"><a
                                                    href="/horizon/project/volumes/create/?image_id=9d41c1bc-2ca6-4d46-85cc-513aa1e92e64"
                                                    class="btn btn-small ajax-modal btn-camera"
                                                    id="images__row_9d41c1bc-2ca6-4d46-85cc-513aa1e92e64__action_create_volume_from_image">创建云硬盘</a>
                                        </li>
                                        <li class="clearfix"><a
                                                    href="/horizon/project/images_and_snapshots/9d41c1bc-2ca6-4d46-85cc-513aa1e92e64/update/"
                                                    class="btn btn-small ajax-modal btn-edit"
                                                    id="images__row_9d41c1bc-2ca6-4d46-85cc-513aa1e92e64__action_edit">编辑</a>
                                        </li>
                                        <li class="clearfix">
                                            <button class="btn btn-small btn-danger btn-delete"
                                                    id="images__row_9d41c1bc-2ca6-4d46-85cc-513aa1e92e64__action_delete"
                                                    name="action"
                                                    value="images__delete__9d41c1bc-2ca6-4d46-85cc-513aa1e92e64"
                                                    type="submit">删除 镜像
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>


                        <tr class="ajax-update status_up category-project even" data-display="net_test_ubuntu"
                            data-update-interval="2500"
                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=5a2f2c00-9c73-4ac7-9ebe-92421afd0313"
                            id="images__row__5a2f2c00-9c73-4ac7-9ebe-92421afd0313" style="display: table-row;">
                            <td class="multi_select_column"><input name="object_ids"
                                                                   value="5a2f2c00-9c73-4ac7-9ebe-92421afd0313"
                                                                   type="checkbox"></td>
                            <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/5a2f2c00-9c73-4ac7-9ebe-92421afd0313/"
                                        class="">net_test_ubuntu</a></td>
                            <td class="sortable normal_column">Snapshot</td>
                            <td class="status_up sortable normal_column">Active</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">QCOW2</td>
                            <td class="actions_column">

                                <div class="btn-group"><a
                                            href="/horizon/project/instances/launch?source_id=5a2f2c00-9c73-4ac7-9ebe-92421afd0313&amp;source_type=instance_snapshot_id"
                                            class="btn btn-small btn-launch ajax-modal"
                                            id="images__row_5a2f2c00-9c73-4ac7-9ebe-92421afd0313__action_launch_image">运行</a><a
                                            class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                        更多
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu row_actions clearfix">
                                        <li class="clearfix"><a
                                                    href="/horizon/project/volumes/create/?image_id=5a2f2c00-9c73-4ac7-9ebe-92421afd0313"
                                                    class="btn btn-small ajax-modal btn-camera"
                                                    id="images__row_5a2f2c00-9c73-4ac7-9ebe-92421afd0313__action_create_volume_from_image">创建云硬盘</a>
                                        </li>
                                        <li class="clearfix"><a
                                                    href="/horizon/project/images_and_snapshots/5a2f2c00-9c73-4ac7-9ebe-92421afd0313/update/"
                                                    class="btn btn-small ajax-modal btn-edit"
                                                    id="images__row_5a2f2c00-9c73-4ac7-9ebe-92421afd0313__action_edit">编辑</a>
                                        </li>
                                        <li class="clearfix">
                                            <button class="btn btn-small btn-danger btn-delete"
                                                    id="images__row_5a2f2c00-9c73-4ac7-9ebe-92421afd0313__action_delete"
                                                    name="action"
                                                    value="images__delete__5a2f2c00-9c73-4ac7-9ebe-92421afd0313"
                                                    type="submit">删除 镜像
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>


                        <tr class="ajax-update status_up category-project odd" data-display="tiny_iperf_auto_test"
                            data-update-interval="2500"
                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe"
                            id="images__row__1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe" style="display: table-row;">
                            <td class="multi_select_column"><input name="object_ids"
                                                                   value="1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe"
                                                                   type="checkbox"></td>
                            <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe/"
                                        class="">tiny_iperf_auto_test</a></td>
                            <td class="sortable normal_column">Snapshot</td>
                            <td class="status_up sortable normal_column">Active</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">QCOW2</td>
                            <td class="actions_column">

                                <div class="btn-group"><a
                                            href="/horizon/project/instances/launch?source_id=1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe&amp;source_type=instance_snapshot_id"
                                            class="btn btn-small btn-launch ajax-modal"
                                            id="images__row_1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe__action_launch_image">运行</a><a
                                            class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                        更多
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu row_actions clearfix">
                                        <li class="clearfix"><a
                                                    href="/horizon/project/volumes/create/?image_id=1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe"
                                                    class="btn btn-small ajax-modal btn-camera"
                                                    id="images__row_1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe__action_create_volume_from_image">创建云硬盘</a>
                                        </li>
                                        <li class="clearfix"><a
                                                    href="/horizon/project/images_and_snapshots/1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe/update/"
                                                    class="btn btn-small ajax-modal btn-edit"
                                                    id="images__row_1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe__action_edit">编辑</a>
                                        </li>
                                        <li class="clearfix">
                                            <button class="btn btn-small btn-danger btn-delete"
                                                    id="images__row_1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe__action_delete"
                                                    name="action"
                                                    value="images__delete__1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe"
                                                    type="submit">删除 镜像
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>


                        <tr class="ajax-update status_up category-public category-project even"
                            data-display="ubuntu_root_123456" data-update-interval="2500"
                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=5c736b38-b267-4623-9c4f-b90ba4b96e14"
                            id="images__row__5c736b38-b267-4623-9c4f-b90ba4b96e14" style="display: table-row;">
                            <td class="multi_select_column"><input name="object_ids"
                                                                   value="5c736b38-b267-4623-9c4f-b90ba4b96e14"
                                                                   type="checkbox"></td>
                            <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/5c736b38-b267-4623-9c4f-b90ba4b96e14/"
                                        class="">ubuntu_root_123456</a></td>
                            <td class="sortable normal_column">Snapshot</td>
                            <td class="status_up sortable normal_column">Active</td>
                            <td class="sortable normal_column">True</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">QCOW2</td>
                            <td class="actions_column">

                                <div class="btn-group"><a
                                            href="/horizon/project/instances/launch?source_id=5c736b38-b267-4623-9c4f-b90ba4b96e14&amp;source_type=instance_snapshot_id"
                                            class="btn btn-small btn-launch ajax-modal"
                                            id="images__row_5c736b38-b267-4623-9c4f-b90ba4b96e14__action_launch_image">运行</a><a
                                            class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                        更多
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu row_actions clearfix">
                                        <li class="clearfix"><a
                                                    href="/horizon/project/volumes/create/?image_id=5c736b38-b267-4623-9c4f-b90ba4b96e14"
                                                    class="btn btn-small ajax-modal btn-camera"
                                                    id="images__row_5c736b38-b267-4623-9c4f-b90ba4b96e14__action_create_volume_from_image">创建云硬盘</a>
                                        </li>
                                        <li class="clearfix"><a
                                                    href="/horizon/project/images_and_snapshots/5c736b38-b267-4623-9c4f-b90ba4b96e14/update/"
                                                    class="btn btn-small ajax-modal btn-edit"
                                                    id="images__row_5c736b38-b267-4623-9c4f-b90ba4b96e14__action_edit">编辑</a>
                                        </li>
                                        <li class="clearfix">
                                            <button class="btn btn-small btn-danger btn-delete"
                                                    id="images__row_5c736b38-b267-4623-9c4f-b90ba4b96e14__action_delete"
                                                    name="action"
                                                    value="images__delete__5c736b38-b267-4623-9c4f-b90ba4b96e14"
                                                    type="submit">删除 镜像
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>


                        <tr class="ajax-update status_up category-project odd" data-display="xubuntu_vnc_root"
                            data-update-interval="2500"
                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=2ca4995d-41e7-45ca-b5a4-e04646bb77fe"
                            id="images__row__2ca4995d-41e7-45ca-b5a4-e04646bb77fe" style="display: table-row;">
                            <td class="multi_select_column"><input name="object_ids"
                                                                   value="2ca4995d-41e7-45ca-b5a4-e04646bb77fe"
                                                                   type="checkbox"></td>
                            <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/2ca4995d-41e7-45ca-b5a4-e04646bb77fe/"
                                        class="">xubuntu_vnc_root</a></td>
                            <td class="sortable normal_column">Snapshot</td>
                            <td class="status_up sortable normal_column">Active</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">QCOW2</td>
                            <td class="actions_column">

                                <div class="btn-group"><a
                                            href="/horizon/project/instances/launch?source_id=2ca4995d-41e7-45ca-b5a4-e04646bb77fe&amp;source_type=instance_snapshot_id"
                                            class="btn btn-small btn-launch ajax-modal"
                                            id="images__row_2ca4995d-41e7-45ca-b5a4-e04646bb77fe__action_launch_image">运行</a><a
                                            class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                        更多
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu row_actions clearfix">
                                        <li class="clearfix"><a
                                                    href="/horizon/project/volumes/create/?image_id=2ca4995d-41e7-45ca-b5a4-e04646bb77fe"
                                                    class="btn btn-small ajax-modal btn-camera"
                                                    id="images__row_2ca4995d-41e7-45ca-b5a4-e04646bb77fe__action_create_volume_from_image">创建云硬盘</a>
                                        </li>
                                        <li class="clearfix"><a
                                                    href="/horizon/project/images_and_snapshots/2ca4995d-41e7-45ca-b5a4-e04646bb77fe/update/"
                                                    class="btn btn-small ajax-modal btn-edit"
                                                    id="images__row_2ca4995d-41e7-45ca-b5a4-e04646bb77fe__action_edit">编辑</a>
                                        </li>
                                        <li class="clearfix">
                                            <button class="btn btn-small btn-danger btn-delete"
                                                    id="images__row_2ca4995d-41e7-45ca-b5a4-e04646bb77fe__action_delete"
                                                    name="action"
                                                    value="images__delete__2ca4995d-41e7-45ca-b5a4-e04646bb77fe"
                                                    type="submit">删除 镜像
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>


                        <tr class="ajax-update status_up category-public even" data-display="windows2012"
                            data-update-interval="2500"
                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=bbb5981b-31da-4d7c-8990-52346c13d7ac"
                            id="images__row__bbb5981b-31da-4d7c-8990-52346c13d7ac" style="display: none;">
                            <td class="multi_select_column"><input name="object_ids"
                                                                   value="bbb5981b-31da-4d7c-8990-52346c13d7ac"
                                                                   type="checkbox"></td>
                            <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/bbb5981b-31da-4d7c-8990-52346c13d7ac/"
                                        class="">windows2012</a></td>
                            <td class="sortable normal_column">Image</td>
                            <td class="status_up sortable normal_column">Active</td>
                            <td class="sortable normal_column">True</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">QCOW2</td>
                            <td class="actions_column">

                                <div class="btn-group"><a
                                            href="/horizon/project/instances/launch?source_id=bbb5981b-31da-4d7c-8990-52346c13d7ac&amp;source_type=image_id"
                                            class="btn btn-small btn-launch ajax-modal"
                                            id="images__row_bbb5981b-31da-4d7c-8990-52346c13d7ac__action_launch_image">运行</a><a
                                            class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                        更多
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu row_actions clearfix">
                                        <li class="clearfix"><a
                                                    href="/horizon/project/volumes/create/?image_id=bbb5981b-31da-4d7c-8990-52346c13d7ac"
                                                    class="btn btn-small ajax-modal btn-camera"
                                                    id="images__row_bbb5981b-31da-4d7c-8990-52346c13d7ac__action_create_volume_from_image">创建云硬盘</a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>


                        <tr class="ajax-update status_up category-public odd" data-display="ubuntu"
                            data-update-interval="2500"
                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=d6cbd4dc-5252-4e7b-99c1-735a2b05fe55"
                            id="images__row__d6cbd4dc-5252-4e7b-99c1-735a2b05fe55" style="display: none;">
                            <td class="multi_select_column"><input name="object_ids"
                                                                   value="d6cbd4dc-5252-4e7b-99c1-735a2b05fe55"
                                                                   type="checkbox"></td>
                            <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/d6cbd4dc-5252-4e7b-99c1-735a2b05fe55/"
                                        class="">ubuntu</a></td>
                            <td class="sortable normal_column">Image</td>
                            <td class="status_up sortable normal_column">Active</td>
                            <td class="sortable normal_column">True</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">QCOW2</td>
                            <td class="actions_column">

                                <div class="btn-group"><a
                                            href="/horizon/project/instances/launch?source_id=d6cbd4dc-5252-4e7b-99c1-735a2b05fe55&amp;source_type=image_id"
                                            class="btn btn-small btn-launch ajax-modal"
                                            id="images__row_d6cbd4dc-5252-4e7b-99c1-735a2b05fe55__action_launch_image">运行</a><a
                                            class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                        更多
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu row_actions clearfix">
                                        <li class="clearfix"><a
                                                    href="/horizon/project/volumes/create/?image_id=d6cbd4dc-5252-4e7b-99c1-735a2b05fe55"
                                                    class="btn btn-small ajax-modal btn-camera"
                                                    id="images__row_d6cbd4dc-5252-4e7b-99c1-735a2b05fe55__action_create_volume_from_image">创建云硬盘</a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>


                        <tr class="ajax-update status_up category-public even" data-display="fedora"
                            data-update-interval="2500"
                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=95247e6d-5486-4b58-a106-568522ce9506"
                            id="images__row__95247e6d-5486-4b58-a106-568522ce9506" style="display: none;">
                            <td class="multi_select_column"><input name="object_ids"
                                                                   value="95247e6d-5486-4b58-a106-568522ce9506"
                                                                   type="checkbox"></td>
                            <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/95247e6d-5486-4b58-a106-568522ce9506/"
                                        class="">fedora</a></td>
                            <td class="sortable normal_column">Image</td>
                            <td class="status_up sortable normal_column">Active</td>
                            <td class="sortable normal_column">True</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">QCOW2</td>
                            <td class="actions_column">

                                <div class="btn-group"><a
                                            href="/horizon/project/instances/launch?source_id=95247e6d-5486-4b58-a106-568522ce9506&amp;source_type=image_id"
                                            class="btn btn-small btn-launch ajax-modal"
                                            id="images__row_95247e6d-5486-4b58-a106-568522ce9506__action_launch_image">运行</a><a
                                            class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                        更多
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu row_actions clearfix">
                                        <li class="clearfix"><a
                                                    href="/horizon/project/volumes/create/?image_id=95247e6d-5486-4b58-a106-568522ce9506"
                                                    class="btn btn-small ajax-modal btn-camera"
                                                    id="images__row_95247e6d-5486-4b58-a106-568522ce9506__action_create_volume_from_image">创建云硬盘</a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>


                        <tr class="ajax-update status_up category-public odd" data-display="small"
                            data-update-interval="2500"
                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=b8f3811c-f595-48b2-b4a2-7641f960f37e"
                            id="images__row__b8f3811c-f595-48b2-b4a2-7641f960f37e" style="display: none;">
                            <td class="multi_select_column"><input name="object_ids"
                                                                   value="b8f3811c-f595-48b2-b4a2-7641f960f37e"
                                                                   type="checkbox"></td>
                            <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/b8f3811c-f595-48b2-b4a2-7641f960f37e/"
                                        class="">small</a></td>
                            <td class="sortable normal_column">Image</td>
                            <td class="status_up sortable normal_column">Active</td>
                            <td class="sortable normal_column">True</td>
                            <td class="sortable normal_column">False</td>
                            <td class="sortable normal_column">QCOW2</td>
                            <td class="actions_column">

                                <div class="btn-group"><a
                                            href="/horizon/project/instances/launch?source_id=b8f3811c-f595-48b2-b4a2-7641f960f37e&amp;source_type=image_id"
                                            class="btn btn-small btn-launch ajax-modal"
                                            id="images__row_b8f3811c-f595-48b2-b4a2-7641f960f37e__action_launch_image">运行</a><a
                                            class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                        更多
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu row_actions clearfix">
                                        <li class="clearfix"><a
                                                    href="/horizon/project/volumes/create/?image_id=b8f3811c-f595-48b2-b4a2-7641f960f37e"
                                                    class="btn btn-small ajax-modal btn-camera"
                                                    id="images__row_b8f3811c-f595-48b2-b4a2-7641f960f37e__action_create_volume_from_image">创建云硬盘</a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
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


                </form>
            </div>


        </div>

        <div class="table_wrapper row-fluid">
            <div class="span12">
                <div class="tab-content container" style="border: 0">
                    <div class="sx-10">
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>热门镜像TOP 10</h3>
                            </div>
                            <div style="background: white">
                                <div id="top-popular-image" class="graph-table"></div>
                            </div>
                        </div>
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>热门镜像列表</h3>
                            </div>
                            <div style="background: white">
                                <div id="popular-image-list" class="graph-table">
                                    <table class="table table-bordered table-striped datatable">
                                        <thead>




                                        <tr>

                                            <th class="multi_select_column"><input type="checkbox"></th>
                                            <th class="sortable anchor normal_column header">镜像名称</th>
                                            <th class="sortable normal_column header">创建次数</th>
                                            <th class="sortable normal_column header">当前活跃VM</th>
                                        </tr>


                                        </thead>

                                        <tbody>




                                        <tr class="ajax-update status_up category-public category-project even"
                                            data-display="Ubuntu 15.10" data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=300d0466-641a-46fb-8f52-e897db57379f"
                                            style="display: table-row;">
                                            <td class="multi_select_column"><input name="object_ids"
                                                                                   value="300d0466-641a-46fb-8f52-e897db57379f"
                                                                                   type="checkbox"></td>
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/300d0466-641a-46fb-8f52-e897db57379f/"
                                                        class="">Ubuntu 15.10</a></td>
                                            <td class="sortable normal_column">956</td>
                                            <td class="status_up sortable normal_column">32</td>
                                        </tr>

                                        <tr class="ajax-update status_up category-public odd" data-display="ubuntu"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=d6cbd4dc-5252-4e7b-99c1-735a2b05fe55"
                                            style="display: table-row;">
                                            <td class="multi_select_column"><input name="object_ids"
                                                                                   value="d6cbd4dc-5252-4e7b-99c1-735a2b05fe55"
                                                                                   type="checkbox"></td>
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/d6cbd4dc-5252-4e7b-99c1-735a2b05fe55/"
                                                        class="">ubuntu</a></td>
                                            <td class="sortable normal_column">863</td>
                                            <td class="status_up sortable normal_column">45</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public even" data-display="fedora"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=95247e6d-5486-4b58-a106-568522ce9506"
                                            style="display: table-row;">
                                            <td class="multi_select_column"><input name="object_ids"
                                                                                   value="95247e6d-5486-4b58-a106-568522ce9506"
                                                                                   type="checkbox"></td>
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/95247e6d-5486-4b58-a106-568522ce9506/"
                                                        class="">fedora</a></td>
                                            <td class="sortable normal_column">752</td>
                                            <td class="status_up sortable normal_column">41</td>
                                        </tr>

                                        <tr class="ajax-update status_up category-project odd" data-display="spark_langren1992"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=c97f5bf0-ffbe-48fc-b816-b602ba898039"
                                            style="display: table-row;">
                                            <td class="multi_select_column"><input name="object_ids"
                                                                                   value="c97f5bf0-ffbe-48fc-b816-b602ba898039"
                                                                                   type="checkbox"></td>
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/c97f5bf0-ffbe-48fc-b816-b602ba898039/"
                                                        class="">spark_langren1992</a></td>
                                            <td class="sortable normal_column">596</td>
                                            <td class="status_up sortable normal_column">20</td>
                                        </tr>

                                        <tr class="ajax-update status_up category-project odd" data-display="jiahui-jin's VM2"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=83800116-1316-4402-acf9-c64926565f77"
                                            style="display: table-row;">
                                            <td class="multi_select_column"><input name="object_ids"
                                                                                   value="83800116-1316-4402-acf9-c64926565f77"
                                                                                   type="checkbox"></td>
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/83800116-1316-4402-acf9-c64926565f77/"
                                                        class="">jiahui-jin's VM2</a></td>
                                            <td class="sortable normal_column">120</td>
                                            <td class="status_up sortable normal_column">15</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public category-project odd" data-display="rickey"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=993bafd8-c5a5-41a1-b8fd-b3683264c49e"
                                            style="display: table-row;">
                                            <td class="multi_select_column"><input name="object_ids"
                                                                                   value="993bafd8-c5a5-41a1-b8fd-b3683264c49e"
                                                                                   type="checkbox"></td>
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/993bafd8-c5a5-41a1-b8fd-b3683264c49e/"
                                                        class="">rickey</a></td>
                                            <td class="sortable normal_column">98</td>
                                            <td class="status_up sortable normal_column">5</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-project even" data-display="cc-analytics"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=498c13a1-62ba-415e-9000-19cdf2ceee87"
                                            style="display: table-row;">
                                            <td class="multi_select_column"><input name="object_ids"
                                                                                   value="498c13a1-62ba-415e-9000-19cdf2ceee87"
                                                                                   type="checkbox"></td>
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/498c13a1-62ba-415e-9000-19cdf2ceee87/"
                                                        class="">cc-analytics</a></td>
                                            <td class="sortable normal_column">50</td>
                                            <td class="status_up sortable normal_column">3</td>
                                        </tr>

                                        <tr class="ajax-update status_up category-public category-project even"
                                            data-display="ubuntu_root_123456" data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=5c736b38-b267-4623-9c4f-b90ba4b96e14"
                                            style="display: table-row;">
                                            <td class="multi_select_column"><input name="object_ids"
                                                                                   value="5c736b38-b267-4623-9c4f-b90ba4b96e14"
                                                                                   type="checkbox"></td>
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/5c736b38-b267-4623-9c4f-b90ba4b96e14/"
                                                        class="">ubuntu_root_123456</a></td>
                                            <td class="sortable normal_column">48</td>
                                            <td class="status_up sortable normal_column">6</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-project odd" data-display="xubuntu_vnc_root"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=2ca4995d-41e7-45ca-b5a4-e04646bb77fe"
                                            style="display: table-row;">
                                            <td class="multi_select_column"><input name="object_ids"
                                                                                   value="2ca4995d-41e7-45ca-b5a4-e04646bb77fe"
                                                                                   type="checkbox"></td>
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/2ca4995d-41e7-45ca-b5a4-e04646bb77fe/"
                                                        class="">xubuntu_vnc_root</a></td>
                                            <td class="sortable normal_column">40</td>
                                            <td class="status_up sortable normal_column">4</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public even" data-display="windows2012"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=bbb5981b-31da-4d7c-8990-52346c13d7ac"
                                            style="display: table-row;">
                                            <td class="multi_select_column"><input name="object_ids"
                                                                                   value="bbb5981b-31da-4d7c-8990-52346c13d7ac"
                                                                                   type="checkbox"></td>
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/bbb5981b-31da-4d7c-8990-52346c13d7ac/"
                                                        class="">windows2012</a></td>
                                            <td class="sortable normal_column">38</td>
                                            <td class="status_up sortable normal_column">6</td>
                                        </tr>





                                        <tr class="ajax-update status_up category-public odd" data-display="small"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=b8f3811c-f595-48b2-b4a2-7641f960f37e"
                                            style="display: none;">
                                            <td class="multi_select_column"><input name="object_ids"
                                                                                   value="b8f3811c-f595-48b2-b4a2-7641f960f37e"
                                                                                   type="checkbox"></td>
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/b8f3811c-f595-48b2-b4a2-7641f960f37e/"
                                                        class="">small</a></td>
                                            <td class="sortable normal_column">Image</td>
                                            <td class="status_up sortable normal_column">Active</td>
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
                        <div class="graph-border sx-10" style="width: 98%;">
                            <div class="graph-header">
                                <h3>热门镜像历史热度统计</h3>
                            </div>
                            <div style="background: white">
                                <div id="hot-image-history" class="graph-container"></div>
                            </div>
                        </div>

                        <div class="graph-border sx-10" style="width: 98%">
                            <div class="graph-header">
                                <h3>镜像大小分布</h3>
                            </div>
                            <div style="background: white; height: 300px">
                                <div id="image-dir" class="graph-container sx-5" style="height: 300px; padding: 0"></div>
                                <div class="graph-container graph-text" style="background: white; margin-left: 0">
                                    <span class="sx-10">最大镜像： 18.6GB windows2012</span>
                                    <span class="sx-10" style="margin-top: 65px">最小镜像：0.15GB Cirros</span>
                                    <span class="sx-10" style="margin-top: 65px">平均镜像大小：6.11GB Cirros</span>
                                    <span class="sx-10" style="margin-top: 65px">镜像大小中位数：3.41GB Cirros</span>
                                </div>

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
    Highcharts.chart('top-popular-image', {
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },
        xAxis: {
            categories: [
                'Ubuntu 15.10',
                'ubuntu',
                'fedora',
                'spark_langren1992',
                'jiahui-jins VM2',
                'rickey',
                'cc-analytics',
                'ubuntu_root_123456',
                'xubuntu_vnc_root',
                'windows2012'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: '镜像热度'
            }
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
            name: '创建次数(24h)',
            data: [56, 63, 52, 96, 20, 48, 20, 28, 10, 8]

        }, {
            name: '当前活跃VM',
            data: [32, 45, 41, 20, 15, 5, 5, 3, 6, 4]

        }]
    });
</script>


<script type="text/javascript">
    Highcharts.chart('hot-image-history', {
        chart: {
            type: 'column'
        },
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
            min: 0,
            title: {
                text: 'Top 10镜像平均热度'
            }
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
            name: '创建VM数',
            data: [49, 71, 106, 129, 144, 176, 135, 148, 216, 194, 95, 54]

        },
            {
                name: '最高活跃VM数',
                data: [35, 65, 104, 122, 140, 140, 112, 132, 195, 175, 56, 44]

            }]
    });
</script>

<script type="text/javascript">
    Highcharts.chart('image-dir', {

        chart: {
            type: 'column'
        },

        title: {
            text: ''
        },

        xAxis: {
            categories: ['<1GB', '1-2GB', '2-3GB', '3-4GB', '4-5GB', '5-6GB', '6-7GB', '7-8GB', '8-9GB', '9-10GB', '10-11GB', '11-12GB', '12-13GB', '13-14GB', '14-15GB', '15-16GB', '16-17GB', '17-18GB']
        },

        yAxis: {
            allowDecimals: false,
            min: 0,
            title: {
                text: '镜像大小'
            }
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

        tooltip: {
            formatter: function () {
                return '<b>' + this.x + '</b><br/>' +
                    this.series.name + ': ' + this.y + '<br/>' +
                    'Total: ' + this.point.stackTotal;
            }
        },

        plotOptions: {
            column: {
                stacking: 'normal'
            }
        },

        series: [{
            name: 'Snapshot',
            data: [17, 15, 8,1,3,5,47,8,7,10,9,19,9,1,9,9,5,3]

        }, {
            name: 'Image',
            data: [25,10,5,5,4,5,26,11,9,19,5,16,9,3,7,8,6,2]

        }]
    });
</script>
</html>