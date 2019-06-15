<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>网络负载监控 - OpenStack Dashboard</title>


    <link rel="stylesheet" href="assets/css/di-route.css" type="text/css" media="screen">
    <link rel="stylesheet" href="assets/css/diy.css" type="text/css">

    <link rel="shortcut icon" href="http://10.128.201.14/static/dashboard/img/favicon.ico">

    <script src="assets/js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="assets/js/highstock.js" type="text/javascript" charset="utf-8"></script>
    <script src="assets/js/highcharts-more.js" type="text/javascript" charset="utf-8"></script>
    <script src="assets/js/d3.js" type="text/javascript"></script>
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
                <a href="manageTotal">副本管理整体</a>
            </li>
        </ul>
        <h4>虚拟机管理</h4>
        <ul class="main_nav">
            <li>
                <a href="vmMonitorLoading">VM负载监控</a>
            </li>
            <li>
                <a class="active" href="netMonitorLoading">网络负载监控</a>
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
                <a href="resourceResize.ftl" tabindex="1">资源规划</a>
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
                <h2>网络负载监控</h2>
            </div>
        </div>

        <div class="table_wrapper row-fluid">
            <div class="span12">
                <div class="tab-content container" style="border: 0">
                    <div class="sx-10">
                        <div class="graph-border sx-6">
                            <div class="graph-header">
                                <h3>虚拟实时通信</h3>
                            </div>
                            <div style="background: white">
                                <div id="vm-communication" class="graph-table"></div>
                            </div>
                        </div>
                        <div class="graph-border sx-4">
                            <div class="graph-header">
                                <h3>虚拟机列表</h3>
                            </div>
                            <div style="background: white">
                                <div id="popular-image-list" class="graph-table">
                                    <table class="table table-bordered table-striped datatable">
                                        <thead>

                                        <tr>

                                            <th class="multi_select_column"><input type="checkbox"></th>
                                            <th class="sortable anchor normal_column header">虚拟机名称</th>
                                            <th class="sortable normal_column header">虚拟机IP</th>
                                            <th class="sortable normal_column header">上行带宽</th>
                                            <th class="sortable normal_column header">下行带宽</th>
                                        </tr>


                                        </thead>

                                        <tbody>
                                        <#if vminfoTable??>
                                            <#list vminfoTable as item>
                                            <tr class="ajax-update status_up category-project odd" data-display="spark_langren1992"
                                                data-update-interval="2500"
                                                data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=c97f5bf0-ffbe-48fc-b816-b602ba898039"
                                                style="display: table-row;">
                                                <td class="multi_select_column"><input name="object_ids"
                                                                                       value="c97f5bf0-ffbe-48fc-b816-b602ba898039"
                                                                                       type="checkbox"></td>
                                                <td class="sortable anchor normal_column"><a
                                                        href="/horizon/project/images_and_snapshots/c97f5bf0-ffbe-48fc-b816-b602ba898039/"
                                                        class="">${item.name}</a></td>
                                                <td class="sortable normal_column">${item.ipAddr}</td>
                                                <td class="sortable normal_column">${item.bandwidthUplink}</td>
                                                <td class="status_up sortable normal_column">${item.bandwidthDownlink}</td>
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
                                </div>
                            </div>
                        </div>
                        <div class="graph-border sx-4" >
                            <div class="graph-header">
                                <h3>网络使用情况</h3>
                            </div>
                            <div style="background: white">
                                <div id="storage-usage" class="graph-container" style="height: 270px;"></div>
                            </div>
                        </div>
                        <div class="graph-border sx-10" style="width: 98%">
                            <div class="graph-header">
                                <h3>网络负载</h3>
                            </div>
                            <div style="background: white">
                                <div id="network-load" class="graph-container" style="height: 250px"></div>
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
<script type="text/javascript" charset="utf-8">
    var w = 900, h = 900;

    var sign = 1;

    var labelDistance = 0;

    var vis = d3.select("#vm-communication").append("svg:svg").attr("width", w).attr("height", h);

    var nodes = ${d3graph.category};
    var labelAnchors = [];
    var labelAnchorLinks = [];
    var links = ${d3graph.data1};

    for(var i = 0; i < nodes.length; i++) {
        labelAnchors.push({
            node : nodes[i]
        });
        labelAnchors.push({
            node : nodes[i]
        });
    }
    for(var i = 0; i < nodes.length; i++) {
        labelAnchorLinks.push({
            source : i * 2,
            target : i * 2 + 1,
            weight : 1
        });
    }

    var force = d3.layout.force().size([w, h]).nodes(nodes).links(links).gravity(0.6).linkDistance(150).charge(-3000).linkStrength(function(x) {
        return x.weight * 10
    });


    force.start();

    var force2 = d3.layout.force().nodes(labelAnchors).links(labelAnchorLinks).gravity(0).linkDistance(10).linkStrength(2).charge(-100).size([w, h]);
    force2.start();

    var link = vis.selectAll("line.link").data(links).enter().append("svg:line").attr("class", "link").style("stroke", "#9DC7F1");

    var node = vis.selectAll("g.node").data(force.nodes()).enter().append("svg:g").attr("class", "node");
    node.append("svg:circle").attr("r", 8).style("fill", "white").style("stroke", "#9DC7F1").style("stroke-width", 4).attr("id", function (d, i) {
        return i
    }).attr("class", "round");
    node.call(force.drag);


    var anchorLink = vis.selectAll("line.anchorLink").data(labelAnchorLinks)//.enter().append("svg:line").attr("class", "anchorLink").style("stroke", "#999");

    var anchorNode = vis.selectAll("g.anchorNode").data(force2.nodes()).enter().append("svg:g").attr("class", "anchorNode");
    anchorNode.append("svg:circle").attr("r", 0).style("fill", "#FFF");
    anchorNode.append("svg:text").text(function(d, i) {
        return i % 2 == 0 ? "" : d.node.label
    }).style("fill", "#555").style("font-family", "Arial").style("font-size", "16px");

    var updateLink = function() {
        this.attr("x1", function(d) {
            return d.source.x;
        }).attr("y1", function(d) {
            return d.source.y;
        }).attr("x2", function(d) {
            return d.target.x;
        }).attr("y2", function(d) {
            return d.target.y;
        });

    };

    var updateNode = function() {
        this.attr("transform", function(d) {
            return "translate(" + d.x + "," + d.y + ")";
        });

    };


    force.on("tick", function() {

        force2.start();

        node.call(updateNode);

        anchorNode.each(function(d, i) {
            if(i % 2 == 0) {
                d.x = d.node.x;
                d.y = d.node.y;
            } else {
                var b = this.childNodes[1].getBBox();

                var diffX = d.x - d.node.x;
                var diffY = d.y - d.node.y;

                var dist = Math.sqrt(diffX * diffX + diffY * diffY);

                var shiftX = b.width * (diffX - dist) / (dist * 2);
                shiftX = Math.max(-b.width, Math.min(0, shiftX));
                var shiftY = 5;
                this.childNodes[1].setAttribute("transform", "translate(" + shiftX + "," + shiftY + ")");
            }
        });


        anchorNode.call(updateNode);

        link.call(updateLink);
        anchorLink.call(updateLink);

    });

