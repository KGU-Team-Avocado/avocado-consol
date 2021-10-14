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
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="cards"></div>
        </div>
    </div>

    <!-- Modal start -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" id="modalTitle"></div>
                <div class="modal-body" id="modalBody"></div>
                <div class="modal-footer" id="modalFooter"></div>
            </div>
        </div>
    </div>
    <!-- Modal end -->

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
                +'<button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href=\'test_content.avocado?oid='+data[i].oid+'\'">View</button>'
                +'<button type="button" class="btn btn-sm btn-outline-danger" onclick="deleteData('+data[i].oid+')">삭제</button>'
                // +'<button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href=\'test_modify.avocado">수정</button>'
                +'<button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="makeModifyModalData('+i+')">수정 </button>'
                +'</div>'
                +'<small class="text-muted">9 mins</small>'
                +'</div></div></div></div>';
        }
        card.append(text);
    }

    function makeModifyModalData(i){
        let data = <%=test_data%>;

        //모달 타이틀을 꾸미기
        let modalTitle = $('#modalTitle');
        let title='';
        title+='<h5 class="modal-title" id="exampleModalLabel">'+data[i].title+'님의 데이터 수정</h5>'
            +'<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>'
        modalTitle.html(title);
        //.append()는 뒤에 이어붙이기 이지만 .html()은 초기화 후 붙이기 입니다. 참고로 .prepend()는 앞에 이어붙이기 입니다.

        //모달 바디를 꾸미기
        let modalBody = $('#modalBody');
        let body='';
        body+='<div class="form-floating mb-3">'
            +'<input type="text" class="form-control" id="modifyOID" placeholder="oid" value="'+data[i].oid+'" readonly>'
            +'<label for="modifyOID">oid</label>'
            +'</div>';
        body+='<div class="form-floating mb-3">'
            +'<input type="text" class="form-control" id="modifyTitle" placeholder="이름" value="'+data[i].title+'">'
            +'<label for="modifyTitle">이름</label>'
            +'</div>';
        body+='<div class="form-floating mb-3">'
            +'<input type="text" class="form-control" id="modifyDescription" placeholder="설명" value="'+data[i].description+'">'
            +'<label for="modifyDescription">설명</label>'
            +'</div>';
        body+='<div class="form-floating mb-3">'
            +'<input type="text" class="form-control" id="modifyImageURL" placeholder="이미지 경로" value="'+data[i].image_url+'">'
            +'<label for="modifyImageURL">이미지 경로</label>'
            +'</div>';
        modalBody.html(body);

        //모달 푸터를 꾸미기
        let modalFooter = $('#modalFooter');
        let footer='';
        footer+='<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>'
            +'<button type="button" class="btn btn-primary" onclick="modifyData()">수정하기</button>';
        modalFooter.html(footer);
    }

    function modifyData(){
        let oid = $('#modifyOID').val();
        let title = $('#modifyTitle').val();
        let description = $('#modifyDescription').val();
        let image_url = $('#modifyImageURL').val();
        let data = oid+'-/-/-'+title+'-/-/-'+description+'-/-/-'+image_url
        alert('jQuery가 읽어들인 데이터는 '+data+'입니다.');
        $.ajax({
            url:"test_ajax.avocado",
            type:"post",
            data:{
                req: "modifyData",
                data: data
            },
            success: function (result){
                alert(result);
                location.reload();
            }
        })
    }

    function deleteData(oid){
        alert('삭제될 번호는'+oid+'번 입니다.');
        $.ajax({
            url:"test_ajax.avocado",
            type:"post",
            data:{
                req: "deleteData",
                data: oid
            },
            success: function (result){
                if(result=='삭제성공'){
                    alert('삭제되었습니다.');
                    location.reload();
                }
            }
        })

    }

</script>
</html>
