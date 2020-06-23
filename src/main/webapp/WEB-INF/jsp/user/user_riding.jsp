<%--
  Created by IntelliJ IDEA.
  User: 小米饭
  Date: 2020/6/23
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <style>
        html,
        body,
        #container {
            width: 100%;
            height: 100%;
        }
    </style>
    <title>Mtla骑行导航</title>
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
    <script src="https://webapi.amap.com/maps?v=1.4.15&key=a5e29f343721cf6a5c29a9ea1ceaf709&plugin=AMap.Riding"></script>
    <script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
</head>
<body>
<div id="container"></div>
<div id="panel"></div>
<script type="text/javascript">
    // var dingWeilng=sessionStorage.getItem(" dingWei-lng");
    // var dingWeilat=sessionStorage.getItem(" dingWei-lat");

    var map = new AMap.Map("container", {
        center: [113.825905,34.023027],
        zoom: 18
    });

    var ridingOption = {
        map: map,
        panel: "panel",
        policy: 1,
        hideMarkers: false,
        isOutline: true,
        outlineColor: '#ffeeee',
        autoFitView: true
    }

    var riding = new AMap.Riding(ridingOption)
    var currentx=sessionStorage.getItem("currentx");
    var currenty=sessionStorage.getItem("currenty");
    //根据起终点坐标规划骑行路线
    riding.search([113.825905,34.023027],[currentx,currenty], function(status, result) {
        // result即是对应的公交路线数据信息，相关数据结构文档请参考  https://lbs.amap.com/api/javascript-api/reference/route-search#m_RidingResult
        if (status === 'complete') {
            log.success('骑行路线数据查询成功')
        } else {
            log.error('骑行路线数据查询失败' + result)
        }
    });

</script>

<script src="js2/alertcustom.js"></script>
</body>
</html>