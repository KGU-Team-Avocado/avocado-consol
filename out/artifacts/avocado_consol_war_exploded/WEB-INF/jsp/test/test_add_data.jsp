<%--
  Created by IntelliJ IDEA.
  User: gabri
  Date: 2021-10-11
  Time: 오후 5:33
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: gabri
  Date: 2021-10-06
  Time: 오후 3:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String test_data = (String)request.getAttribute("test_data");
%>

<!doctype html>
<html lang="en">
<body>
<%@include file="test_header.jsp"%>

<main>

    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">Album example</h1>
                <p class="lead text-muted">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don’t simply skip over it entirely.</p>
                <p>
                    <a href="test_add_data.avocado" class="btn btn-primary my-2">데이터 추가하기</a>
                    <a href="#" class="btn btn-secondary my-2">Secondary action</a>
                </p>
            </div>
            <a href="test_dynamic2.avocado">테스트 페이지로 이동</a>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">
            <div>이름<input class="form-control" type="text" id="title"></div>
            <div>설명<input class="form-control" type="text" id="description"></div>
            <div>경로<input class="form-control" type="text" id="image_url"></div>
            <button class="btn btn-success" onclick="addData()">데이터 추가하기</button>
        </div>
    </div>

</main>
<%@include file="test_footer.jsp"%>
</body>
<script>
    function addData(){
        let title = $('#title').val();
        let description = $('#description').val();
        let imageUrl = $('#image_url').val();
        let data = title+'-/-/-'+description+'-/-/-'+imageUrl
        // alert(title+description+imageUrl);
        $.ajax({
            url:"test_ajax.avocado",
            type:"post",
            data:{
                req: "addData",
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
