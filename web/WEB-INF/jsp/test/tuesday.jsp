<%--
  Created by IntelliJ IDEA.
  User: YOON
  Date: 2021-11-02
  Time: 오후 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String test_data = (String) request.getAttribute("tuesdayData");
%>
<html>
<head>
    <title>Title</title>

</head>
<body>
    <%@include file="test_header.jsp"%>
    <b>dfaddfadfasdf</b>
   ddddd
   gldad
    <div id="cards">
        하세요.
    </div>
    <input id="title">
    <input id="description">
    <input id="image">
    <button onclick="addData()"></button>
    <script>
        let data = <%=test_data%>
        console.log(data)
        $(document).ready(function (){
            makeCards();
        })
        function makeCards() {
            let card = $('#cards');
            let text = '';
            for(let i=0; i<data.length; i++){
                text+=data[i].title+'님 <button onclick="deleteData('+data[i].oid+')">삭제</button> <br>'
            }
            card.html(text);
        }
        function addData(){
            let title=$('#title').val();
            let description=$('#description').val();
            let image=$('#image').val();
            let data = title+'-/-/-'+description+'-/-/-'+image;

            $.ajax({
                url:"test_ajax.avocado",
                type:"post",
                data:{
                    req: "addTuesdayData",
                    data: data
                },
                success: function (result){
                    alert(result);
                    location.reload();
                }
            })
        }
        function deleteData(oid){
           $.ajax({
                url:"test_ajax.avocado",
                type:"post",
                data:{
                    req: "deleteTuesdayData",
                    data: oid
                },
                success: function (result){
                    alert(result);
                    location.reload();
                }
            })
        }
    </script>


</body>
</html>
