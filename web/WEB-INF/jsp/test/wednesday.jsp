<%--
  Created by IntelliJ IDEA.
  User: yeons
  Date: 2021-11-03
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String test = (String)request.getAttribute("wednesday");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%@include file="test_header.jsp"%>
    <div id="hello">
        안녕 수요일

    </div>
    <input id = "title">
    <input id = "description">
    <input id = "image_url">
    <button onclick="savedata()">저장</button>

    <%@include file="test_footer.jsp"%>




</body>
<script>
    let data = <%=test%>
    console.log(data)
    $(document).ready(function (){
        makeCards();
    })
    function makeCards(){
        let card = $('#hello');
        let text = '';
        for(let i=0; i<data.length; i++){
            text+=data[i].title+'님 <br>'
        }
        card.html(text);
    }
    function savedata(){
        let title = $('#title').val();
        let description = $('#description').val();
        let image_url = $('#image_url').val();
        let data = title+'-/-/-'+description+'-/-/-'+image_url;
        $.ajax({
            url:"test_ajax.avocado",
            type:"post",
            data:{
                req: "addWednesdayData",
                data: data
            },
            success: function (result){
                alert(result);
                location.reload();
            }
        })
    }

</script>

</html>
