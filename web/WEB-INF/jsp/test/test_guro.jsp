<%--
  Created by IntelliJ IDEA.
  User: yeons
  Date: 2021-10-31
  Time: 오후 1:54
  To change this template use File | Settings | File Templates.
--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file ="test_header.jsp"%>
    <div>
        <h1>
            안녕하세요!
        </h1>
    </div>
    <label for="inputPassword5" class="form-label">Password</label>
    <input type="password" id="inputPassword5" class="form-control" aria-describedby="passwordHelpBlock">
    <div id="passwordHelpBlock" class="form-text">
        Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.
    </div>
<%@include file ="test_footer.jsp"%>
</body>
</html>
