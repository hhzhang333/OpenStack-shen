<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>镜像副本管理 - OpenStack Dashboard</title>


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
                <a href="singleImage.html">副本管理单镜像</a>
            </li>
            <li>
                <a href="imageRepo.ftl">镜像仓库</a>
            </li>
            <li>
                <a class="active" href="manageTotal">副本管理整体</a>
            </li>
        </ul>
        <h4>虚拟机管理</h4>
        <ul class="main_nav">
            <li>
                <a href="vmMonitorLoading">VM负载监控</a>
            </li>
            <li>
                <a href="netMonitorLoading">网络负载监控</a>
            </li>
            <li>
                <a href="totalMonitorLoading">负载监控整体</a>
            </li>
            <li>
                <a href="resourceAllocator.html">负载分配</a>
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
                <a href="resourceResize"tabindex="1">资源规划</a>
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
                <h2>镜像管理</h2>
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

                            <th class="sortable normal_column header">热度</th>

                            <th class="sortable normal_column header">大小</th>

                            <th class="sortable normal_column header">副本数</th>

                            <th class="sortable normal_column header">传输率</th>

                            <th class="actions_column">动作</th>

                        </tr>


                        </thead>

                        <tbody>

                        <#if imageInfoTable??>
                            <#list imageInfoTable as item>
                            <tr class="ajax-update status_up category-project odd" data-display="spark_langren1992"
                                data-update-interval="2500"
                                data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=c97f5bf0-ffbe-48fc-b816-b602ba898039"
                                id="images__row__c97f5bf0-ffbe-48fc-b816-b602ba898039" style="display: table-row;">
                                <td class="multi_select_column"><input name="object_ids"
                                                                       value="c97f5bf0-ffbe-48fc-b816-b602ba898039"
                                                                       type="checkbox"></td>
                                <td class="sortable anchor normal_column"><a
                                        href="/horizon/project/images_and_snapshots/c97f5bf0-ffbe-48fc-b816-b602ba898039/"
                                        class="">${item.name}</a></td>
                                <td class="sortable normal_column">${item.hotDegree}</td>
                                <td class="status_up sortable normal_column">${item.size}</td>
                                <td class="sortable normal_column">${item.replicaNumNow}</td>
                                <td class="sortable normal_column">${item.transRateNow}</td>
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
                            </#list>
                        </#if>

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
                                <h3>副本因子</h3>
                            </div>
                            <div style="background: white">
                                <div id="average-dup" class="graph-container double-graph-container"></div>
                            </div>
                        </div>
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>传输速率（小时）</h3>
                            </div>
                            <div style="background: white">
                                <div id="average-rate" class="graph-container double-graph-container"></div>
                            </div>
                        </div>
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>热门镜像副本数</h3>
                            </div>
                            <div style="background: white">
                                <div id="hot-image-count" class="graph-container double-graph-container"></div>
                            </div>
                        </div>

                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>热门镜像传输速率</h3>
                            </div>
                            <div style="background: white">
                                <div id="image-tx-rate" class="graph-container double-graph-container"></div>
                            </div>
                        </div>
                        <div class="graph-border sx-10" style="width: 98%">
                            <div class="graph-header">
                                <h3>存储空间用量</h3>
                            </div>
                            <div style="background: white">
                                <div class="graph-container graph-text" style="margin-top: 2%">
                                    <table class="table table-bordered" style="border: 1px solid #dddddd;">
                                        <tr>
                                            <th>10.128.201.1</th>
                                            <th>Type</th>
                                            <th>IBM HS22 BOLDE Server</th>
                                        </tr>
                                        <tr>
                                            <td rowspan="3"><img src="assets/img/timg.jpg" style="width: 88px; padding-left: 65px"/> </td>
                                            <td>CPU</td>
                                            <td>HS22 2.66GHz x5650 Six-Core 2C</td>
                                        </tr>
                                        <tr>
                                            <td>Memory</td>
                                            <td>6*4GB VLP DDR3</td>
                                        </tr>
                                        <tr>
                                            <td>Storage Device</td>
                                            <td>1*146GB 6Gbps SAS</td>
                                        </tr>
                                        <tr>
                                            <td>Running</td>
                                            <td>Tier</td>
                                            <td>0</td>
                                        </tr>
                                    </table>
                                    <!--<span class="sx-10">镜像总数： 135</span>-->
                                    <!--<span class="sx-10">总大小： 768.95 GB</span>-->
                                    <!--<span class="sx-10">副本总数：565</span>-->
                                    <!--<span class="sx-10">副本大小：2.76 TB</span>-->
                                </div>
                                <div style="background: white; height: 300px;">
                                    <div id="image-usage" class="graph-container sx-4" style="height: 300px; padding: 0"></div>
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
    Highcharts.chart('average-dup', {
        chart: {
            zoomType: 'xy'
        },
        title: {
            text: ''
        },
        xAxis: [{
            categories: ${replicaFactor.category},
            crosshair: true
        }],
        yAxis: [{ // Primary yAxis
            lineWidth: 1,
            labels: {
                format: '{value}',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            },
            title: {
                text: '副本因子',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            }
        }, { // Secondary yAxis
            title: {
                text: '',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            labels: {
                format: '{value} ',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            opposite: true
        }],legend: {
            align: 'right',
            x: -30,
            verticalAlign: 'top',
            y: 5,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        }, tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        series: [{
            name: '最大值',
            type: 'column',
            yAxis: 1,
            data: ${replicaFactor.data1},
            tooltip: {
                valueSuffix: ''
            }

        }, {
            name: '平均值',
            type: 'spline',
            data: ${replicaFactor.data2},
            tooltip: {
                valueSuffix: ''
            }
        }]
    });
</script>
<script type="text/javascript">
    Highcharts.chart('average-rate', {
        chart: {
            type: 'line'
        },
        title: {
            text: ''
        },
        xAxis: {
            categories: ${imageRate.category},
            crosshair: true,
            labels: {
                style: {
                    fontSize: '8px'
                }
            }
        },
        yAxis: {
            lineWidth: 1,
            title: {
                text: '传输速率 (MB/s)'
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
        }, tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} Mbps</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            series: {
                label: {
                    connectorAllowed: false
                }

            }
        },
        series: [{
            name: '热门镜像',
            data: ${imageRate.data1}
        }, {
            name: '普通镜像',
            data: ${imageRate.data2}
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
    Highcharts.chart('hot-image-count', {
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },
        xAxis: {
            categories: ${replicaNum.category},
            crosshair: true
        },
        yAxis: {
            lineWidth: 1,
            min: 0,
            title: {
                text: '副本数'
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
            '<td style="padding:0"><b>{point.y:.1f} 个</b></td></tr>',
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
            name: '上一阶段',
            data: ${replicaNum.data1}

        }, {
            name: '当前',
            data: ${replicaNum.data2}

        }]
    });
</script>
<script type="text/javascript">
    Highcharts.chart('image-tx-rate', {
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },
        xAxis: {
            categories: ${imageTrans.category},
            crosshair: true
        },
        yAxis: {
            min: 0,
            lineWidth: 1,
            title: {
                text: '传输速度 (MB/s)'
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
            '<td style="padding:0"><b>{point.y:.1f} Mbps</b></td></tr>',
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
            name: '上一阶段',
            data: ${imageTrans.data1}

        }, {
            name: '当前',
            data: ${imageTrans.data2}

        }]
    });
</script>
<script type="text/javascript">
    Highcharts.chart('image-usage', {

                chart: {
                    type: 'gauge',
                    plotBackgroundColor: null,
                    plotBackgroundImage: null,
                    plotBorderWidth: 0,
                    plotShadow: false
                },

                title: {
                    text: ''
                },

                pane: {
                    startAngle: -150,
                    endAngle: 150,
                    background: [{
                        backgroundColor: {
                            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                            stops: [
                                [0, '#FFF'],
                                [1, '#333']
                            ]
                        },
                        borderWidth: 0,
                        outerRadius: '109%'
                    }, {
                        backgroundColor: {
                            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                            stops: [
                                [0, '#333'],
                                [1, '#FFF']
                            ]
                        },
                        borderWidth: 1,
                        outerRadius: '107%'
                    }, {
                        // default background
                    }, {
                        backgroundColor: '#DDD',
                        borderWidth: 0,
                        outerRadius: '105%',
                        innerRadius: '103%'
                    }]
                },

                // the value axis
                yAxis: {
                    min: 0,
                    max: 100,

                    minorTickInterval: 'auto',
                    minorTickWidth: 1,
                    minorTickLength: 10,
                    minorTickPosition: 'inside',
                    minorTickColor: '#666',

                    tickPixelInterval: 30,
                    tickWidth: 2,
                    tickPosition: 'inside',
                    tickLength: 10,
                    tickColor: '#666',
                    labels: {
                        step: 2,
                        rotation: 'auto'
                    },
                    title: {
                        text: '利用率'
                    },
                    plotBands: [{
                        from: 0,
                        to: 60,
                        color: '#55BF3B' // green
                    }, {
                        from: 60,
                        to: 80,
                        color: '#DDDF0D' // yellow
                    }, {
                        from: 80,
                        to: 100,
                        color: '#DF5353' // red
                    }]
                },

                series: [{
                    name: 'Speed',
                    data: [${storageUti.data1}],
                    tooltip: {
                        valueSuffix: '利用率'
                    }
                }]

            });
</script>
</html>