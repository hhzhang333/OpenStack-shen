<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>资源分配 - OpenStack Dashboard</title>


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
                <a href="resourceAllocator.ftl" class="active" tabindex="1">负载分配</a>
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
                <h2>负载分配</h2>
            </div>
        </div>
        <div class="table_wrapper row-fluid">
            <div class="span12">
                <div class="tab-content container" style="border: 0">
                    <div class="sx-10">
                        <div class="graph-border sx-10" style="width: 98%; background-color: white">
                            <div class="graph-header">
                                <h3>Hypervisor Summary</h3>
                            </div>
                            <div style="background: white">
                                <div id="vcpu-usage" class="graph-container sx-2 sx-margin"></div>
                                <div id="memory-usage" class="graph-container sx-2 sx-margin"></div>
                                <div id="storage-usage" class="graph-container sx-2 sx-margin"></div>
                                <div id="bandwidth-usage" class="graph-container sx-2 sx-margin"></div>
                            </div>
                        </div>

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
                                        <h3 class="table_title">Hypervisor</h3>
                                    </th>
                                </tr>


                                <tr>

                                    <th class="sortable anchor normal_column header">镜像名称</th>
                                    <th class="sortable normal_column header">热度</th>
                                    <th class="sortable normal_column header">大小</th>
                                    <th class="sortable normal_column header">副本数</th>
                                    <th class="sortable normal_column header">传输率</th>
                                    <th class="sortable normal_column header">格式化</th>

                                </tr>


                                </thead>

                                <tbody>

                                <tr class="ajax-update status_up category-project odd" data-display="spark_langren1992"
                                    data-update-interval="2500"
                                    data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=c97f5bf0-ffbe-48fc-b816-b602ba898039"
                                    id="images__row__c97f5bf0-ffbe-48fc-b816-b602ba898039" style="display: table-row;">
                                    <td class="sortable anchor normal_column"><a
                                                href="/horizon/project/images_and_snapshots/c97f5bf0-ffbe-48fc-b816-b602ba898039/"
                                                class="">spark_langren1992</a></td>
                                    <td class="sortable normal_column">Snapshot</td>
                                    <td class="status_up sortable normal_column">Active</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">QCOW2</td>
                                </tr>


                                <tr class="ajax-update status_up category-public category-project even"
                                    data-display="Ubuntu 15.10" data-update-interval="2500"
                                    data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=300d0466-641a-46fb-8f52-e897db57379f"
                                    id="images__row__300d0466-641a-46fb-8f52-e897db57379f" style="display: table-row;">
                                    <td class="sortable anchor normal_column"><a
                                                href="/horizon/project/images_and_snapshots/300d0466-641a-46fb-8f52-e897db57379f/"
                                                class="">Ubuntu 15.10</a></td>
                                    <td class="sortable normal_column">Image</td>
                                    <td class="status_up sortable normal_column">Active</td>
                                    <td class="sortable normal_column">True</td>
                                    <td class="sortable normal_column">True</td>
                                    <td class="sortable normal_column">QCOW2</td>
                                </tr>


                                <tr class="ajax-update status_up category-project odd" data-display="jiahui-jin's VM2"
                                    data-update-interval="2500"
                                    data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=83800116-1316-4402-acf9-c64926565f77"
                                    id="images__row__83800116-1316-4402-acf9-c64926565f77" style="display: table-row;">
                                    <td class="sortable anchor normal_column"><a
                                                href="/horizon/project/images_and_snapshots/5a2f2c00-9c73-4ac7-9ebe-92421afd0313/"
                                                class="">net_test_ubuntu</a></td>
                                    <td class="sortable normal_column">Snapshot</td>
                                    <td class="status_up sortable normal_column">Active</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">QCOW2</td>
                                </tr>


                                <tr class="ajax-update status_up category-public category-project odd" data-display="rickey"
                                    data-update-interval="2500"
                                    data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=993bafd8-c5a5-41a1-b8fd-b3683264c49e"
                                    id="images__row__993bafd8-c5a5-41a1-b8fd-b3683264c49e" style="display: table-row;">
                                    <td class="sortable anchor normal_column"><a
                                                href="/horizon/project/images_and_snapshots/993bafd8-c5a5-41a1-b8fd-b3683264c49e/"
                                                class="">rickey</a></td>
                                    <td class="sortable normal_column">Image</td>
                                    <td class="status_up sortable normal_column">Active</td>
                                    <td class="sortable normal_column">True</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">QCOW2</td>
                                </tr>


                                <tr class="ajax-update status_up category-project even" data-display="cc-analytics"
                                    data-update-interval="2500"
                                    data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=498c13a1-62ba-415e-9000-19cdf2ceee87"
                                    id="images__row__498c13a1-62ba-415e-9000-19cdf2ceee87" style="display: table-row;">
                                    <td class="sortable anchor normal_column"><a
                                                href="/horizon/project/images_and_snapshots/5a2f2c00-9c73-4ac7-9ebe-92421afd0313/"
                                                class="">net_test_ubuntu</a></td>
                                    <td class="sortable normal_column">Snapshot</td>
                                    <td class="status_up sortable normal_column">Active</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">QCOW2</td>
                                </tr>

                                <tr class="ajax-update status_up category-project odd" data-display="ftp_test_linux"
                                    data-update-interval="2500"
                                    data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=9d41c1bc-2ca6-4d46-85cc-513aa1e92e64"
                                    id="images__row__9d41c1bc-2ca6-4d46-85cc-513aa1e92e64" style="display: table-row;">
                                    <td class="sortable anchor normal_column"><a
                                                href="/horizon/project/images_and_snapshots/5a2f2c00-9c73-4ac7-9ebe-92421afd0313/"
                                                class="">net_test_ubuntu</a></td>
                                    <td class="sortable normal_column">Snapshot</td>
                                    <td class="status_up sortable normal_column">Active</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">QCOW2</td>
                                </tr>


                                <tr class="ajax-update status_up category-project even" data-display="net_test_ubuntu"
                                    data-update-interval="2500"
                                    data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=5a2f2c00-9c73-4ac7-9ebe-92421afd0313"
                                    id="images__row__5a2f2c00-9c73-4ac7-9ebe-92421afd0313" style="display: table-row;">
                                    <td class="sortable anchor normal_column"><a
                                                href="/horizon/project/images_and_snapshots/5a2f2c00-9c73-4ac7-9ebe-92421afd0313/"
                                                class="">net_test_ubuntu</a></td>
                                    <td class="sortable normal_column">Snapshot</td>
                                    <td class="status_up sortable normal_column">Active</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">QCOW2</td>
                                </tr>


                                <tr class="ajax-update status_up category-project odd" data-display="tiny_iperf_auto_test"
                                    data-update-interval="2500"
                                    data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe"
                                    id="images__row__1bd7e794-9f2d-46cd-a6c9-c97e7ffc36fe" style="display: table-row;">
                                    <td class="sortable anchor normal_column"><a
                                                href="/horizon/project/images_and_snapshots/5a2f2c00-9c73-4ac7-9ebe-92421afd0313/"
                                                class="">net_test_ubuntu</a></td>
                                    <td class="sortable normal_column">Snapshot</td>
                                    <td class="status_up sortable normal_column">Active</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">QCOW2</td>
                                </tr>


                                <tr class="ajax-update status_up category-public category-project even"
                                    data-display="ubuntu_root_123456" data-update-interval="2500"
                                    data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=5c736b38-b267-4623-9c4f-b90ba4b96e14"
                                    id="images__row__5c736b38-b267-4623-9c4f-b90ba4b96e14" style="display: table-row;">
                                    <td class="sortable anchor normal_column"><a
                                                href="/horizon/project/images_and_snapshots/5a2f2c00-9c73-4ac7-9ebe-92421afd0313/"
                                                class="">net_test_ubuntu</a></td>
                                    <td class="sortable normal_column">Snapshot</td>
                                    <td class="status_up sortable normal_column">Active</td>
                                    <td class="sortable normal_column">True</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">QCOW2</td>
                                </tr>


                                <tr class="ajax-update status_up category-project odd" data-display="xubuntu_vnc_root"
                                    data-update-interval="2500"
                                    data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=2ca4995d-41e7-45ca-b5a4-e04646bb77fe"
                                    id="images__row__2ca4995d-41e7-45ca-b5a4-e04646bb77fe" style="display: table-row;">
                                    <td class="sortable anchor normal_column"><a
                                                href="/horizon/project/images_and_snapshots/5a2f2c00-9c73-4ac7-9ebe-92421afd0313/"
                                                class="">net_test_ubuntu</a></td>
                                    <td class="sortable normal_column">Snapshot</td>
                                    <td class="status_up sortable normal_column">Active</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">False</td>
                                    <td class="sortable normal_column">QCOW2</td>
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
                                <div class="graph-border sx-10" style="width: 98%">
                                    <div class="graph-header">
                                        <h3>虚拟机累计迁移次数：迁入</h3>
                                    </div>
                                    <div style="background: white">
                                        <div id="migrate-in" class="graph-container"></div>
                                    </div>
                                </div>

                                <div class="graph-border sx-10" style="width: 98%">
                                    <div class="graph-header">
                                        <h3>虚拟机累计迁移次数：迁出</h3>
                                    </div>
                                    <div style="background: white">
                                        <div id="migrate-out" class="graph-container"></div>
                                    </div>
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

    // Make monochrome colors and set them as default for all pies
    Highcharts.getOptions().plotOptions.pie.colors = (function () {
        var colors = [],
            base = Highcharts.getOptions().colors[0],
            i;

        for (i = 0; i < 10; i += 1) {
            // Start out with a darkened base color (negative brighten), and end
            // up with a much brighter color
            colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
        }
        return colors;
    }());

    // Build the chart
    Highcharts.chart('vcpu-usage', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'VCPU'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Brands',
            data: [
                { name: 'Microsoft Internet Explorer', y: 56.33 },
                { name: 'Chrome', y: 24.03 },
                { name: 'Firefox', y: 10.38 },
                { name: 'Safari', y: 4.77 },
                { name: 'Opera', y: 0.91 },
                { name: 'Proprietary or Undetectable', y: 0.2 }
            ]
        }]
    });
