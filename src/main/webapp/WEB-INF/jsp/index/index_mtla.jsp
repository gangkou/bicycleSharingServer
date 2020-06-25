<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>
         MtLa-摩托轮拉
        </title>
        <meta charset="utf-8">
        <!--CSS-->
        
        <link rel="stylesheet" type="text/css" href="css1/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css1/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css1/style.css">
        <link rel="stylesheet" type="text/css" href="css1/animate.css">
        <!--Google Fonts-->
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
    </head>
    <body>
       <header class="header" id="HOME">
                 <!-- Navigation -->
            
            <nav class="navbar navbar-default navbar-fixed-top">
              
                
                <div class="container">
                  
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#loso-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                      </button>
                      <a class="navbar-brand" href="#">
                          <!-- small size logo -->
                          <img src="images1/lb.png" alt="logo">

                        </a>
                    </div>


                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="loso-navbar-collapse-1">
                  <ul class="nav navbar-nav navbar-right">
                      <li><a href="#HOME" class="nav-item"><fmt:message key="home" /></a></li>
                        <li><a href="#about" class="nav-item"><fmt:message key="about" /></a></li>
                        <li><a href="#performers" class="nav-item"><fmt:message key="introduce" /></a></li>
                        <li><a href="#timeline" class="nav-item"><fmt:message key="company" /></a></li>
                        <li><a href="#numbers" class="nav-item"><fmt:message key="data" /></a></li>
                        <li><a href="#contact-us" class="nav-item"><fmt:message key="contact" /></a></li>
                        <li><a href="/index_mtla?lang=zh_CN" class="nav-item">中文简体</a></li>
                        <li><a href="/index_mtla?lang=en_US" class="nav-item">English</a></li>
                  </ul>
                 
                 
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
</nav>
                  
           <div class="header-overlay">
               <div class="container">
                   <div class="row">
                    <div class="col-md-12">
                        <!--Logo-->
                        <div class="logo text-center">
                            <img src="images1/lb.png" height="80px" width="80px" class="logoimg" />
                        </div>
                    </div>
                    <div class="row">
                    <div class="col-md-8 wow bounceIn">
                        <div class="header-text">
                            <h1><fmt:message key="mtla" /></h1>
                            <p><fmt:message key="mtlatittle" /></p>
                        </div>
                        <div class="header-btns">
                          <a href="#about">
                              <i class="fa fa-angle-down wow bounceInUp"></i>
                          </a>
                        
                      </div>
                    </div>
                    <div class="col-md-4">
                       <div class="header-col">
                       
                   <script type="text/javascript">
                       function login()
                  { 
                    document.form1.action="user_login";
                    document.form1.submit(); 
                    } 
     
                       function register()
                  { 
                        document.form1.action="user_register";
                        document.form1.submit(); 
                  } 
                      </script> 
                         <form role="form" class="header-form" name="form1" action="">
                            <h2><fmt:message key="newlife" /></h2>
                             <div class="form-group">                                 
                             </div>
                             <div class="form-group">
                                 <button type="button" class="btn btn-primary btn-3x" onclick="login()"><fmt:message key="userlogin" /><span> <i class="fa fa-angle-double-right"></i> </span></button>
                             </div>
                              <div class="form-group">                                 
                             </div>
                             <div class="form-group">
                                 <button type="button" class="btn btn-primary btn-3x" onclick="register()"><fmt:message key="userregister" /> <span> <i class="fa fa-angle-double-right"></i> </span></button>
                             </div>
                         </form>
                       </div>
                        
                    </div>
                </div>
                </div>
                   <div class="row"></div>
               </div>
           </div>
       </header>
       <!--Section About-->
       <section id="about">
          
           <div class="section-about">
              <div class="container">
                  <div class="row">
                      <div class="col-md-12 wow bounceIn">
                          <h2 class="section-title"><fmt:message key="home.on"/> </h2>
                          <p class="under-heading"><fmt:message key="home.overview"/></p>
                      </div>
                  </div>
              </div>
               <div class="section-wrapper">
                   <div class="container">
               <div class="row">
                   <div class="col-md-4 wow bounceInDown">
                       
                           <a href="#"><i class="fa fa-user fa-5x square"></i></a>
                           <h3 class="heading"><fmt:message key="home.cerater"/></h3>
                           <p class="col-caption"><fmt:message key="home.cerater.show"/></p>
                   </div>
                       
                    <div class="col-md-4 wow bounceInDown">
                       
                           <a href="#"><i class="fa fa-bicycle fa-5x"></i></a>
                           <h3 class="heading"><fmt:message key="home.sport"/></h3>
                           <p class="col-caption"> <fmt:message key="home.sprot.show"/></p>
                           
                    </div>
                      
                    <div class="col-md-4 wow bounceInRight">
                       
                           <a href="#"><i class="fa fa-location-arrow fa-5x"></i></a>
                           <h3 class="heading"><fmt:message key="home.service"/></h3>
                           <p class="col-caption">
                               <fmt:message key="home.service.show"/>
                           </p>
                    </div>
               </div>
           </div>
               </div>
           </div>
           
       </section><!--end of about section-->
      
       <!--Performers Section-->
       <section class="performer-section" id="performers">
           <div class="performer wow flipInY">
            <div class="performer-overlay">
                      <div class="container">
                          <div class="row">
                              <div class="col-md-12">

                                <h2 class="section-title"><fmt:message key="ceo"/></h2>

                              </div>
                          </div>
                      </div>
                       <div class="section-wrapper">
                           <div class="container">
                           <div class="row">
                            <div class="col-md-12">
                            <div id="carousel-performer" class="carousel slide" data-ride="carousel">
                                  <!-- Indicators -->
                                  <ol class="carousel-indicators">
                                    <li data-target="#carousel-performer" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-performer" data-slide-to="1"></li>
                                    <li data-target="#carousel-performer" data-slide-to="2"></li>
                                  </ol>
                                  <!-- Wrapper for slides -->
                                  <div class="carousel-inner" role="listbox">
                                    <div class="item active">
                                      <img src="images1/avatar_01.jpg" alt="Client01">
                                      <div class="performer-caption">
                                        <h2><fmt:message key="ceo.1"/><span class="job"> CEO&CTO </span></h2>
                                          <p><fmt:message key="ceo.1.show"/></p>
                                      </div>
                                    </div>
                                    <div class="item">
                                      <img src="images1/avatar_02.jpg" alt="Client02">
                                      <div class="performer-caption">
                                        <h2><fmt:message key="ceo.2"/><span class="job">Legal adviser </span></h2>
                                          <p><fmt:message key="ceo.2.show"/></p>
                                      </div>
                                    </div>
                                    <div class="item">
                                      <img src="images1/avatar_03.jpg" alt="Client03">
                                      <div class="performer-caption">
                                        <h2><fmt:message key="ceo.3"/><span class="job">CFO</span></h2>
                                          <p><fmt:message key="ceo.3.show"/></p>
                                      </div>
                                    </div>
                                   </div>
                           </div>
                        </div>
                       </div>
                       </div>
                       </div>
               </div>
               </div>
       </section><!--End of Performers-->
       <section class="why-us" id="timeline">
            <div class="section-timeline">
                <div class="container">
                    <h2 class="heading">公司<span class="bold-green"> 发展</span></h2>
                    <p class="lead under-heading text-center">创业发展历程</p>
                    <ul class="timeline">
                        <li>
                            <div class="timeline-badge"><span class="counteryear">2019</span></div>
                            <div class="timeline-panal wow bounceIn">
                                <div class="timeline-heading">
                                    <h4 class="timeline-title">全面 <span class="blue-underline"> 布局</span> </h4>
                                    <p><small class="text-muted"><i class="fa fa-clock-o"></i> 1 year ago via Sina </small></p>
                                </div>
                                <div class="timeline-body"><p>12月：摩托轮拉顺风车一周年，总完单量8000万<br>
