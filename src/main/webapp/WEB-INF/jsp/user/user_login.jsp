<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<title>Sign in to MtLa&mdash; 摩托轮拉</title>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/my-login.css">
</head>
<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<img src="img/logobike.png">
					</div>
					<div align="center">
                    <h2>Sign in to MtLa</h2>
                        </div>

					<div class="card fat">				
						<div class="card-body">
							<h4 class="card-title">登录</h4>
							<form method="POST" action="api-user-login">
							 
								<div class="form-group">
									<label for="userEmail">电子邮箱</label>

									<input id="userEmail" type="email" class="form-control" name="userEmail" value="" required autofocus>
								</div>

								<div class="form-group">
									<label for="userPassword">密码
										<a href="forgot.jsp" class="float-right">
											忘记密码？
										</a>
									</label>
									<input id="userPassword" type="password" class="form-control" name="userPassword" required data-eye>
								</div>

								<div class="form-group">
									<label>
										<input type="checkbox" name="remember"> 记住我
									</label>
								</div>

								<c:if test="${requestScope.userLoginError == 1 }">
									<span style="color:#f44336;">用户名或密码输入有误!请检查后重新输入</span>
								</c:if>

								<div class="form-group no-margin">
									<button type="submit" class="btn btn-primary btn-block">
										登录
									</button>
								</div>
								<div class="margin-top20 text-center">
									您还没有注册？ <a href="user_register">注册账号</a>
								</div>
								<div class="margin-top20 text-center">
									 <a href="/index_mtla">返回首页</a>
								</div>
							</form>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; 小米饭 SSM框架整合结课作业  2020-6-12
						<br> Learned it from Teacher Chen
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js2/alertcustom.js"></script>
	<script src="js/my-login.js"></script>
	
	<%
     String usernotlogin=(String)session.getAttribute("usernotlogin");
     String log=(String)session.getAttribute("ss");

    if(usernotlogin!=null){
    %>
    <script type="text/javascript">
      alert("<%=usernotlogin%>");
    </script>
<%
}
    session.removeAttribute("ss");
 if(log!=null){
        %>
        <script type="text/javascript">
          alert("<%=log%>");
        </script>
    <%
    }
   session.removeAttribute("log");
  %>
</body>
</html>