</script>
<script type="text/javascript">

    // Make monochrome colors and set them as default for all pies
    Highcharts.getOptions().plotOptions.pie.colors = (function () {
        var colors = [],
            base = Highcharts.getOptions().colors[0],
            i;

        for (i = 0; i < 10; i += 1) {
            // Start out with a darkened base color (negative brighten), and end
            // up with a much brighter color
            colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
        }
        return colors;
    }());

    // Build the chart
    Highcharts.chart('memory-usage', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Memory'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Brands',
            data: [
                { name: 'Microsoft Internet Explorer', y: 56.33 },
                { name: 'Chrome', y: 24.03 },
                { name: 'Firefox', y: 10.38 },
                { name: 'Safari', y: 4.77 },
                { name: 'Opera', y: 0.91 },
                { name: 'Proprietary or Undetectable', y: 0.2 }
            ]
        }]
    });
</script>
<script type="text/javascript">

    // Make monochrome colors and set them as default for all pies
    Highcharts.getOptions().plotOptions.pie.colors = (function () {
        var colors = [],
            base = Highcharts.getOptions().colors[0],
            i;

        for (i = 0; i < 10; i += 1) {
            // Start out with a darkened base color (negative brighten), and end
            // up with a much brighter color
            colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
        }
        return colors;
    }());

    // Build the chart
    Highcharts.chart('storage-usage', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Storage'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Brands',
            data: [
                { name: 'Microsoft Internet Explorer', y: 56.33 },
                { name: 'Chrome', y: 24.03 },
                { name: 'Firefox', y: 10.38 },
                { name: 'Safari', y: 4.77 },
                { name: 'Opera', y: 0.91 },
                { name: 'Proprietary or Undetectable', y: 0.2 }
            ]
        }]
    });
