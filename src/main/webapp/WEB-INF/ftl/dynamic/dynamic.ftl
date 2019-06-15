<script type="text/javascript">
    Highcharts.chart('${title}-usage', {

        chart: {
            type: 'area'
        },

        title: {
            text: ''
        },
        xAxis: {
            categories: ${data.category},
            crosshair: true,
            labels: {
                format: '{value}'
            },
            minRange: 5
        },

        yAxis: {
            lineWidth: 1,
            min: 0,
            max: 100,
            startOnTick: true,
            endOnTick: false,
            maxPadding: 0.35,
            title: {
                text: null
            },
            labels: {
                format: '{value} %'
            }
        },

        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{black};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} %</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
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

        series: [{
            data: ${data.data1},
            lineColor: Highcharts.getOptions().colors[0],
            color: Highcharts.getOptions().colors[3],
            fillOpacity: 0.5,
            name: '内存利用率',
            marker: {
                enabled: false
            },
            threshold: null
        }]

    });
</script>