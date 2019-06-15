<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>资源规划 - OpenStack Dashboard</title>


    <link rel="stylesheet" href="assets/css/di-route.css" type="text/css" media="screen">
    <link rel="stylesheet" href="assets/css/diy.css" type="text/css">

    <link rel="shortcut icon" href="http://10.128.201.14/static/dashboard/img/favicon.ico">

    <script src="assets/js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="assets/js/highstock.js" type="text/javascript" charset="utf-8"></script>
    <script src="assets/js/highcharts-more.js" type="text/javascript" charset="utf-8"></script>
    <script src="assets/js/d3.js" type="text/javascript"></script>
    <script src="assets/js/liquidFillGauge.js" type="text/javascript"></script>
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
                <a href="loadingForcast.ftl">负载预测</a>
            </li>
            <li>
                <a href="resourceResize.ftl" class="active" tabindex="1">资源规划</a>
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
                <h2>资源规划</h2>
            </div>
        </div>

        <div class="table_wrapper row-fluid">
            <div class="span12">
                <div class="tab-content container" style="border: 0">
                    <div class="sx-10">
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>物理硬件类型</h3>
                            </div>
                            <div style="background: white">
                                <div class="graph-container double-graph-container">
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
                                </div>
                            </div>
                        </div>
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>资源状态分布</h3>
                            </div>
                            <div style="background: white">
                                <div id="node-storage" class="graph-container double-graph-container"></div>
                            </div>
                        </div>
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>资源利用率</h3>
                            </div>
                            <div style="background: white">
                                <div id="system-usage" class="graph-container" style="height: 300px"></div>
                            </div>
                        </div>

                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>系统效能评分</h3>
                            </div>
                            <div style="background: white">
                                <div id="system-rate" class="graph-container" style="height: 300px">
                                    <div style="margin: auto; height: 300px; width: 300px; margin-top: 15px">
                                        <svg id="fillgauge5" width="100%" height="250" onclick="gauge5.update(NewValue());"></svg>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>节点耗能分布</h3>
                            </div>
                            <div style="background: white">
                                <div id="energy-change-pie" style="width: 50%; float: left; height: 340px"></div>
                                <div id="energy-change-column" style="width: 50%; float: left; height: 340px"></div>
                            </div>
                        </div>
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>节点温度变化曲线</h3>
                            </div>
                            <div style="background: white">
                                <div id="temperater-change" class="graph-container" style="height: 320px;"></div>
                            </div>
                        </div>
                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>CPU负载变化曲线</h3>
                            </div>
                            <div style="background: white">
                                <div id="cpu-change" class="graph-container"></div>
                            </div>
                        </div>

                        <div class="graph-border sx-5">
                            <div class="graph-header">
                                <h3>网络负载变化曲线</h3>
                            </div>
                            <div style="background: white">
                                <div id="network-change" class="graph-container"></div>
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
    Highcharts.chart('node-storage', {
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },
        xAxis: {
            categories: [
                '开启',
                '预留',
                '关闭',
                '损坏'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: '服务器数量'
            }
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
            name: '服务器数量',
            data: [10, 2, 5, 1]

        }]
    });
</script>
<script type="text/javascript">
    Highcharts.chart('system-usage', {

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
                name: '利用率',
                data: [87],
                tooltip: {
                    valueSuffix: '%'
                }
            }]

        },
// Add some life
        function (chart) {
            if (!chart.renderer.forExport) {
                setInterval(function () {
                    var point = chart.series[0].points[0],
                        newVal,
                        inc = Math.round((Math.random() - 0.5) * 8);

                    newVal = point.y + inc;
                    if (newVal > 88 || newVal < 80)
                        newVal = 86;
                    point.update(newVal);

                }, 3000);
            }
        });
