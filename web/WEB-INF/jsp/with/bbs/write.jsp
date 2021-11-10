<%--
  Created by IntelliJ IDEA.
  User: HappyAll
  Date: 2021-11-10
  Time: 오후 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<body>
<%@include file="../main/header.jsp"%>
<div class="main-wrapper ">
    <section class="page-title bg-1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block text-center">
                        <span class="text-white">News details</span>
                        <h1 class="text-capitalize mb-4 text-lg">Blog Single</h1>
                        <ul class="list-inline">
                            <li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
                            <li class="list-inline-item"><span class="text-white">/</span></li>
                            <li class="list-inline-item"><a href="#" class="text-white-50">News details</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <section class="section blog-wrap bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                        <div class="col-lg-12 mb-5">
                            <div class="single-blog-item">
                                <img src="images/blog/2.jpg" alt="" class="img-fluid rounded">

                                <div class="blog-item-content bg-white p-5">
                                    <h2 class="writeheader">글 작성하기</h2>
                                    <div class="h3">글 작성하기</div>
                                    <%--ckeditor가 나와야 하는 자리--%>
                                    <div class="form-group mb-3" id="bbsTitleBox"><input class="form-control" id="bbsTitle" placeholder="제목을 입력하세요. (최대 200자)"></div>
                                    <textarea id="bbsUpdateContent"></textarea>

                                    <ul class="list-group" id="alreadyFiles"></ul>
                                    <div class="file-loading">
                                        <input id="bbsFile" type="file" multiple>
                                    </div>
                                    <%--버튼이 나와야 하는 자리--%>
                                    <div id="write_post" class="mt-3 d-grid gap-2 d-flex justify-content-between">
                                        <button type="button" class="btn btn-outline-danger" onclick="back()">뒤로</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>




                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="sidebar-wrap">
                        <div class="sidebar-widget search card p-4 mb-3 border-0">
                            <input type="text" class="form-control" placeholder="search">
                            <a href="#" class="btn btn-mian btn-small d-block mt-2">search</a>
                        </div>

                        <div class="sidebar-widget card border-0 mb-3">
                            <img src="images/blog/blog-author.jpg" alt="" class="img-fluid">
                            <div class="card-body p-4 text-center">
                                <h5 class="mb-0 mt-4">Arther Conal</h5>
                                <p>Digital Marketer</p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt, dolore.</p>

                                <ul class="list-inline author-socials">
                                    <li class="list-inline-item mr-3">
                                        <a href="#"><i class="fab fa-facebook-f text-muted"></i></a>
                                    </li>
                                    <li class="list-inline-item mr-3">
                                        <a href="#"><i class="fab fa-twitter text-muted"></i></a>
                                    </li>
                                    <li class="list-inline-item mr-3">
                                        <a href="#"><i class="fab fa-linkedin-in text-muted"></i></a>
                                    </li>
                                    <li class="list-inline-item mr-3">
                                        <a href="#"><i class="fab fa-pinterest text-muted"></i></a>
                                    </li>
                                    <li class="list-inline-item mr-3">
                                        <a href="#"><i class="fab fa-behance text-muted"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="sidebar-widget latest-post card border-0 p-4 mb-3">
                            <h5>Latest Posts</h5>

                            <div class="media border-bottom py-3">
                                <a href="#"><img class="mr-4" src="images/blog/bt-3.jpg" alt=""></a>
                                <div class="media-body">
                                    <h6 class="my-2"><a href="#">Thoughtful living in los Angeles</a></h6>
                                    <span class="text-sm text-muted">03 Mar 2018</span>
                                </div>
                            </div>

                            <div class="media border-bottom py-3">
                                <a href="#"><img class="mr-4" src="images/blog/bt-2.jpg" alt=""></a>
                                <div class="media-body">
                                    <h6 class="my-2"><a href="#">Vivamus molestie gravida turpis.</a></h6>
                                    <span class="text-sm text-muted">03 Mar 2018</span>
                                </div>
                            </div>

                            <div class="media py-3">
                                <a href="#"><img class="mr-4" src="images/blog/bt-1.jpg" alt=""></a>
                                <div class="media-body">
                                    <h6 class="my-2"><a href="#">Fusce lobortis lorem at ipsum semper sagittis</a></h6>
                                    <span class="text-sm text-muted">03 Mar 2018</span>
                                </div>
                            </div>
                        </div>

                        <div class="sidebar-widget bg-white rounded tags p-4 mb-3">
                            <h5 class="mb-4">Tags</h5>

                            <a href="#">Web</a>
                            <a href="#">agency</a>
                            <a href="#">company</a>
                            <a href="#">creative</a>
                            <a href="#">html</a>
                            <a href="#">Marketing</a>
                            <a href="#">Social Media</a>
                            <a href="#">Branding</a>
                        </div>
                    </div>
                </div>
            </div>

    </section>
    <%@include file="../main/footer.jsp"%>
</div>

</body>
</html>