</script>

<script type="text/javascript">
    Highcharts.chart('storage-usage', {

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
                    data: [${networkUtilization.data1}],
                    tooltip: {
                        valueSuffix: '利用率'
                    }
                }]

            });
</script>

<script type="text/javascript">
    Highcharts.chart('network-load', {
        chart: {
            type: 'area'
        },
        title: {
            text: ''
        },
        xAxis: {
            categories: ${networkLoad.category},
            tickmarkPlacement: 'on',
            title: {
                enabled: false
            }
        },
        yAxis: {
            lineWidth: 1,
            title: {
                text: 'Billions'
            },
            labels: {
                formatter: function () {
                    return this.value / 1000;
                }
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} Mbps</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        legend: {
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
            name: '上行带宽',
            data: ${networkLoad.data1}
        }, {
            name: '下行带宽',
            data: ${networkLoad.data2}
        }]
    });
</script>

<script type="application/javascript">
//    $(".round").click(function() {
//        //alert(this.__data__.label);
//        if (navigator.userAgent.indexOf("Firefox") < 0) {
//            this.attributes[1].nodeValue = "fill: blue";
//        }
//        if (navigator.userAgent.indexOf("Chrome") < 0){
//            this.attributes[3].nodeValue = "fill: blue";
//        }
//        if (navigator.userAgent.indexOf("MSIE") < 0){
//            this.attributes[2].nodeValue = "fill: blue";
//        }
//    });

    $(".link").each(function () {
        if (this.__data__.flow>900) {
            this.attributes[1].nodeValue = "stroke: red";
        }
    })
</script>
</html>