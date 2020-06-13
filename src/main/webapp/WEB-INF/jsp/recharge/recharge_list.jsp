<%--
  Created by IntelliJ IDEA.
  User: 小米饭
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../common/tag.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>充值记录</title>
    <%@include file="../common/head.jsp" %>
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
                            <div class="widget-title  am-cf">充值记录列表</div>
                        </div>
                        <div class="widget-body  am-fr">
                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                <div class="am-form-group"></div>
                            </div>
                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                <div class="am-form-group tpl-table-list-select">
                                </div>
                            </div>
                            <div class="am-u-sm-12">
                                <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>用户编号</th>
                                        <th>充值金额</th>
                                        <th>账户余额</th>
                                        <th>充值时间</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.pageRecharges}" var="recharges">
                                        <tr class="gradeX">
                                            <td class="am-text-middle">${recharges.rechargeId }</td>
                                            <td class="am-text-middle">${recharges.userId }</td>
                                            <td class="am-text-middle">${recharges.rechargeAmount}</td>
                                            <td class="am-text-middle">${recharges.remaining}</td>
                                            <td class="am-text-middle">
                                                <fmt:formatDate value="${recharges.rechargeTime}" type="both"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <!-- more data -->
                                    </tbody>
                                </table>
                            </div>
                            <c:if test="${requestScope.pagePoint != null}">
                                <div class="am-u-lg-12 am-cf" style="font-size:14px;">
                                    <div class="am-fr">
                                        <ul class="am-pagination tpl-pagination">
                                            <li><a href="${pageContext.request.contextPath }/admin-recharge-list-show?page=${requestScope.pagePoint - 1 }">«</a></li>
                                            <li><a>当前第${requestScope.pagePoint }页(共${requestScope.pageMax }页)</a></li>
                                            <li><a href="#!" id="skipBtn"> 跳转到&nbsp;<input type="text" name="pagePoint" style="width:20px;height: 14px; color:black; font-size: 10px;">&nbsp;页</a></li>
                                            <li><a href="${pageContext.request.contextPath }/admin-recharge-list-show?page=${requestScope.pagePoint + 1 }">»</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath }/resources/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>
<script type="text/javascript">

    $(function(){
        $("#skipBtn").on("click",function(){
            var page = $("#skipBtn>input").val();
            if(page == ""){
                page = 1;
            }
            window.location = "${pageContext.request.contextPath}/admin-recharge-list-show?page=" + page;
        });
        $("#skipBtn > input").on("click", function() {
            return false;
        });
    })

</script>
</body>

</html>