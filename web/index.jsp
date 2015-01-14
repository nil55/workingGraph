<%-- 
    Document   : index
    Created on : 2015-jan-12, 00:49:16
    Author     : nils
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/amcharts.js"></script>
        <script type="text/javascript" src="js/serial.js"></script>
        <script type="text/javascript" src="themes/none.js"></script>
        <script type="text/javascript">
            var chartData = generateChartData();
            var chart = AmCharts.makeChart("chartdiv", {
                "type": "serial",
                "theme": "none",
                "pathToImages": "images/",
                "dataProvider": chartData,
                "valueAxes": [{
                        "axisAlpha": 0.2,
                        "dashLength": 1,
                        "position": "left"
                    }],
                "mouseWheelZoomEnabled": true,
                "graphs": [{
                        "id": "g1",
                        "balloonText": "[[category]]<br/><b><span style='font-size:14px;'>value: [[value]]</span></b>",
                        "bullet": "round",
                        "bulletBorderAlpha": 1,
                        "bulletColor": "#FFFFFF",
                        "hideBulletsCount": 50,
                        "title": "red line",
                        "valueField": "visits",
                        "useLineColorForBulletBorder": true
                    }],
                "chartScrollbar": {
                    "autoGridCount": true,
                    "graph": "g1",
                    "scrollbarHeight": 40
                },
                "chartCursor": {
                    "cursorPosition": "mouse"
                },
                "categoryField": "date",
                "categoryAxis": {
                    "parseDates": true,
                    "axisColor": "#DADADA",
                    "dashLength": 1,
                    "minorGridEnabled": true
                },
                "exportConfig": {
                    menuRight: '20px',
                    menuBottom: '30px',
                    menuItems: [{
                            icon: 'images/export.png',
                            format: 'png'
                        }]
                }
            });

            chart.addListener("rendered", zoomChart);
            zoomChart();

// this method is called when chart is first inited as we listen for "dataUpdated" event
            function zoomChart() {
// different zoom methods can be used - zoomToIndexes, zoomToDates, zoomToCategoryValues
                chart.zoomToIndexes(chartData.length - 40, chartData.length - 1);
            }


// generate some random data, quite different range
            function generateChartData() {
                var chartData = [];
                var firstDate = new Date();
                firstDate.setDate(firstDate.getDate() - 5);

                for (var i = 0; i < 1000; i++) {
// we create date objects here. In your data, you can have date strings
// and then set format of your dates using chart.dataDateFormat property,
// however when possible, use date objects, as this will speed up chart rendering.
                    var newDate = new Date(firstDate);
                    newDate.setDate(newDate.getDate() + i);

                    var visits = Math.round(Math.random() * (40 + i / 5)) + 20 + i;

                    chartData.push({
                        date: newDate,
                        visits: visits
                    });
                }
                return chartData;
            }
        </script>
    </head>
    <body>
        <div id="chartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
    </body>
</html>