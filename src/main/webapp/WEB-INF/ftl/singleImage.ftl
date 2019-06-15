<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>副本管理单镜像 - OpenStack Dashboard</title>


    <link rel="stylesheet" href="assets/css/di-route.css" type="text/css" media="screen">
    <link rel="stylesheet" href="assets/css/diy.css" type="text/css">

    <link rel="shortcut icon" href="http://10.128.201.14/static/dashboard/img/favicon.ico">

    <script src="assets/js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="assets/js/highstock.js" type="text/javascript" charset="utf-8"></script>
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
                <a href="singleImage.ftl" class="active" tabindex="1">副本管理单镜像</a>
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
                <h2>副本管理单镜像</h2>
            </div>


        </div>

        <div class="table_wrapper row-fluid">
            <div class="span12">
                <ul id="instance_details" class="nav nav-tabs ajax-tabs" data-sticky-tabs="sticky">

                    <li class="active">
                        <a href="">概况</a>
                    </li>

                </ul>


                <div class="tab-content container">
                    <div class="sx-2">
                        <div>


                            <div id="instance_details__overview" class="tab-pane active ">


                                <h3>云主机概况</h3>

                                <div class="status row-fluid detail">
                                    <h4>信息</h4>
                                    <hr class="header_rule">
                                    <dl>
                                        <dt>名称</dt>
                                        <dd>dingwenjiang-2</dd>
                                        <dt>ID</dt>
                                        <dd>a7d51469-04e0-4ede-9b19-d64235ec6c9a</dd>
                                        <dt>状态</dt>
                                        <dd>Active</dd>
                                        <dt>已创建</dt>
                                        <dd>十月 9, 2017, 7:04 a.m.</dd>
                                        <dt>正常运行时间</dt>
                                        <dd>4 天, 3 小时</dd>
                                    </dl>
                                </div>

                                <div class="specs row-fluid detail">
                                    <h4>规格</h4>
                                    <hr class="header_rule">
                                    <dl>
                                        <dt>云主机类型</dt>
                                        <dd>m1.fit</dd>
                                        <dt>内存</dt>
                                        <dd>2GB</dd>
                                        <dt>虚拟内核</dt>
                                        <dd>1 虚拟内核</dd>
                                        <dt>磁盘</dt>
                                        <dd>20GB</dd>

                                    </dl>
                                </div>

                                <div class="addresses row-fluid detail">
                                    <h4>IP地址</h4>
                                    <hr class="header_rule">
                                    <dl>

                                        <dt>337_172</dt>
                                        <dd>

                                            172.16.71.105,&nbsp;

                                            10.128.201.78

                                        </dd>

                                    </dl>
                                </div>

                                <div class="security_groups row-fluid detail">
                                    <h4>安全组</h4>
                                    <hr class="header_rule">
                                    <dl>

                                        <dt>default</dt>
                                        <dd>
                                            <ul>

                                                <li>允许 IPv6 from default</li>

                                                <li>允许 IPv6 to ::/0</li>

                                                <li>允许 IPv4 from default</li>

                                                <li>允许 IPv4 to 0.0.0.0/0</li>

                                            </ul>
                                        </dd>

                                    </dl>
                                </div>

                                <div class="meta row-fluid detail">
                                    <h4>元数据</h4>
                                    <hr class="header_rule">
                                    <dl>
                                        <dt>键名称</dt>

                                        <dd>dingwenjiang</dd>


                                        <dt>镜像名称</dt>
                                        <dd>
                                            <a href="/horizon/project/images_and_snapshots/59e7ac2d-8a1b-446b-868d-07d6b951be6b/">Ubuntu
                                                Cloud</a></dd>


                                    </dl>
                                </div>

                                <div class="volumes row-fluid detail">
                                    <h4>云硬盘已连接</h4>
                                    <hr class="header_rule">
                                    <dl>

                                        <dt>云硬盘</dt>
                                        <dd><em>未连接云硬盘</em></dd>

                                    </dl>
                                </div>

                            </div>

                            <div id="instance_details__log" class="tab-pane">

                            </div>

                            <div id="instance_details__console" class="tab-pane">

                            </div>
                        </div>
                    </div>
                    <div class="sx-8">
                        <div class="graph-border">
                            <div class="graph-header">
                                <h3>历史负载</h3>
                            </div>
                            <div style="background: white">
                                <div id="history-load" class="graph-container"></div>
                            </div>
                        </div>
                        <div class="graph-border">
                            <div class="graph-header">
                                <h3>历史副本数</h3>
                            </div>
                            <div style="background: white">
                                <div id="history-duplicate" class="graph-container"></div>
                            </div>
                        </div>
                        <div class="graph-border">
                            <div class="graph-header">
                                <h3>历史传输速率</h3>
                            </div>
                            <div style="background: white">
                                <div id="history-rx-rate" class="graph-container" style="height: 200px; min-width: 310px"></div>
                            </div>
                        </div>

                        <div class="graph-border">
                            <div class="graph-header">
                                <h3>历史启动延迟</h3>
                            </div>
                            <div style="background: white">
                                <div id="history-start-lantency" class="graph-container" style="height: 200px; min-width: 310px"></div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <!--<div class="graph-border">-->
    <!--<div class="graph-header">-->
    <!--<h3>历史传输速率</h3>-->
    <!--</div>-->
    <!--<div style="">-->
    <!--<div id="test" style="height: 400px; min-width: 310px"></div>-->
    <!--</div>-->
    <!--</div>-->

    <div id="footer">

    </div>


    <div id="modal_wrapper">


    </div>



