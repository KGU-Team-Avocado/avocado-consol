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
<%--<script src="/theme/with/js/ckeditor.js"></script>--%>
<script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
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

<script>
    //뒤로가기로 업로드 페이지 접근할 수 없도록 막음
    window.history.forward();
    function noBack() {
        window.history.forward();
    }

    <%--var major = <%=major%>;--%>
    <%--var num = <%=num%>;--%>
    <%--var id = <%=id%>;--%>
    <%--var user = <%=user%>;--%>
    <%--var type = <%=type%>;--%>

    CKEDITOR.replace('bbsUpdateContent', {
        allowedContent: true,
        height: 500,
        'filebrowserUploadUrl': 'Uploader'
    });

    function insertBbs(){
        var title = $('#bbsTitle').val();
        if(title.length == 0){
            swal.fire({
                title : '제목을 입력해주세요',
                icon : 'warning',
                showConfirmButton: true
            });
            return;
        }
        if(title.length > 200){
            swal.fire({
                title : '제목은 200자 이하로 작성하여 주시기바랍니다.',
                icon : 'warning',
                showConfirmButton: true
            });
            return;
        }
        var text = CKEDITOR.instances.bbsUpdateContent.getData();
        if(text.length == 0){
            swal.fire({
                title : '내용을 입력해주세요',
                icon : 'warning',
                showConfirmButton: true
            });
            return;
        }
        var writer_id = user.id;
        var writer_name = user.name;
        var last_modified = formatDate(new Date());
        var data = major+"-/-/-"+writer_id+"-/-/-"+writer_name+"-/-/-"+title+"-/-/-"+num+"-/-/-"+last_modified+"-/-/-"+text;
        $.ajax({
            url: 'ajax.kgu',
            type: 'post',
            data: {
                req: "insertBbs",
                data: data
            },
            success: function (data) {
                console.log("error : "+data);
                if (data == 'success') {
                    swal.fire({
                        title : '내용이 추가되었습니다.',
                        icon : 'success',
                        showConfirmButton: true

                    }).then(function (){
                        location.href = 'bbs.kgu?major=' + major + '&&num=' + num + '&&mode=list';
                    });
                } else
                    swal.fire({
                        title : '서버에러',
                        text : '다음에 다시 시도해주세요',
                        icon : 'error',
                        showConfirmButton: true

                    });
            }
        })
    }


    function modifyBbs(){
        var bbs_id = getBBS.id;
        var title = $('#bbsTitle').val();
        if(title.length == 0){
            swal.fire({
                title : '제목을 입력해주세요',
                icon : 'warning',
                showConfirmButton: true
            });
            return;
        }
        if(title.length > 200){
            swal.fire({
                title : '제목은 200자 이하로 작성하여 주시기바랍니다.',
                icon : 'warning',
                showConfirmButton: true
            });
            return;
        }
        var text = CKEDITOR.instances.bbsUpdateContent.getData();
        if(text.length == 0){
            swal.fire({
                title : '내용을 입력해주세요',
                icon : 'warning',
                showConfirmButton: true
            });
            return;
        }
        var writer_id = user.id;
        var writer_name = user.name;
        var last_modified = formatDate(new Date());
        var data = bbs_id+"-/-/-"+major+"-/-/-"+writer_id+"-/-/-"+writer_name+"-/-/-"+title+"-/-/-"+num+"-/-/-"+last_modified+"-/-/-"+text;

        $.ajax({
            url: "ajax.kgu", //AjaxAction에서
            type: "post", //post 방식으로
            data: {
                req: "modifyBbs", //이 메소드를 찾아서
                data: data //이 데이터를 파라미터로 넘겨줍니다.
            },
            success: function (data) { //성공 시
                if(data=='success'){
                    swal.fire({
                        title : '해당 내용이 수정되었습니다.',
                        icon : 'success',
                        showConfirmButton: true
                    }).then(function (){
                        window.location.href = 'bbs.kgu?major='+major+'&&num='+num+'&&mode=view&&id='+id;
                    });
                }
                else{
                    swal.fire({
                        title : '권한이 부족합니다.',
                        icon : 'error',
                        showConfirmButton: true

                    });
                }
            }
        })
    }

    function back(){
        $.ajax({
            url: "ajax.kgu", //AjaxAction에서
            type: "post", //post 방식으로
            data: {
                req: "deleteNotUploadedFile", //이 메소드를 찾아서
                data: '/uploaded/bbs' //이 데이터를 파라미터로 넘겨줍니다.
            },
            success: function (data) { //성공 시
                if(data=='success'){
                    swal.fire({
                        title : '뒤로가기',
                        text : '올렸던 글과 파일들은 저장되지 않습니다!',
                        icon : 'error',
                        showConfirmButton: true
                    }).then(function () {
                        window.location.href = 'bbs.kgu?major='+major+'&&num='+num+'&&mode=list';
                    });
                }
                else{
                    swal.fire({
                        title : '서버에러',
                        text : '다음에 다시 시도해주세요',
                        icon : 'error',
                        showConfirmButton: true
                    });
                }
            }
        })
    }

    history.pushState(null, null, location.href);

    window.onpopstate = function(event) { //뒤로가기 이벤트 발생시
        history.go(1); //뒤로 가지 않고 현재 페이지에서 머물어 업로드 되지 못한 파일 삭제 후 리스트 페이지로 감
        back();
    };

    function formatDate(date) { //날짜를 yyyy-mm-dd 형식으로 반환
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [year, month, day].join('-');
    }

    var file_id; //나중에 파일 상세정보를 uploadedFile로부터 역참조 하고싶은 경우에 사용하라고 만들어둠 (다운로드에서 사용하는 기능)
    var file_folder; //다운로드에서 쓸 경로
    var file_path; //파일이 업로드된 상대경로


    var upload_folder = '/uploaded/bbs';
    $("#bbsFile").fileinput({
        uploadUrl: 'upload.kgu?folder='+upload_folder,
        uploadExtraData:{
            file_type : 'null',
            board_level : '1',
            upload_mode : 'bbs',
        },
        showUpload : false, // 일괄 업로드버튼 숨김
        showRemove : false, // 일괄 삭제 버튼 숨김
        fileActionSettings : {showZoom: false}, // 줌 못보게 막음(모달이 안닫히는 오류가 있어서)
        overwriteInitial : false,
        preferIconicPreview: true,
        previewFileIconSettings: { // configure your icon file extensions
            'doc': '<i class="bi bi-file-earmark-word-fill text-primary"></i>',
            'hwp': '<i class="bi bi-file-earmark-richtext-fill text-primary"></i>',
            'xls': '<i class="bi bi-file-earmark-excel-fill text-success"></i>',
            'ppt': '<i class="bi bi-file-earmark-ppt-fill text-danger"></i>',
            'pdf': '<i class="bi bi-file-earmark-pdf-fill text-danger"></i>',
            'zip': '<i class="bi bi-file-earmark-zip-fill text-muted"></i>',
            'htm': '<i class="bi bi-file-earmark-code-fill text-info"></i>',
            'txt': '<i class="bi bi-file-earmark-text-fill text-info"></i>',
            'mov': '<i class="bi bi-file-earmark-play-fill text-warning"></i>',
            'mp3': '<i class="bi bi-file-earmark-play-fill text-warning"></i>',
            'jpg': '<i class="bi bi-file-earmark-image-fill text-danger"></i>',
            'gif': '<i class="bi bi-file-earmark-image-fill text-muted"></i>',
            'png': '<i class="bi bi-file-earmark-image-fill text-primary"></i>'
        },
        previewFileExtSettings: { // configure the logic for determining icon file extensions
            'doc': function(ext) {
                return ext.match(/(doc|docx)$/i);
            },
            'hwp': function(ext) {
                return ext.match(/(hwp)$/i);
            },
            'xls': function(ext) {
                return ext.match(/(xls|xlsx)$/i);
            },
            'ppt': function(ext) {
                return ext.match(/(ppt|pptx)$/i);
            },
            'zip': function(ext) {
                return ext.match(/(zip|rar|tar|gzip|gz|7z)$/i);
            },
            'htm': function(ext) {
                return ext.match(/(htm|html)$/i);
            },
            'txt': function(ext) {
                return ext.match(/(txt|ini|csv|java|php|js|css)$/i);
            },
            'mov': function(ext) {
                return ext.match(/(avi|mpg|mkv|mov|mp4|3gp|webm|wmv)$/i);
            },
            'mp3': function(ext) {
                return ext.match(/(mp3|wav)$/i);
            }
        }
    }).on('filedeleted', function() {
        swal.fire({
            title : '파일이 삭제되었습니다.',
            icon : 'success',
            showConfirmButton: true
        })
    });
</script>
</html>