6月：摩托轮拉出行共建两轮能源网络；摩托轮拉换电业务在开封落地<br>
5月：摩托轮拉车服实现全国6地成功开城<br>
3月：摩托轮拉车服启动全国招商<br>
2月：摩托轮拉顺风车业务在全国正式上线</p></div>
                            </div><!--end of timeline panel-->
                        </li>
                        
                        <li class="timeline-inverted">
                            <div class="timeline-badge"><span class="counteryear">2018</span></div>
                            <div class="timeline-panal  wow bounceIn">
                                <div class="timeline-heading">
                                    <h4 class="timeline-title"><span class="blue-underline">战略</span> 升级</h4>
                                    <p><small class="text-muted"><i class="fa fa-clock-o" aria-hidden="true"></i> 2 years ago via Sina </small></p>
                                </div>
                                <div class="timeline-body"><p>12月：摩托轮拉单车全国免押累计辐射1.61亿用户，免除押金约320亿元<br>
10月：摩托轮拉出行接入其他出行合作伙伴上线网约车服务<br>
9月：“摩托轮拉单车”两周年年暨品牌全新升级为“摩托轮拉出行”<br>
7月：摩托轮拉单车日订单量超过2000万，用户口碑和订单规模跃居行业首位<br>
5月：全国免押双满月，累计为6000万用户免除押金120亿元</p></div>
                            </div><!--end of timeline panel-->
                        </li>
                        
                        <li>
                            <div class="timeline-badge"><span class="counteryear">2017</span></div>
                            <div class="timeline-panal wow bounceIn">
                                <div class="timeline-heading">
                                    <h4 class="timeline-title"><span class="blue-underline">飞速</span> 发展</h4>
                                    <p><small class="text-muted"><i class="fa fa-clock-o" aria-hidden="true"></i>3 years ago via Sina </small></p>
                                </div>
                                <div class="timeline-body"><p>12月：摩托轮拉单车先后完成D1轮3.5亿美金融资，D2轮10亿⼈民币融资<br>
