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
						map.plugin('AMap.Geolocation', function () {
							geolocation = new AMap.Geolocation({
								enableHighAccuracy: true,//是否使用高精度定位，默认:true
								timeout: 10000,          //超过10秒后停止定位，默认：无穷大
								maximumAge: 0,           //定位结果缓存0毫秒，默认：0
								convert: true,           //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
								showButton: true,        //显示定位按钮，默认：true
								buttonPosition: 'LB',    //定位按钮停靠位置，默认：'LB'，左下角
								buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
								showMarker: true,        //定位成功后在定位到的位置显示点标记，默认：true
								showCircle: true,        //定位成功后用圆圈表示定位精度范围，默认：true
								panToLocation: true,     //定位成功后将定位到的位置作为地图中心点，默认：true
								zoomToAccuracy:true      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
							});
							map.addControl(geolocation);
							geolocation.getCurrentPosition();
							AMap.event.addListener(geolocation, 'complete', onComplete);//返回定位信息
							AMap.event.addListener(geolocation, 'error', onError);      //返回定位出错信息
						});
						//解析定位结果
						function onComplete(data) {
							if(data.status == 1){
								console.log("定位成功");
								$("#addressInput").val(data.formattedAddress);
								sessionStorage.setItem("dingWei-lng",data.position.getLng());
								sessionStorage.setItem("dingWei-lat",data.position.getLat());
							}
							var str = [];
							str.push('经度：' + data.position.getLng());
							str.push('纬度：' + data.position.getLat());
							str.push('是否经过偏移：' + (data.isConverted ? '是' : '否'));
							console.log(str.join('<br>'));
						}
						//解析错误信息
						function onError() {
							var str = [];
							str.push('定位失败');
							console.log(str.join('<br>'));
						}
						// map.center=[data.position.getLng(),data.position().getLat()]  已默认显示所在位置

						/**
						 * 一个坑 目前 由于Chrome、IOS10等已不再支持非安全域的浏览器定位请求，
						 * 为保证定位成功率和精度，请尽快升级您的站点到HTTPS。
						 * 伤心....   定位效果很差 且无法获取位置经纬度
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
								marker[i].setTitle(" "+(i+1));
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

						var clickEventListener = map.on('click', function(e) {
							sessionStorage.setItem("currentx",e.lnglat.getLng());
							sessionStorage.setItem("currenty",e.lnglat.getLat());
							alert("-------------------目标经纬度-------------------经度:"+e.lnglat.getLng() + ",纬度:" + e.lnglat.getLat());
						});
						var auto = new AMap.Autocomplete({
							input: "tipinput"
						});
						AMap.event.addListener(auto, "select", select);//注册监听，当选中某条记录时会触发
						function select(e) {
							if (e.poi && e.poi.location) {
								map.setZoom(15);
								map.setCenter(e.poi.location);
							}
						}
					</script>
				</div>
			</div>
		</div>

	</div>
	<script src="js2/alertcustom.js"></script>
</body>
</html>