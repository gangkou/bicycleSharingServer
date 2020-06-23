<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<html lang="zxx">

<head>
    <title>MtLa-摩托轮拉</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8" />
    <meta name="keywords" content="" />
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>

    <!-- Custom Theme files -->
    <link href="css2/bootstrap.min.css" type="text/css" rel="stylesheet" media="all">
    <link href="css2/style.css" type="text/css" rel="stylesheet" media="all">
    <!-- font-awesome icons -->
    <link href="css2/font-awesome.min.css" rel="stylesheet">
    <!-- //Custom Theme files -->
    <!-- online-fonts -->
    <link href="http://fonts.googleapis.com/css?family=Amaranth:400,400i,700,700i" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i" rel="stylesheet">
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>


</head>

<body >

    <div class="container-fluid" style="overflow-y:hidden">
        <div class="row" style="overflow-y:hidden">
            <!-- header -->
            <div class="col-lg-2" id="spy" style="overflow-y:hidden">
                <div class="header-agile" style="overflow-y:hidden">
                    <h1>
                        <a class="navbar-brand" href="/index_mtla">
                           MtLa
                        </a>
                    </h1>
                </div>
                <ul class="nav nav-pills flex-column mt-lg-5">
                    <li class="nav-item"><a class="nav-link active" >用户名：${sessionScope.user.userName}</a></li>
                    <li class="nav-item"><a class="nav-link" >电子邮箱：${sessionScope.user.userEmail}</a></li>
                    <li class="nav-item"><a class="nav-link" >账户余额：${sessionScope.user.userAccount}</a><a href="user-recharge" class="nav-link active" >充值</a></li>
                    <li class="nav-item"><a class="nav-link" >信誉度：${sessionScope.user.userCredit}</a></li>
                    <li class="nav-item"><a class="nav-link">押金：${sessionScope.user.userCash}</a><a href="${pageContext.request.contextPath}/api-user-UserCash" class="nav-link active" >提交/退回押金</a></li>
                </ul>
                <a href="user-exit-execute"><button type="button" class="btn btn-block mt-lg-5 mt-3 w3ls-btn p-1 btn-theme text-white  text-uppercase font-weight-bold"
                    data-toggle="modal" aria-pressed="false" data-target="#exampleModal1" >
                              退出登录
                </button>
                </a>
            </div>   
            <!-- //header -->
                   
            <!-- main -->
            <div class="col-lg-10 scrollspy-example pr-0" data-spy="scroll" data-target="#spy" style="overflow-x:hidden">
                <!-- about -->                           
                            <div class="row">
                                      <div style="width:200px; height:10px;">
                                      </div>

                                      <div style="width:100px; height:20px;">
                                      </div>

                                          <div class="buttons wthree mt-4">
                                              <form action="/user_login" method="post" id="bicycleform">
                                                  车辆编号:<input type="text" name="bicycleId">
                                                   <a  id="borrowbicycle" class="button1" href="#" data-toggle="modal" aria-pressed="false" data-target="#exampleModal" role="button" onclick="document.getElementById('bicycleform').submit();return false" > 租车/还车</a>
                                              </form>
                                          </div>


                                  <div style="width:140px; height:20px;">
                                       </div>
                                  <div style="width:140px; height:20px;">
                                       </div>
                                  <div style="width:140px; height:20px;">
                                       </div>
                                         <div class="buttons wthree mt-4">
                                         <a class="button1" href="https://m.amap.com/navi/?start=113.475522,34.144945&dest=113.474479,34.156735&destName=%E7%9B%AE%E7%9A%84%E5%9C%B0%EF%BC%9A%E4%BA%9A%E7%BB%86%E4%BA%9A&naviBy=walk&key=2e8706b34a94fb7b6cc4273dfd1c0899" data-toggle="modal" aria-pressed="false" data-target="#exampleModal" role="button">骑行导航</a>
                                         </div>
                                   <div style="width:100px; height:20px;">
                                      </div>                               

                  </div>                  
                 <!-- //about -->
                 
                <!-- banner -->
                <div id="home" class="w3ls-banner d-flex  align-items-center justify-content-center">
                      <jsp:include page="../user/map.jsp" flush="true"/>
                </div>
                <!-- //banner -->
                
                 <!-- footer -->
                 <div class="footer-bottom py-lg-5 py-3">
                            <div class="footerv2-w3ls  text-center">
                                <h6 class="w3f_title">关注我们</h6>
                                <ul class="social-iconsv2 agileinfo pt-3">
                                    <li>
                                        <a href="#">
                                            <span class="fa fa-facebook"></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="fa fa-twitter"></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="fa fa-google-plus"></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="fa fa-linkedin"></span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="footer-copy text-center">
                                <p class="text-dark">Copyright &copy;小米饭 SSM框架整合结课作业<br>2020-6-13
						<br> Learned it from Teacher Chen</p></p>
                            </div>
                        </div>
                 <!-- //footer -->
             </div>  
                       
            </div>
           </div>
                       
      <!-- //main -->
              
    <script src="js2/SmoothScroll.min.js"></script>
  
    <script src="js2/bootstrap.min.js"></script>
    <%
     String chargecash=(String)session.getAttribute("chargecash");
    
     String goacc=(String)session.getAttribute("goacc");
    if(chargecash!=null){
    %>
    <script type="text/javascript">
      alert("<%=chargecash%>");
    </script>
<%
}
    session.removeAttribute("chargecash");
    
        if(goacc!=null){
            %>
            <script type="text/javascript">
              alert("<%=goacc%>");
            </script>
        <%

        }
            session.removeAttribute("goacc");
    %>
</body>

</html>