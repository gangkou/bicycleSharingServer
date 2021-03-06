<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<title>充值中心 &mdash; 摩托轮拉</title>
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
							<h4 class="card-title"><fmt:message key="rechargecenter" /></h4>
							<form method="POST" action="api-user-recharge">
							  <input type="hidden" name="userEmail" value="${sessionScope.user.userEmail}">
								<div class="form-group">
									<label for="account"><fmt:message key="rechargeaccount" />：</label>
									<input id="account" type="number" max="100000" min="1" class="form-control" name="rechargeAmount" value="" required autofocus>
									<div class="form-text text-muted">
										
									</div>
								</div>

								<div class="form-group no-margin">
									<button type="submit" class="btn btn-primary btn-block">
										<fmt:message key="recharge" />
									</button>
								</div>
								
							</form>
							<div class="margin-top20 text-center">
									 <a href="/index_mtla"><fmt:message key="returnindex" /></a>
							</div>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; <fmt:message key="copyright" />  2020-6-13
						<br> Learned it from Teacher Chen
					</div>
				</div>
			</div>
		</div>
	</section>
	<%  
	String chargecash=(String)session.getAttribute("chargecash");
        if(chargecash!=null){
            %>
            <script type="text/javascript">
              alert("<%=chargecash%>");
            </script>
        <%
        }
            session.removeAttribute("chargecash");
	%>
</body>
</html>