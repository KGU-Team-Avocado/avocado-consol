<%--
  Created by IntelliJ IDEA.
  User: ssky6
  Date: 2021-10-11
  Time: 오전 4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String test_data = (String)request.getAttribute("test_data");
%>
<body class="bg-light">
<%@include file="test_header2.jsp"%>

<main class="container">
    <div class="d-flex align-items-center p-3 my-3 text-white bg-purple rounded shadow-sm">
        <img class="me-3" src="/docs/5.1/assets/brand/bootstrap-logo-white.svg" alt="" width="48" height="38">
        <div class="lh-1">
            <h1 class="h6 mb-0 text-white lh-1">Bootstrap</h1>
            <small>Since 2011</small>
        </div>
    </div>

    <h6 class="border-bottom pb-2 mb-0">Avocado members</h6>
    <div class="my-3 p-3 bg-body rounded shadow-sm" id="cards"></div>
    <a href="#">All suggestions</a>
</main>

<%@include file="test_footer.jsp"%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="offcanvas.js"></script>
</body>
<script>
    $(document).ready(function () {
        makeCards();
    })

    function makeCards() {
        let data = <%=test_data%>;
        let card = $('#cards');
        let text = '';
        for (let i = 0; i < data.length; i++) {
            text +='<div class="d-flex text-muted pt-3">'
                +'<svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#007bff"/><text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg>'
                +'<div class="pb-3 mb-0 small lh-sm border-bottom w-100">'
                +'<div class="d-flex justify-content-between">'
                +'<strong class="text-gray-dark">'+data[i].title+'</strong>'
                +'<a href="#">Follow</a>'
                +'</div>'
                +'<span class="d-block">'+data[i].description+'</span>'
                +'</div>'
                +'</div>'
                +'<small class="d-block text-end mt-3">'
                +'</small>';
        }
        card.append(text);
    }
</script>
</html>