</div>
</body>
<script type="text/javascript">
    Highcharts.setOptions({
        global: {
            useUTC: false
        }
    });
    function activeLastPointToolip(chart) {
        var points = chart.series[0].points;
        chart.tooltip.refresh(points[points.length -1]);
    }
    $('#history-load').highcharts({
        chart: {
            type: 'spline',
            animation: Highcharts.svg, // don't animate in old IE
            marginRight: 10,
            events: {
                load: function () {
                    // set up the updating of the chart each second
                    var series = this.series[0],
                        chart = this;
                    setInterval(function () {
                        var x = (new Date()).getTime(), // current time
                            y = Math.random();
                        series.addPoint([x, y], true, true);
                        activeLastPointToolip(chart)
                    }, 1000);
                }
            }
        },
        title: {
            text: ''
        },
        xAxis: {
            type: 'datetime',
            tickPixelInterval: 150
        },
        yAxis: {
            title: {
                text: '值'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                    Highcharts.numberFormat(this.y, 2);
            }
        },
        legend: {
            enabled: false
        },
        exporting: {
            enabled: false
        },
        series: [{
            name: '随机数据',
            data: (function () {
                // generate an array of random data
                var data = [],
                    time = (new Date()).getTime(),
                    i;
                for (i = -19; i <= 0; i += 1) {
                    data.push({
                        x: time + i * 1000,
                        y: Math.random()
                    });
                }
                return data;
            }())
        }]
    }, function(c) {
        activeLastPointToolip(c)
    });


</script>
<script type="text/javascript">
    $(function () {
        $('#history-duplicate').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: ''
            },
            xAxis: {
                categories: [
                    '一月',
                    '二月',
                    '三月',
                    '四月',
                    '五月',
                    '六月',
                    '七月',
                    '八月',
                    '九月',
                    '十月',
                    '十一月',
                    '十二月'
                ]
            },
            yAxis: {
                min: 0,
                title: {
                    text: '降雨量 (mm)'
                },
                plotLines: [{
                    value: 150,
                    width: 1,
                    color: '#808080'
                },{
                    value: 100,
                    width: 1,
                    color: 'red'
                }]
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
                name: '东京',
                data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
            }]
        });
    });
</script>
<script type="text/javascript">
    $.getJSON('assets/js/node-temperater.json', function (data) {

        // create the chart
        Highcharts.stockChart('history-rx-rate', {


            title: {
                text: ''
            },

            rangeSelector: {
                buttons: [{
                    type: 'hour',
                    count: 1,
                    text: '1h'
                }, {
                    type: 'day',
                    count: 1,
                    text: '1D'
                }, {
                    type: 'all',
                    count: 1,
                    text: 'All'
                }],
                selected: 1,
                inputEnabled: false
            },

            series: [{
                name: 'AAPL',
                type: 'candlestick',
                data: data,
                tooltip: {
                    valueDecimals: 2
                }
            }]
        });
    });

</script>
<script type="text/javascript">
    $.getJSON('assets/js/node-temperater.json', function (data) {

        // create the chart
        Highcharts.stockChart('history-start-lantency', {


            title: {
                text: ''
            },

            rangeSelector: {
                buttons: [{
                    type: 'hour',
                    count: 1,
                    text: '1h'
                }, {
                    type: 'day',
                    count: 1,
                    text: '1D'
                }, {
                    type: 'all',
                    count: 1,
                    text: 'All'
                }],
                selected: 1,
                inputEnabled: false
            },
            navigator: {
                enabled: false
            },
            scrollbar: {
                enabled: false
            },
            series: [{
                name: 'AAPL',
                type: 'candlestick',
                data: data,
                tooltip: {
                    valueDecimals: 2
                }
            }]
        });
    });

</script>
</html>