</script>
<script type="text/javascript">

    // Make monochrome colors and set them as default for all pies
    Highcharts.getOptions().plotOptions.pie.colors = (function () {
        var colors = [],
            base = Highcharts.getOptions().colors[0],
            i;

        for (i = 0; i < 10; i += 1) {
            // Start out with a darkened base color (negative brighten), and end
            // up with a much brighter color
            colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
        }
        return colors;
    }());

    // Build the chart
    Highcharts.chart('bandwidth-usage', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Bandwidth'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Brands',
            data: [
                { name: 'Microsoft Internet Explorer', y: 56.33 },
                { name: 'Chrome', y: 24.03 },
                { name: 'Firefox', y: 10.38 },
                { name: 'Safari', y: 4.77 },
                { name: 'Opera', y: 0.91 },
                { name: 'Proprietary or Undetectable', y: 0.2 }
            ]
        }]
    });
</script>

<script type="text/javascript">
    Highcharts.chart('migrate-in', {
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },
        xAxis: {
            categories: [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
                'Jul',
                'Aug',
                'Sep',
                'Oct',
                'Nov',
                'Dec'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Rainfall (mm)'
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
                '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
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
            name: 'Tokyo',
            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

        }]
    });
</script>

<script type="text/javascript">
    Highcharts.chart('migrate-out', {
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },
        xAxis: {
            categories: [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
                'Jul',
                'Aug',
                'Sep',
                'Oct',
                'Nov',
                'Dec'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Rainfall (mm)'
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
                '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
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
            name: 'Tokyo',
            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

        }]
    });
</script>
</html>