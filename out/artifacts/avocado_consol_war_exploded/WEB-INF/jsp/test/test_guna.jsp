<%--
  Created by IntelliJ IDEA.
  User: gg
  Date: 10/10/21
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String test_data = (String)request.getAttribute("test_data");
%>

<html>
<head>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title>Title</title>
</head>
<body>
<%@include file="test_header.jsp"%>
    <div class="album py-5 bg-light">
        <div id ="user">

        </div>

        <div class="container">
            <div>이름 <input class="form-control" type="text" id="name"></div>
            <button class="btn btn-success" onclick="search()">검색하기</button>
        </div>

        <div id="userinfo">

        </div>
    </div>
<%@include file="test_footer.jsp"%>
</body>

<script>
    let user = $('#user');
    let userinfo = $('#userinfo');
    let data = <%=test_data%>;
    user.append("<br>");
    for(let i=0; i<data.length; i++){
        user.append('<button id = '+i+' type="button" class="btn btn-secondary" onclick = deletedata('+i+')>'+data[i].title+'</button>')
    }
    user.append("<br><br>");


    function search() {
        let name = $('#name').val();
        $.ajax({
            url:"test_guna_db.avocado",
            type : "POST",
            data:{
                name : name
            },
            success : function(data){
                info(data)
            }
            }
        )
    }
    function info(data){
        let start = 0;
        let last = 0;

        let oid = '';
        let title = '';

        start = data.indexOf('oid" :');
        last = data.indexOf(',');
        for(let i=start; i<last; i++){
            oid += data[i];
        }
        let text = '';

    }

    function search() {
        let name = $('#name').val();
        $.ajax({
            url:"test_guna_db.avocado",
            type : "POST",
            data:{
                name : name
            },
            success : function(data){
                info(data)
            }
            }
        )
    }

    function info(data){

        let text = '';
        const arr = data.split("--");

        text +=
            'oid : '+arr[0]+'<br>'
        +'name : '+arr[1]+'<br>'
        +'decription : '+arr[2]+'<br>'
        +'image_url : '+arr[3]+'<br>';

        userinfo.html(text);
    }

    function deletedata(oid){
        oid++;
        $.ajax({
                url:"test_ajax.avocado",
                type : "POST",
                data:{
                    req : "deleteData",
                    data : oid
                },
                success : function(data){
                    deleteDiv(oid);
                    alert(data);
                }
            }
        )
    }
    function deleteDiv(oid){
        oid--;
        const div = document.getElementById(oid);
        div.remove();
    }
</script>
</html>
