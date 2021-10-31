<%--
  Created by IntelliJ IDEA.
  User: gabri
  Date: 2021-10-03
  Time: 오후 5:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String test_data = (String) request.getAttribute("test_data");
%>
<html>
<head>
    <title>메인</title>
</head>
<body>
<div>
    git Test를 위한 push
    우와
    ㅇㅇㅇㅇㅇㅇ
    ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅁㄴㅇㄻㄴㅁㄴㅁㄴㅁㄴ
    test
    TEST
    테스트으으으으스타벅스에서작업중!
    센스있는 말
</div>
<div>
    <!-- <%=test_data%> -->
</div>
<hr>
<%@include file="test_header.jsp"%>
<%@include file="test_header2.jsp"%>
<div>
    <a href="test_dynamic.avocado">동적 페이지 테스트</a>
</div>
<%@include file="test_footer.jsp"%>
</body>
</html>
