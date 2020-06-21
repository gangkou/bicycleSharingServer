<%--
  Created by IntelliJ IDEA.
  User: 小米饭
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>添加员工</title>
    <%@include file="../common/head.jsp" %>
</head>

<body data-type="widgets">
<script src="${pageContext.request.contextPath }/resources//assets/js/theme.js"></script>
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
                            <div class="widget-title am-fl">添加员工</div>
                            <div class="widget-function am-fr">
                            </div>
                        </div>
                        <div class="widget-body am-fr">
                            <form autocomplete="off" class="am-form tpl-form-line-form" action="${pageContext.request.contextPath }/admin-emploee-addemploee-execute" method="post">

                                <div class="am-form-group">
                                    <label for="emploee-name" class="am-u-sm-3 am-form-label">姓名</label>
                                    <div class="am-u-sm-9">
                                        <input type="text"  class="tpl-form-input" id="emploee-name" placeholder="" name="emploeename">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="emploee-age" class="am-u-sm-3 am-form-label">年龄</label>
                                    <div class="am-u-sm-9">
                                        <input type="number" max="120" min="1"   class="tpl-form-input" id="emploee-age" placeholder="" name="emploeeage">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="emploee-sex" class="am-u-sm-3 am-form-label">性别</label>
                                    <div class="am-u-sm-9" >
                                        <input type="text" class="tpl-form-input" id="emploee-sex" placeholder="" name="emploeesex">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="emploee-email" class="am-u-sm-3 am-form-label">邮箱</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" class="tpl-form-input" id="emploee-email" placeholder="" name="emploeeemail">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="department-id" class="am-u-sm-3 am-form-label">部门编号</label>
                                    <div class="am-u-sm-9">
                                        <input type="number" max="4" min="1" class="tpl-form-input" id="department-id" placeholder="" name="emploeedepartid">
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
<script src="${pageContext.request.contextPath }/resources//assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath }/resources//assets/js/app.js"></script>
</body>

</html>

