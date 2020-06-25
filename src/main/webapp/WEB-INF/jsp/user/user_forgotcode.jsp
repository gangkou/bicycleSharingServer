<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<title>Forgot password&mdash; 摩托轮拉</title>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/my-login.css">
</head>
<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center align-items-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<img src="img/logobike.png">
					</div>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title"><fmt:message key="code"/></h4>
							<form method="POST" action="/user_forgotcodejuge">
							 
								<div class="form-group">
									<label for="email"><fmt:message key="inputcode"/></label>
									<input id="email" type="text" class="form-control" name="code" value="" required autofocus>
								</div>

								<div class="form-group no-margin">
									<button type="submit" class="btn btn-primary btn-block">
										<fmt:message key="judge"/>
									</button>
								</div>
								
							</form>
							<div class="margin-top20 text-center">
									 <a href="/index_mtla"><fmt:message key="returnindex"/></a>
							</div>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; <fmt:message key="copyright"/>  2020-4-9
						<br> Learned it from Teacher Chen
					</div>
				</div>
			</div>
		</div>
	</section>
	
</body>
</html>