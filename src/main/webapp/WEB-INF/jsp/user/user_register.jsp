<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<title>Join MtLa &mdash; 摩托轮拉</title>
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
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">注册</h4>
							<form method="POST" action="api-user-register">
							 
								<div class="form-group">
									<label for="name">用户名</label>
									<input id="name" type="text" class="form-control" name="userName" required autofocus>
								</div>

								<div class="form-group">
									<label for="email">电子邮箱</label>
									<input id="email" type="email" class="form-control" name="userEmail" required>
								</div>

								<div class="form-group">
									<label for="password">密码</label>
									<input id="password" type="password" class="form-control" name="userPassword" required data-eye>
								</div>

								<div class="form-group">
									<label>
										<input type="checkbox" name="aggree" value="1"> 我同意这些条款和条件
										<a href="#">服务条款</a>
									</label>
								</div>

								<div class="form-group no-margin">
									<button type="submit" class="btn btn-primary btn-block">
										注册
									</button>
								</div>
								<div class="margin-top20 text-center">
									已有注册? <a href="/api-user-login">登录</a>
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
	<script src="js/my-login.js"></script>
	<%
     String reg=(String)session.getAttribute("reg");
     String forgot=(String)session.getAttribute("forgot");
    
    if(reg!=null){
    %>
    <script type="text/javascript">
      alert("<%=reg%>");
    </script>
<%
}
    session.removeAttribute("reg");
    if(forgot!=null){
    	 %>
    	    <script type="text/javascript">
    	      alert("<%=forgot%>");
    	    </script>
    	<%	
    }
    session.removeAttribute("forgot");
    
    %>
</body>
</html>