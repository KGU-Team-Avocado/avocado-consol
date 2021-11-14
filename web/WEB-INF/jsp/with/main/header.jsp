<%--
  Created by IntelliJ IDEA.
  User: sol
  Date: 2021-11-08
  Time: 오후 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user = (String)session.getAttribute("user");
    String type = (String)session.getAttribute("type");
%>
<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="megakit,business,company,agency,multipurpose,modern,bootstrap4">

    <meta name="author" content="themefisher.com">

    <%--    jQuery    --%>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<%--    &lt;%&ndash;    Bootstrap    &ndash;%&gt;--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>--%>


    <script src="/static/adminlet-2.4.10/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="/static/adminlet-2.4.10/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

    <%--    Bootstrap Table    --%>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css">
    <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>

    <!-- bootstrap.min css -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css">
    <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
    <link rel="stylesheet" href="/theme/with/plugins/bootstrap/css/bootstrap.min.css">

    <!-- Icon Font Css -->
    <link rel="stylesheet" href="/theme/with/plugins/themify/css/themify-icons.css">
    <link rel="stylesheet" href="/theme/with/plugins/fontawesome/css/all.css">
    <link rel="stylesheet" href="/theme/with/plugins/magnific-popup/dist/magnific-popup.css">

    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="/theme/with/plugins/slick-carousel/slick/slick.css">
    <link rel="stylesheet" href="/theme/with/plugins/slick-carousel/slick/slick-theme.css">

    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="/theme/with/css/style.css">

</head>

<!-- Header Start -->

<header class="navigation">
    <div class="header-top ">
        <div class="container">
            <div class="row justify-content-between align-items-center">
                <div class="col-lg-2 col-md-4">
                    <div class="header-top-socials text-center text-lg-left text-md-left">
                        <a href="https://www.facebook.com/themefisher" target="_blank"><i class="ti-facebook"></i></a>
                        <a href="https://twitter.com/themefisher" target="_blank"><i class="ti-twitter"></i></a>
                        <a href="https://github.com/themefisher/" target="_blank"><i class="ti-github"></i></a>
                    </div>
                </div>
                <div class="col-lg-10 col-md-8 text-center text-lg-right text-md-right">
                    <div class="header-top-info">
                        <a href="tel:+23-345-67890">Call Us : <span>+23-345-67890</span></a>
                        <a href="mailto:support@gmail.com" ><i class="fa fa-envelope mr-2"></i><span>withMC@gmail.com</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg  py-4" id="navbar">
        <div class="container">
            <a class="navbar-brand" href="/withHome.avocado">
                <span>위드</span>경영컨설팅
            </a>

            <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
                <span class="fa fa-bars"></span>
            </button>

            <div class="collapse navbar-collapse text-center" id="navbarsExample09">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">About</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdown03">
                            <li><a class="dropdown-item" href="information.avocado?num=10">회사소개</a></li>
                            <li><a class="dropdown-item" href="information.avocado?num=11">연혁</a></li>
                            <li><a class="dropdown-item" href="information.avocado?num=12">컨설팅절차</a></li>
                            <li><a class="dropdown-item" href="information.avocado?num=13">컨설팅목표</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="service.html">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="project.html">Portfolio</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown05" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Blog</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdown05">
                            <li><a class="dropdown-item" href="bbs.avocado?mode=list">게시판</a></li>
                            <li><a class="dropdown-item" href="blog-sidebar.html">Blog with Sidebar</a></li>

                            <li><a class="dropdown-item" href="blog-single.html">Blog Single</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                </ul>

                <form class="form-lg-inline my-2 my-md-0 ml-lg-4 text-center">
                    <a href="contact.html" class="btn btn-solid-border btn-round-full">Get a Quote</a>
                </form>
            </div>
        </div>
    </nav>
</header>

<!-- Header Close -->
