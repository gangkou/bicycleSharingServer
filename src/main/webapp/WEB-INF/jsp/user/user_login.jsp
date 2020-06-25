<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
							<h4 class="card-title"><fmt:message key="login"/> </h4>
							<form method="POST" action="api-user-login">
							 
								<div class="form-group">
									<label for="userEmail"><fmt:message key="email"/> </label>

									<input id="userEmail" type="email" class="form-control" name="userEmail" value="" required autofocus>
								</div>

								<div class="form-group">
									<label for="userPassword"><fmt:message key="password"/>
										<a href="user_forgot" class="float-right">
											<fmt:message key="forgotpwd"/>
										</a>
									</label>
									<input id="userPassword" type="password" class="form-control" name="userPassword" required data-eye>
								</div>

								<div class="form-group">
									<label>
										<input type="checkbox" name="remember"> <fmt:message key="remember"/>
									</label>
								</div>

								<div class="form-group no-margin">
									<button type="submit" class="btn btn-primary btn-block">
										<fmt:message key="login"/>
									</button>
								</div>
								<div class="margin-top20 text-center">
									<fmt:message key="noregister"/>  <a href="user_register"><fmt:message key="register"/> </a>
								</div>
								<div class="margin-top20 text-center">
									 <a href="/index_mtla"><fmt:message key="returnindex"/> </a>
								</div>
							</form>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; <fmt:message key="copyright"/>   2020-6-12
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
		String registerresult=(String)session.getAttribute("registerresult");
        String usernotlogin=(String)session.getAttribute("usernotlogin");
        String log=(String)session.getAttribute("ss");
        String forgotresult=(String)session.getAttribute("forgotresult");
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
 if(registerresult!=null){
	%>
	<script type="text/javascript">
		alert("<%=registerresult%>");
	</script>
	<%
		}
		session.removeAttribute("registerresult");
        if(forgotresult!=null){
    %>
    <script type="text/javascript">
        alert("<%=forgotresult%>");
    </script>
    <%
        }
        session.removeAttribute("forgotresult");
  %>
</body>
</html>