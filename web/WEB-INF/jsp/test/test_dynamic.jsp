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
                    <a href="#" class="btn btn-primary my-2">Main call to action</a>
                    <a href="#" class="btn btn-secondary my-2">Secondary action</a>
                </p>
            </div>
            <a href="test_dynamic2.avocado">테스트 페이지로 이동</a>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="cards"></div>
        </div>
    </div>

</main>
<%@include file="test_footer.jsp"%>
</body>
<script>
    $(document).ready(function (){
        makeCards();
    })

    function makeCards() {
        let data = <%=test_data%>;
        let card = $('#cards');
        let text = '';
        for(let i = 0; i<data.length; i++){
            text+='<div class="col">'
                +'<div class="card shadow-sm">'
                +'<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">'+data[i].title+'</text></svg>'
                +'<div class="card-body">'
                +'<p class="card-text">'+data[i].description+'</p>'
                +'<div class="d-flex justify-content-between align-items-center">'
                +'<div class="btn-group">'
                +'<button type="button" class="btn btn-sm btn-outline-secondary">View</button>'
                +'<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>'
                +'</div>'
                +'<small class="text-muted">9 mins</small>'
                +'</div></div></div></div>';
        }
        card.append(text);
    }

</script>
</html>
