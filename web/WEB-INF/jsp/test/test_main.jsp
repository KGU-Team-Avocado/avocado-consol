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
    충돌테스트
</div>
<div>
    <!-- <%=test_data%> -->
</div>
<hr>
<%@include file="test_header.jsp"%>
<%@include file="test_header2.jsp"%>
<div id="test">
    <a href="test_dynamic.avocado">동적 페이지 테스트</a>
    <a href=""
</div>
<div class="d-flex justify-content-center" id="name">
    <div>
        <input id="title">
        <input id="dis">
        <input id="img">
        <button onclick="add()" class="me-1">제출</button>
    </div>
    <div id="buttons"></div>
</div>
<%@include file="test_footer.jsp"%>
</body>
</html>

<script>
    let test_data = <%=test_data%>;
    for(let i=0; i<test_data.length; i++){
        $('#test').append('<button type="button" class="btn btn-outline-success m-1" onclick="modify('+i+')">'+test_data[i].title+'</button>');
    }

    function add(){
        let title = $('#title').val();
        let dis = $('#dis').val();
        let img = $('#img').val();

        let data = title + "--" + dis + "--" + img;

        $.ajax({
            url: "test_ajax.avocado",
            type: "post",
            data: {
                req: "guro",
                data: data
            },
            success: function (data) {
                alert("성공");
                location.reload();
            }
        })
    }

    function deleteTest(i) {
        $.ajax({
            url: "test_ajax.avocado",
            type: "post",
            data: {
                req: "deleteGuro",
                data: test_data[i].oid
            },
            success: function (data) {
                alert("성공");
                location.reload();
            }
        })
    }
    function modify(i) {
        $('#title').val(test_data[i].title);
        $('#dis').val(test_data[i].description);
        $('#img').val(test_data[i].image_url);
        $('#buttons').html('<button onclick="modifyTest('+i+')">수정</button> <button onclick="deleteTest('+i+')">삭제</button>');
    }

    function modifyTest(i) {
        let oid = test_data[i].oid;
        let title = $('#title').val();
        let dis = $('#dis').val();
        let img = $('#img').val();
        let data = oid + '-/-/-' + title + '-/-/-' + dis + '-/-/-' + img;
        $.ajax({
            url: "test_ajax.avocado",
            type: "post",
            data: {
                req: "modifyData",
                data: data
            },
            success: function (data) {
                alert("성공");
                location.reload();
            }
        })
    }
</script>
