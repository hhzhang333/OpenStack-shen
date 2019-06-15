<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>负载监控整体 - OpenStack Dashboard</title>


    <link rel="stylesheet" href="assets/css/di-route.css" type="text/css" media="screen">
    <link rel="stylesheet" href="assets/css/diy.css" type="text/css">

    <link rel="shortcut icon" href="http://10.128.201.14/static/dashboard/img/favicon.ico">

    <script src="assets/js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <script src="assets/js/highstock.js" type="text/javascript" charset="utf-8"></script>
    <script src="assets/js/highcharts-more.js" type="text/javascript" charset="utf-8"></script>
    <script src="assets/js/highcharts-3d.js" type="text/javascript" charset="utf-8"></script>
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
                <a href="netMonitorLoading">网络负载监控</a>
            </li>
            <li>
                <a class="active"  href="totalMonitorLoading">负载监控整体</a>
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
                <h2>路由</h2>
            </div>
        </div>
        <div class="table_wrapper row-fluid">
            <div class="span12">
                <div class="tab-content container" style="border: 0">
                    <div class="sx-10">
                        <div class="graph-border sx-10" style="width: 98%">
                            <div class="graph-header">
                                <h3>总体资源使用</h3>
                            </div>
                            <div style="background: white">
                                <div id="network-total" class="graph-container" style="height: 450px">

                                    <script type="text/javascript">

                                        $(function () {

                                            // Give the points a 3D feel by adding a radial gradient
                                            Highcharts.getOptions().colors = $.map(Highcharts.getOptions().colors, function (color) {
                                                return {
                                                    radialGradient: {
                                                        cx: 0.4,
                                                        cy: 0.3,
                                                        r: 0.5
                                                    },
                                                    stops: [
                                                        [0, color],
                                                        [1, Highcharts.Color(color).brighten(-0.2).get('rgb')]
                                                    ]
                                                };
                                            });

                                            // Set up the chart
                                            var chart = new Highcharts.Chart({
                                                chart: {
                                                    renderTo: 'network-total',
                                                    margin: 100,
                                                    type: 'scatter',
                                                    options3d: {
                                                        enabled: true,
                                                        alpha: 10,
                                                        beta: 30,
                                                        depth: 250,
                                                        viewDistance: 5,

                                                        frame: {
                                                            bottom: { size: 1, color: 'rgba(0,0,0,0.02)' },
                                                            back: { size: 1, color: 'rgba(0,0,0,0.04)' },
                                                            side: { size: 1, color: 'rgba(0,0,0,0.06)' }
                                                        }
                                                    }
                                                },
                                                title: {
                                                    text: 'Overall Virtual Machine Resource Statistics in SEU Cloud'
                                                },
                                                subtitle: {
                                                    text: 'Easy to classify all VMs'
                                                },
                                                plotOptions: {
                                                    scatter: {
                                                        width: 10,
                                                        height: 10,
                                                        depth: 10
                                                    }
                                                },
                                                yAxis: {
                                                    min: 0,
                                                    max: 100,
                                                    title:{text:"CPU"}
                                                },
                                                xAxis: {
                                                    min: 0,
                                                    max: 100,
                                                    gridLineWidth: 1,
                                                    title:{text: "Network"}
                                                },
                                                zAxis: {
                                                    min: 0,
                                                    max: 100,
                                                    title:{text:"Memory"}
                                                },
                                                tooltip: {
                                                    formatter: function() {
                                                        return '<b>'+ this.series.name +'</b><br/>'+
                                                                "Network:"+this.x +'<br/>'+
                                                                "CPU:"+this.y+'<br/>'+
                                                                "Memory:"+this.point.z+'<br/>'
                                                    }
                                                },
                                                legend: {
                                                    enabled: false
                                                },
                                                series: [{
                                                    name: 'Resource Usage',
                                                    colorByPoint: true,
                                                    data: ${vm3dresource.data1}
                                                }]
                                            });


                                            // Add mouse events for rotation
                                            $("#network-total").bind('mousedown.hc touchstart.hc', function (e) {
                                                e = chart.pointer.normalize(e);

                                                var posX = e.pageX,
                                                        posY = e.pageY,
                                                        alpha = chart.options.chart.options3d.alpha,
                                                        beta = chart.options.chart.options3d.beta,
                                                        newAlpha,
                                                        newBeta,
                                                        sensitivity = 5; // lower is more sensitive

                                                $(document).bind({
                                                    'mousemove.hc touchdrag.hc': function (e) {
                                                        // Run beta
                                                        newBeta = beta + (posX - e.pageX) / sensitivity;
                                                        newBeta = Math.min(100, Math.max(-100, newBeta));
                                                        chart.options.chart.options3d.beta = newBeta;

                                                        // Run alpha
                                                        newAlpha = alpha + (e.pageY - posY) / sensitivity;
                                                        newAlpha = Math.min(100, Math.max(-100, newAlpha));
                                                        chart.options.chart.options3d.alpha = newAlpha;

                                                        chart.redraw(false);
                                                    },
                                                    'mouseup touchend': function () {
                                                        $(document).unbind('.hc');
                                                    }
                                                });
                                            });

                                        });
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <div class="images" style="margin-top: -85px;">

                <div class="table_wrapper">
                    <form action="/horizon/project/images_and_snapshots/" method="POST"><input name="csrfmiddlewaretoken"
                                                                                               value="x7d15ynYSwfEtR6aK5hhVtqVViuA8G7l"
                                                                                               type="hidden">

                        <table id="images" class="table table-bordered table-striped datatable">
                            <thead>

                            <tr class="table_caption">
                                <th class="table_header" colspan="8">
                                    <h3 class="table_title">虚拟机资源</h3>
                                </th>
                            </tr>


                            <tr>
                                <th class="sortable normal_column header">虚拟机名</th>

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
                            <#if vminfos??>
                                <#list vminfos as item>
                                <tr class="ajax-update status_up category-project odd" data-display="spark_langren1992"
                                    data-update-interval="2500"
                                    data-update-url="/horizon/project/images_and_snapshots/?action=row_update&amp;table=images&amp;obj_id=c97f5bf0-ffbe-48fc-b816-b602ba898039"
                                    id="images__row__c97f5bf0-ffbe-48fc-b816-b602ba898039" style="display: table-row;">
                                    <td class="sortable normal_column"><a
                                            href="/horizon/project/images_and_snapshots/c97f5bf0-ffbe-48fc-b816-b602ba898039/"
                                            class="">${item.name}</a></td>
                                    <td class="status_up sortable normal_column">${item.cpuUtilization}</td>
                                    <td class="sortable normal_column">${item.memUtilization}</td>
                                    <td class="sortable normal_column">${item.bandwidthUplink}</td>
                                    <td class="sortable normal_column">${item.bandwidthDownlink}</td>
                                    <td class="status_up sortable normal_column">${item.avgCpuUtilization}</td>
                                    <td class="sortable normal_column">${item.avgMemUtilization}</td>
                                    <td class="sortable normal_column">${item.avgBandwidthuplink}</td>
                                    <td class="sortable normal_column">${item.avgBandwidthDownlink}</td>
                                </tr>

                                </#list>
                            </#if>


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
        </div>


    </div>


    <div id="footer">

    </div>


