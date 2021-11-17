<%--
  Created by IntelliJ IDEA.
  User: gabri
  Date: 2021-11-17
  Time: 오후 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>
<!--MAIN BANNER AREA START -->
<div class="banner-area banner-3">
    <div class="overlay dark-overlay"></div>
    <div class="d-table">
        <div class="d-table-cell">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 m-auto text-center col-sm-12 col-md-12">
                        <div class="banner-content content-padding">
                            <h5 class="subtitle">Avocado</h5>
                            <h2 class="banner-title">홈페이지 제작</h2>
                            <p>원하는 파트를 선택하여 조립해주세요</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--MAIN HEADER AREA END -->
<!-- ABOUT AREA START -->
<section id="intro" class="section-padding">
    <div class="container">
        <div class="row">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="header-tab" data-toggle="tab" href="#header" role="tab" aria-controls="header" aria-selected="true">Headers</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="hero-tab" data-toggle="tab" href="#hero" role="tab" aria-controls="hero" aria-selected="false">Heros</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="feature-tab" data-toggle="tab" href="#feature" role="tab" aria-controls="feature" aria-selected="false">Features</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="slidebar-tab" data-toggle="tab" href="#slidebar" role="tab" aria-controls="slidebar" aria-selected="false">Sidebars</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="footer-tab" data-toggle="tab" href="#footer" role="tab" aria-controls="footer" aria-selected="false">Footers</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="dropdown-tab" data-toggle="tab" href="#dropdown" role="tab" aria-controls="dropdown" aria-selected="false">Dropdowns</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="list-group-tab" data-toggle="tab" href="#list-group" role="tab" aria-controls="list-group" aria-selected="false">List Groups</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="modal-tab" data-toggle="tab" href="#modal" role="tab" aria-controls="modal" aria-selected="false">Modals</a>
                </li>
            </ul>
        </div>
        <div class="row">
            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="header" role="tabpanel" aria-labelledby="header-tab">1</div>
                <div class="tab-pane" id="hero" role="tabpanel" aria-labelledby="hero-tab">2</div>
                <div class="tab-pane" id="feature" role="tabpanel" aria-labelledby="feature-tab">3</div>
                <div class="tab-pane" id="slidebar" role="tabpanel" aria-labelledby="slidebar-tab">4</div>
                <div class="tab-pane" id="footer" role="tabpanel" aria-labelledby="footer-tab">5</div>
                <div class="tab-pane" id="dropdown" role="tabpanel" aria-labelledby="dropdown-tab">6</div>
                <div class="tab-pane" id="list-group" role="tabpanel" aria-labelledby="list-group-tab">7</div>
                <div class="tab-pane" id="modal" role="tabpanel" aria-labelledby="modal-tab">8</div>
            </div>
        </div>
        <hr>
        <div class="row">
            결과 화면이 나올 자리
        </div>
    </div>
</section>
<!-- ABOUT AREA END -->
<script>
    $('#myTab a').on('click', function (event) {
        event.preventDefault()
        $(this).tab('show')
    })
    $('#myTab a[href="#profile"]').tab('show') // Select tab by name
    $('#myTab li:first-child a').tab('show') // Select first tab
    $('#myTab li:last-child a').tab('show') // Select last tab
    $('#myTab li:nth-child(3) a').tab('show') // Select third tab

</script>
<%@include file="footer.jsp" %>
</body>
</html>