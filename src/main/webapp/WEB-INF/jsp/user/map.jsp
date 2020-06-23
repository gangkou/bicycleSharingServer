<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,org.bicyclesharing.entities.Bicycle"%>

<html>
<head>
	<meta charset="utf-8">
	<!--地图引入 高德地图api-->
	<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
	<script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
	<script src="http://webapi.amap.com/maps?v=1.3&key=a5e29f343721cf6a5c29a9ea1ceaf709"></script>
	<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
	<!---->
</head>
<body style="overflow:hidden">
	<div id="wrap" class="my-map">
		<div id="mapContainer"></div>
	</div>
	<script src="//webapi.amap.com/maps?v=1.3&key=8325164e247e15eea68b59e89200988b"></script>
	<div class="row am-cf">
		<div class="am-u-sm-12 am-u-md-12">
			<div class="widget am-cf">
				<div id="container" style="width: auto;height: 500px;">


					<script>

						var map = new AMap.Map('container', {
							resizeEnable: true,
							zoom: 20,
						});
						AMap.plugin('AMap.Geolocation', function() {
							var geolocation = new AMap.Geolocation({
								enableHighAccuracy: true,//是否使用高精度定位，默认:true
								timeout: 10000,          //超过10秒后停止定位，默认：5s
								buttonPosition:'RB',    //定位按钮的停靠位置
								buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
								zoomToAccuracy: true,   //定位成功后是否自动调整地图视野到定位点

							});
							map.addControl(geolocation);
							geolocation.getCurrentPosition(function(status,result){
								if(status=='complete'){
									onComplete(result)
								}else{
									onError(result)
								}
							});
						});
						//解析定位结果
						function onComplete(data) {
							document.getElementById('status').innerHTML='定位成功'
							var str = [];
							str.push('定位结果：' + data.position);
							str.push('定位类别：' + data.location_type);
							if(data.accuracy){
								str.push('精度：' + data.accuracy + ' 米');
							}//如为IP精确定位结果则没有精度信息
							str.push('是否经过偏移：' + (data.isConverted ? '是' : '否'));

							document.getElementById('result').innerHTML = str.join('<br>');
						}
						//解析定位错误信息
						function onError(data) {
							document.getElementById('status').innerHTML='定位失败'
							document.getElementById('result').innerHTML = '失败原因排查信息:'+data.message;
						}

						// map.center=[data.position.getLng(),data.position().getLat()]  已默认显示所在位置

						/**
						 * 一个坑 目前 由于Chrome、IOS10等已不再支持非安全域的浏览器定位请求，
						 * 为保证定位成功率和精度，请尽快升级您的站点到HTTPS。
						 * 伤心....   定位效果很差
						 */
						// 请求地址

						var url = '${pageContext.request.contextPath }/';
						var greenX = url + 'api-bicycle-getX/1';
						var greenY = url + 'api-bicycle-getY/1';
						// 保存数据的变量
						var greenBicycleCurrentX, greenBicycleCurrentY;
						Ajax(greenX, function (res) {
							greenBicycleCurrentX = JSON.parse(res);
							Ajax(greenY, function (res) {
								greenBicycleCurrentY = JSON.parse(res);
										init();
							})
						})

						function init(){
							    marker0 =new AMap.Marker({
									 icon:"//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-default.png",
									position:[113.825905,34.023027],
								})
							    marker0.setMap(map);
							    marker0.setTitle('我的位置');
							for (var i = 0; i < greenBicycleCurrentX.length; i++) {
								var marker=new Array();
								marker[i] = new AMap.Marker({
									icon: "http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png",
									position: [greenBicycleCurrentX[i], greenBicycleCurrentY[i]]
								});
								marker[i].setMap(map);
								marker[i].setTitle(" "+i);
							}
						}

						function Ajax(url, callback) {
							var xhr = new XMLHttpRequest();
							xhr.open('GET', url, true);
							xhr.send();
							xhr.onreadystatechange = function () {
								if (xhr.readyState == 4) {
									if (xhr.status == 200) {
										callback(xhr.responseText);
									}
								}
							}
						}
					</script>
				</div>
			</div>
		</div>
	</div>

</body>
</html>