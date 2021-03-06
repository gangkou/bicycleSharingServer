<%--
  Created by IntelliJ IDEA.
  User: 小米饭
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../common/tag.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <title>修改账户信息</title>
    <%@include file="../common/head.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body data-type="widgets">
    <script src="${pageContext.request.contextPath }/resources/assets/js/theme.js"></script>
    <div class="am-g tpl-g">
  		<!-- 加载顶部导航栏 -->
        <jsp:include page="../common/header.jsp"/>
        <!-- 加载侧边导航栏 -->
        <jsp:include page="../common/list.jsp"/>

       <!-- 内容区域 -->
        <div class="tpl-content-wrapper">
            <div class="row-content am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">账号设置</div>
                                <div class="widget-function am-fr">
                                </div>
                            </div>
                            <div class="widget-body am-fr">
                                <form autocomplete="off" class="am-form tpl-form-line-form" action="${pageContext.request.contextPath }/admin-index-edit-execute" enctype="multipart/form-data" method="post">
                                    <input type="hidden" name="id" value="${sessionScope.admin.adminId }">
                                    <div class="am-form-group">
                                        <label class="am-u-sm-3 am-form-label">管理员名 </label>
                                        <div class="am-u-sm-9">
                                            <input type="text" readonly="readonly" class="tpl-form-input" name="name" value="${sessionScope.admin.adminName }">
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label class="am-u-sm-3 am-form-label">密码</label>
                                        <div class="am-u-sm-9">
                                            <input type="password" class="tpl-form-input" name="password" value="${sessionScope.admin.adminPassword }">
                                        </div>
                                    </div>     
                                    <div class="am-form-group">
                                        <label class="am-u-sm-3 am-form-label">邮箱 </label>
                                        <div class="am-u-sm-9">
                                            <input type="email" class="tpl-form-input" name="email" value="${sessionScope.admin.adminEmail }">
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label class="am-u-sm-3 am-form-label">更换头像 </label>
                                        <div class="am-u-sm-9">
                                            <input type="file" class="tpl-form-input" name="photo" value="">
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <div class="am-u-sm-9 am-u-sm-push-3">
                                            <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath }/resources/assets/js/amazeui.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>
</body>

</html>