11月：摩托轮拉单车投车一年，注册用户近4600万人次,日均骑行人次1000万<br>
10月：完成和永安行低碳科技战略合并<br>
9月：摩托轮拉助力车业务正式上线<br>
8月：“摩托轮拉单车3.0”全新上线</p></div>
                            </div><!--end of timeline panel-->
                        </li>
                    </ul>
                    
                    
                </div>
            </div>
        </section><!--end of timeline-->
        <section id="numbers">
            <div class="numbers-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="section-title"><fmt:message key="datashow"/></h2>
                            <p class="under-heading"><fmt:message key="honur"/></p>
                        </div>
                    </div>
                </div>
                <div class="section-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="num-data block-inline">
                                    <i class="fa fa-flag fa-5x"></i>
                                    <div class="counter">189.9</div><fmt:message key="mile"/>
                                    <p><fmt:message key="miless"/></p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="num-data block-inline">
                                    <i class="fa fa-database fa-5x"></i>
                                    <div class="counter">47</div><fmt:message key="orcle"/>
                                    <p><fmt:message key="orcless"/></p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="num-data block-inline">
                                    <i class="fa fa-bicycle fa-5x"></i>
                                    <div class="counter">147</div><fmt:message key="carbon"/>
                                    <p><fmt:message key="carbonss"/></p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="num-data block-inline">
                                    <i class="fa fa-life-ring fa-5x"></i>
                                    <p><div class="counter">7874</div><fmt:message key="tree"/>
                                    <p><fmt:message key="treess"/></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="contact-us">
            <div class="contact-us">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 wow bounceInDown">
                            <h2 class="section-title"><fmt:message key="feedback"/></h2>
                            <p class="under-heading"><fmt:message key="tellme"/></p>
                        </div>
                    </div>
                </div>
                <div class="section-wrapper">
                    <div class="container">
                  
                   
                        <form role="form" action="admin-userFeedback-removeuser-execute" method="post">
                            <div class="row">
                            <div class="col-md-6 wow bounceInLeft">
                                
                                    <div class="form-group">
                                        <input type="text" placeholder="<fmt:message key="feedbacktittle"/>" class="form-control input-lg" name="feedbackTitle">
                                    </div>
                                    <div class="form-group">
                                        <input type="email" placeholder="<fmt:message key="feedbackemail"/>" class="form-control input-lg" name="userEmail">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" placeholder="<fmt:message key="feedbackbicycleid"/>" class="form-control input-lg" name="bicycleId">
                                    </div>
                                
                            </div>
                            <div class="col-md-6 wow bounceInRight">
                               <div class="form-group">
                                <textarea placeholder="<fmt:message key="feedbackcontent"/>" class="form-control " name="feedbackContent"></textarea>
                               </div>
                               <button type="submit" class="btn btn-primary btn-block input-lg"><fmt:message key="feedbacksend"/></button>
                            </div>
                        </div>
                        </form>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="social-icons wow slideInDown">
                                    <ul class="list-unstyled">
                                        <li><a href="#"><i class="fa fa-facebook fa-3x"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter fa-3x"></i></a></li>
                                        <li><a href="#"><i class="fa fa-google-plus fa-3x"></i></a></li>
                                        <li><a href="#"><i class="fa fa-instagram fa-3x"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="footer">
            <div class="footer-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <p class="footer-text" >Copyright &copy;<fmt:message key="copyright"/><br>2020-6-12
						<br> Learned it from Teacher Chen</p>
                        </div>
                        <div class="col-md-4">
                            <p class="footer-text"><fmt:message key="footmiddle"/></p>
                        </div>
                        <div class="col-md-4">
                            <p class="footer-text"><fmt:message key="showforyou"/> <span class="usama"><a href="#/UsamaElsayed90"><fmt:message key="author"/></a></span>
                            <br><span class="usama"><a href="admin-index-index-show"><fmt:message key="adminlogin"/></a></span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="loading-overlay">
       <div class="sk-cube-grid">
        <div class="sk-cube sk-cube1"></div>
        <div class="sk-cube sk-cube2"></div>
        <div class="sk-cube sk-cube3"></div>
        <div class="sk-cube sk-cube4"></div>
        <div class="sk-cube sk-cube5"></div>
        <div class="sk-cube sk-cube6"></div>
        <div class="sk-cube sk-cube7"></div>
        <div class="sk-cube sk-cube8"></div>
        <div class="sk-cube sk-cube9"></div>
       </div>
       </section>
       
       
       
        <script src="js1/jquery.js"></script>
        <script src="js1/bootstrap.min.js"></script>
        <script src="js1/plugins.js"></script>
        <script src="js1/jquery.counterup.min.js"></script>
        <script src="js1/jquery.waypoints.min.js"></script>
        <script src="js1/jquery.nicescroll.min.js"></script>
        <script src="js1/wow.min.js"></script>
        <script>new WOW().init();</script>
    </body>
  
</html>