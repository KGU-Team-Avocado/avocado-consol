<%--
  Created by IntelliJ IDEA.
  User: gabri
  Date: 2021-11-17
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user = (String)session.getAttribute("user");
    String type = (String)session.getAttribute("type");
%>
<head>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="seo & digital marketing">
    <meta name="keywords" content="marketing,digital marketing,creative, agency, startup,promodise,onepage, clean, modern,seo,business, company">
    <meta name="author" content="Themefisher.com">

    <title>Promodise - seo and digital marketing solution </title>
    <!-- bootstrap.min css -->
    <link rel="stylesheet" href="../../../theme/promodise/plugins/bootstrap/css/bootstrap.css">
    <!-- Icofont Css -->
    <link rel="stylesheet" href="../../../theme/promodise/plugins/fontawesome/css/all.css">
    <!-- animate.css -->
    <link rel="stylesheet" href="../../../theme/promodise/plugins/animate-css/animate.css">
    <!-- Icofont -->
    <link rel="stylesheet" href="../../../theme/promodise/plugins/icofont/icofont.css">

    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="../../../theme/promodise/css/style.css">


</head>


<body data-spy="scroll" data-target=".fixed-top">



<nav class="navbar navbar-expand-lg fixed-top trans-navigation">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <img src="/theme/promodise/images/main_logo.png" alt="" class="img-fluid b-logo">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon">
                    <i class="fa fa-bars"></i>
                </span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="mainNav">
            <ul class="navbar-nav ">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarWelcome" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Home
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarWelcome">
                        <a class="dropdown-item " href="index.jsp">
                            Home-1
                        </a>
                        <a class="dropdown-item " href="index-2.jsp">
                            Home-2
                        </a>
                        <a class="dropdown-item " href="index-3.jsp" target="blank">
                            Onepage
                        </a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link smoth-scroll" href="about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link smoth-scroll" href="service.jsp">Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link smoth-scroll" href="pricing.jsp">Pricing</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link smoth-scroll" href="blog.jsp">Blog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link smoth-scroll" href="contact.jsp">Contact</a>
                </li>
                <li class="nav-item" id="loginInfo"></li>
            </ul>
        </div>
    </div>
</nav>
<!--MAIN HEADER AREA END -->
<script>
    $(document).ready(function () {
        makeLoginInfo();
    })

    function makeLoginInfo() {
        let user = <%=user%>;
        let card = $('#loginInfo');
        let text = '';
        if (user == null) {
            text += '<a class="nav-link smoth-scroll" href="loginPage.avocado">Login</a>'
        } else {
            text += '<a class="nav-link smoth-scroll" href="logout.avocado">Logout</a>'
        }


        card.append(text);
    }

</script>