</script>
<script type="text/javascript">

    var config4 = liquidFillGaugeDefaultSettings();
    config4.circleThickness = 0.15;
    config4.circleColor = "#808015";
    config4.textColor = "#555500";
    config4.waveTextColor = "#FFFFAA";
    config4.waveColor = "#AAAA39";
    config4.textVertPosition = 0.8;
    config4.waveAnimateTime = 1000;
    config4.waveHeight = 0.05;
    config4.waveAnimate = true;
    config4.waveRise = false;
    config4.waveHeightScaling = false;
    config4.waveOffset = 0.25;
    config4.textSize = 0.75;
    config4.waveCount = 3;
    var gauge5 = loadLiquidFillGauge("fillgauge5", 91, config4);

    function NewValue(){
        var value = 0;
        if(Math.random() > .5){
            value = Math.round(Math.random()*100);
        } else {
            value = (Math.random()*100).toFixed(1);
        }
        if (value <88 || value > 95)
            return NewValue();
        else
            return value;
    }
</script>
<script type="text/javascript">
    // Build the chart
    Highcharts.chart('energy-change-pie', {
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
            name: '能耗占比',
            colorByPoint: true,
            data: [{
                name: 'CPU',
                y: 56.33
            }, {
                name: 'Memory',
                y: 14.03,
                sliced: true,
                selected: true
            }, {
                name: 'Network',
                y: 10.38
            }, {
                name: 'Storage',
                y: 4.77
            }, {
                name: 'Cooling',
                y: 10.91
            }, {
                name: 'Other',
                y: 0.2
            }]
        }]
    });
</script>
<script type="text/javascript">
    Highcharts.chart('energy-change-column', {
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },
        xAxis: {
            categories: ['08:00', '09:00', '10:00', '11:00', '12:00']
        },
        yAxis: {
            lineWidth: 1,
            min: 0,
            title: {
                text: '能耗 (KWh)'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                }
            }
        },
        tooltip: {
            headerFormat: '<b>{point.x}</b><br/>',
            pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                }
            }
        },
        series: [{
            name: 'CPU',
            data: [35, 33, 34, 37, 42]
        }, {
            name: 'Memory',
            data: [12, 12, 13, 12, 8]
        }, {
            name: 'Network',
            data: [13, 24, 14, 22, 25]
        }, {
            name: 'Storage',
            data: [3, 4, 4, 2, 5]
        }, {
            name: 'Cooling',
            data: [13, 14, 14, 12, 15]
        }]
    });
</script>
<script type="text/javascript">
    $.getJSON('assets/js/node-temperater.json', function (data) {

        // create the chart
        Highcharts.stockChart('temperater-change', {


            title: {
                text: '集群温度变化'
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
    Highcharts.chart('cpu-change', {
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },
        xAxis: {
            categories: [
                'c16n03',
                'c16n04',
                'c16n05',
                'c16n06',
                'c16n07',
                'c16n08',
                'c16n09',
                'c16n10',
                'c16n11',
                'c16n13',
                'c15n11',
                'c15n12'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: '温度 (℃)'
            }
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
            name: 'CPU',
            data: [49.9, 31.5, 56.4, 29.2, 44.0, 76.0, 35.6, 48.5, 16.4, 54.1, 45.6, 54.4]

        }]
    });
</script>
<script type="text/javascript">
    Highcharts.chart('network-change', {

        title: {
            text: ''
        },
        xAxis: {
            categories: [
                'c16n03',
                'c16n04',
                'c16n05',
                'c16n06',
                'c16n07',
                'c16n08',
                'c16n09',
                'c16n10',
                'c16n11',
                'c16n13',
                'c15n11',
                'c15n12'
            ],
            crosshair: true
        },
        yAxis: {
            title: {
                text: '吞吐量 (Mbps)'
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
            name: '上行',
            data: [856.3, 2503, 7177, 9658, 7031, 9931, 7133, 4175,5671,4329.4,1178,982.9]
        }, {
            name: '下行',
            data: [4916, 4064, 9742, 9851, 2490, 3282, 8121, 4434, 5742, 4851, 1490, 282]
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