</div>
</body>



<!--<script type="text/javascript">-->
    <!--Highcharts.chart('network-total', {-->

        <!--chart: {-->
            <!--type: 'bubble',-->
            <!--plotBorderWidth: 1,-->
            <!--zoomType: 'xy'-->
        <!--},-->

        <!--title: {-->
            <!--text: ''-->
        <!--},-->

        <!--xAxis: {-->
            <!--gridLineWidth: 1-->
        <!--},-->

        <!--yAxis: {-->
            <!--startOnTick: false,-->
            <!--endOnTick: false-->
        <!--},-->

        <!--series: [{-->
            <!--data: [-->
                <!--[9, 81, 63],-->
                <!--[98, 5, 89],-->
                <!--[51, 50, 73],-->
                <!--[41, 22, 14],-->
                <!--[58, 24, 20],-->
                <!--[78, 37, 34],-->
                <!--[55, 56, 53],-->
                <!--[18, 45, 70],-->
                <!--[42, 44, 28],-->
                <!--[3, 52, 59],-->
                <!--[31, 18, 97],-->
                <!--[79, 91, 63],-->
                <!--[93, 23, 23],-->
                <!--[44, 83, 22]-->
            <!--],-->
            <!--marker: {-->
                <!--fillColor: {-->
                    <!--radialGradient: { cx: 0.4, cy: 0.3, r: 0.7 },-->
                    <!--stops: [-->
                        <!--[0, 'rgba(255,255,255,0.5)'],-->
                        <!--[1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0.5).get('rgba')]-->
                    <!--]-->
                <!--}-->
            <!--},-->
            <!--tooltip: {-->
                <!--headerFormat: '<b>{series.name}</b><br>',-->
                <!--pointFormat: 'Network: {point.x}, <br> CPU: {point.y}<br>Memory: {point.z}'-->
            <!--}-->
        <!--}, {-->
            <!--data: [-->
                <!--[42, 38, 20],-->
                <!--[6, 18, 1],-->
                <!--[1, 93, 55],-->
                <!--[57, 2, 90],-->
                <!--[80, 76, 22],-->
                <!--[11, 74, 96],-->
                <!--[88, 56, 10],-->
                <!--[30, 47, 49],-->
                <!--[57, 62, 98],-->
                <!--[4, 16, 16],-->
                <!--[46, 10, 11],-->
                <!--[22, 87, 89],-->
                <!--[57, 91, 82],-->
                <!--[45, 15, 98]-->
            <!--],-->
            <!--marker: {-->
                <!--fillColor: {-->
                    <!--radialGradient: { cx: 0.4, cy: 0.3, r: 0.7 },-->
                    <!--stops: [-->
                        <!--[0, 'rgba(255,255,255,0.5)'],-->
                        <!--[1, Highcharts.Color(Highcharts.getOptions().colors[1]).setOpacity(0.5).get('rgba')]-->
                    <!--]-->
                <!--}-->
            <!--},-->
            <!--tooltip: {-->
                <!--headerFormat: '<b>{series.name}</b><br>',-->
                <!--pointFormat: 'Network: {point.x}, <br> CPU: {point.y}<br>Memory: {point.z}'-->
            <!--}-->
        <!--}]-->

    <!--});-->
<!--</script>-->
</html>