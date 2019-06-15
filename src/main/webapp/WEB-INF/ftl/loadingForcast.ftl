<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>负载预测 - OpenStack Dashboard</title>


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
                <a href="loadingMonitor.ftl">负载监控</a>
            </li>
            <li>
                <a href="loadingForcast.ftl" class="active" tabindex="1">负载预测</a>
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
                <h2>负载预测</h2>
            </div>
        </div>

        <div class="table_wrapper row-fluid">
            <div class="span12">
                <div class="tab-content container" style="border: 0">
                    当前时间： Oct. 24, 2017, 9:08 a.m. 下一小时负载预计： 78  明天负载预计：566
                    <div class="sx-10">
                        <div class="graph-border sx-10" style="width: 98%">
                            <div class="graph-header">
                                <h3>负载预测</h3>
                            </div>
                            <div style="background: white">
                                <div id="network-load" class="graph-container" style="height: 250px"></div>
                            </div>
                        </div>
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>预测错误率</h3>
                            </div>
                            <div style="background: white">
                                <div id="error-rate" class="graph-table" style="height: 338px"></div>
                            </div>
                        </div>
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>预测分析</h3>
                            </div>
                            <div style="background: white">
                                <div id="popular-image-list" class="graph-table">
                                    <table class="table table-bordered table-striped datatable">
                                        <thead>
                                        <tr>

                                            <th class="sortable anchor normal_column header">预测指标</th>
                                            <th class="sortable normal_column header">灰度预测</th>
                                            <th class="sortable normal_column header">时间序列分析</th>
                                        </tr>


                                        </thead>

                                        <tbody>

                                        <tr class="ajax-update status_up category-project odd" data-display="spark_langren1992"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=c97f5bf0-ffbe-48fc-b816-b602ba898039"
                                            style="display: table-row;">
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/c97f5bf0-ffbe-48fc-b816-b602ba898039/"
                                                        class="">error</a></td>
                                            <td class="sortable normal_column">12.8%</td>
                                            <td class="status_up sortable normal_column">9.2%</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public category-project even"
                                            data-display="Ubuntu 15.10" data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=300d0466-641a-46fb-8f52-e897db57379f"
                                            style="display: table-row;">

                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/300d0466-641a-46fb-8f52-e897db57379f/"
                                                        class="">erange</a></td>
                                            <td class="sortable normal_column">42.2</td>
                                            <td class="status_up sortable normal_column">38.8</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-project odd" data-display="jiahui-jin's VM2"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=83800116-1316-4402-acf9-c64926565f77"
                                            style="display: table-row;">
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/83800116-1316-4402-acf9-c64926565f77/"
                                                        class="">e-</a></td>
                                            <td class="sortable normal_column">24.5%</td>
                                            <td class="status_up sortable normal_column">36.6%</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public category-project odd" data-display="rickey"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=993bafd8-c5a5-41a1-b8fd-b3683264c49e"
                                            style="display: table-row;">

                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/993bafd8-c5a5-41a1-b8fd-b3683264c49e/"
                                                        class="">e+</a></td>
                                            <td class="sortable normal_column">75.5</td>
                                            <td class="status_up sortable normal_column">63.4</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-project even" data-display="cc-analytics"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=498c13a1-62ba-415e-9000-19cdf2ceee87"
                                            style="display: table-row;">
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/498c13a1-62ba-415e-9000-19cdf2ceee87/"
                                                        class="">e-range</a></td>
                                            <td class="sortable normal_column">23.9</td>
                                            <td class="status_up sortable normal_column">36.8</td>
                                        </tr>

                                        <tr class="ajax-update status_up category-public category-project even"
                                            data-display="ubuntu_root_123456" data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=5c736b38-b267-4623-9c4f-b90ba4b96e14"
                                            style="display: table-row;">
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/5c736b38-b267-4623-9c4f-b90ba4b96e14/"
                                                        class="">e+range</a></td>
                                            <td class="sortable normal_column">56.1</td>
                                            <td class="status_up sortable normal_column">55.7</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-project odd" data-display="xubuntu_vnc_root"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=2ca4995d-41e7-45ca-b5a4-e04646bb77fe"
                                            style="display: table-row;">
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/2ca4995d-41e7-45ca-b5a4-e04646bb77fe/"
                                                        class="">eratio</a></td>
                                            <td class="sortable normal_column">7.6/10</td>
                                            <td class="status_up sortable normal_column">8.6/10</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public even" data-display="windows2012"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=bbb5981b-31da-4d7c-8990-52346c13d7ac"
                                            style="display: none;">
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/bbb5981b-31da-4d7c-8990-52346c13d7ac/"
                                                        class="">windows2012</a></td>
                                            <td class="sortable normal_column">Image</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public odd" data-display="ubuntu"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=d6cbd4dc-5252-4e7b-99c1-735a2b05fe55"
                                            style="display: none;">
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/d6cbd4dc-5252-4e7b-99c1-735a2b05fe55/"
                                                        class="">ubuntu</a></td>
                                            <td class="sortable normal_column">Image</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                        </tr>


                                        <tr class="ajax-update status_up category-public even" data-display="fedora"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=95247e6d-5486-4b58-a106-568522ce9506"
                                            style="display: none;">
                                            <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/95247e6d-5486-4b58-a106-568522ce9506/"
                                                        class="">fedora</a></td>
                                            <td class="sortable normal_column">Image</td>
                                            <td class="status_up sortable normal_column">Active</td>
                                        </tr>

                                        <tr class="ajax-update status_up category-public odd" data-display="small"
                                            data-update-interval="2500"
                                            data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=b8f3811c-f595-48b2-b4a2-7641f960f37e"
                                            style="display: none;">

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
                                                <span class="table_count">显示7项指标</span>

                                            </td>
                                        </tr>
                                        </tfoot>


                                    </table>
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
    Highcharts.chart('network-load', {
        chart: {
            type: 'area'
        },
        title: {
            text: ''
        },
        xAxis: {
            categories: [
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
                '2017-10-24',
                '2017-10-25',
            ],
            tickmarkPlacement: 'on',
            title: {
                enabled: false
            }
        },
        yAxis: {
            title: {
                text: '预测负载'
            },
            labels: {
                formatter: function () {
                    return this.value;
                }
            }
        },
        tooltip: {
            shared: true,
            crosshairs: true
        },legend: {
            align: 'left',
            x: 60,
            verticalAlign: 'top',
            y: 5,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },
        plotOptions: {
            area: {
                stacking: 'normal',
                lineColor: '#666666',
                lineWidth: 1,
                marker: {
                    lineWidth: 1,
                    lineColor: '#666666'
                }
            }
        },
        series: [{
            name: '真实负载',
            data: [777, 658, 731, 131, 833, 575, 818, 503, 677, 58, 131, 931, 833, 775]
        }, {
            name: '时间序列分析',
            data: [677, 558, 621, 231, 733, 433, 720, 522, 596, 50, 128, 896, 758, 765]
        }, {
            name: '灰度预测',
            data: [717, 758, 688, 81, 933, 452, 708, 485, 585, 60, 111, 793, 744, 722]
        }]
    });
</script>
<script type="text/javascript">
    Highcharts.chart('error-rate', {

        title: {
            text: ''
        },
        xAxis: {
            categories: [
                '2017-10-18',
                '2017-10-19',
                '2017-10-20',
                '2017-10-21',
                '2017-10-22',
                '2017-10-23',
                '2017-10-24',
                '2017-10-25',
            ],
            tickmarkPlacement: 'on',
            title: {
                enabled: false
            }
        },
        yAxis: {
            title: {
                text: '错误率 (%)'
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
            name: '灰度预测',
            data: [13.6, 3.95, 13.3, 3.1, 10.2, 15.6, 10.1, 6.8]
        }, {
            name: '时间序列分析',
            data: [12.9, 3.99, 11.2, 13.02, 2.2, 7.4, 9.5, 1.2]
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