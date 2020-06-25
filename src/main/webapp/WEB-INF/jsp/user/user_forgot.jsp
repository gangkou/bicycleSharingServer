<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
							<h4 class="card-title"><fmt:message key="forgotpassword"/> </h4>
							<form method="POST" action="sendIdCode.action.forgot">
							 
								<div class="form-group">
									<label for="email"><fmt:message key="email"/></label>
									<input id="email" type="email" class="form-control" name="mail" value="" required autofocus>
									<div class="form-text text-muted">
										<fmt:message key="forgotshow"/>
									</div>
								</div>

								<div class="form-group no-margin">
									<button type="submit" class="btn btn-primary btn-block">
										<fmt:message key="resetpwd"/>
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
	<%
	String forgotcode=(String)session.getAttribute("forgotcode");
	if(forgotcode!=null){
	%>
	<script type="text/javascript">
		alert("<%=forgotcode%>");
	</script>
<%
		}
		session.removeAttribute("forgotcode");
	%>
</body>
</html>