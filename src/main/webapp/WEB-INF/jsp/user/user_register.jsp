<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<title>Join MtLa &mdash; 摩托轮拉</title>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/my-login.css">
     <%--验证邮箱可用性--%>
	<script type="text/javascript">
		function transferValue()
		{
			var email=document.getElementById("email").value;
			var name=document.getElementById("name").value;
			var password=document.getElementById("password").value;
			//https://www.cnblogs.com/exmyth/p/5308390.html 记录解决方式  太赞了!!!  困扰了一个下午!!!
			newURL="sendIdCode.action?mail="+email+"&name="+name+"&password="+password;
			url=encodeURI(encodeURI(newURL));
			window.open(url);
		}
	</script>

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
							<h4 class="card-title"><fmt:message key="registershow"/> </h4>
							<form method="POST" action="api-user-register">
							 
								<div class="form-group">
									<label for="name"><fmt:message key="username"/> </label>
									<input id="name" type="text" class="form-control" name="userName"  value="${name}" required autofocus>
								</div>

								<div class="form-group">
									<label for="email"><fmt:message key="email"/> </label>
									<input id="email" type="email" class="form-control" name="userEmail" value="${mail}" required>
								</div>

								<div class="form-group">
									<label for="password"><fmt:message key="password"/> </label>
									<input id="password" type="password" class="form-control" name="userPassword" value="${password}" required data-eye>
								</div>
								<div class="form-group">
									<label for="idcode"><fmt:message key="code"/> </label>
									<input style="width: 220px" type="number" min="1"  class="form-control-code" id="idcode" name="idcode" >
									&nbsp;&nbsp;&nbsp;&nbsp;<input  type="button" value=" <fmt:message key="sendcode"/>" id="sendidcode"  class="btn btn-primary btn-sm btn-outline-primary" onclick="transferValue()"></div>
								<div class="form-group">
									<label>
										<input type="checkbox" name="aggree" value="1"> <fmt:message key="agree"/>
										<a href="#"><fmt:message key="rules"/> </a>
									</label>
								</div>

								<div class="form-group no-margin">
									<button type="submit" class="btn btn-primary btn-block">
										<fmt:message key="registershow"/>
									</button>
								</div>
								<div class="margin-top20 text-center">
									<fmt:message key="haveregister"/>  <a href="user_login"><fmt:message key="login"/> </a>
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
		String idcodemsg=(String)session.getAttribute("idcodeMsg");
        String forgot=(String)session.getAttribute("forgot");

		if(registerresult!=null){
	%>
	<script type="text/javascript">
		alert("<%=registerresult%>");
	</script>
	<%
		}
		session.removeAttribute("registerresult");
		if(idcodemsg!=null){
	%>
	<script type="text/javascript">
		alert("<%=idcodemsg%>");
	</script>
	<%
		}
		session.removeAttribute("idcodeMsg");
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