<%--
  Created by IntelliJ IDEA.
  User: ellie
  Date: 2021-11-10
  Time: 오후 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css">
    <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
</head>
<body>
<%@include file="../main/header.jsp"%>
<div class="main-wrapper ">
    <section class="page-title bg-1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block text-center">
                        <span class="text-white">News details</span>
                        <h1 class="text-capitalize mb-4 text-lg">Blog Single</h1>
                        <ul class="list-inline">
                            <li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
                            <li class="list-inline-item"><span class="text-white">/</span></li>
                            <li class="list-inline-item"><a href="#" class="text-white-50">News details</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <section class="section blog-wrap bg-gray">
        <div class="container">
            <table class="boardtable" id="table1"  data-toggle="table"
                   data-pagination="true" data-toolbar="#toolbar"
                   data-search="true" data-side-pagination="true" data-click-to-select="true" data-height="600"
                   data-page-size="10"
                   data-page-list="[10,20,30]">
                <thead>
                <tr>
                    <th data-field="id" data-sortable="false">번호</th>
                    <th data-field="title" data-sortable="false">제목</th>
                    <th data-field="writer_name" data-sortable="false">글쓴이</th>
                    <th data-field="last_modified" data-sortable="false">작성일</th>
                    <th data-field="views" data-sortable="false">조회수</th>
                    <%--            <th data-field="likes" data-sortable="true">추천</th>--%>
                </tr>
                </thead>
            </table>
        </div>
    </section>
    <%@include file="../main/footer.jsp"%>
</div>
</body>
</html>
