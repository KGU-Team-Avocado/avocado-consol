<%--
  Created by IntelliJ IDEA.
  User: ellie
  Date: 2021-11-10
  Time: 오후 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String information = (String)request.getAttribute("information"); %>
<%@include file="../main/header.jsp"%>
<script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
<div class="main-wrapper ">
    <section class="page-title bg-1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block text-center">
                        <h1 class="text-capitalize mb-4 text-lg">정보페이지</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section blog-wrap bg-gray">
        <div class="container">
            <div id="information"></div>
            <div id="button"></div>
        </div>
    </section>
</div>
<%@include file="../main/footer.jsp"%>

<script>
    let info = $('#information')
    let button = $('#button')
    let text = <%=information%>;
    $(document).ready(function (){
        makeInformation();
    })
    function makeInformation(){
        let user = <%=user%>;
        info.append(text.content);
        if(user.type =="전체관리자"){
            button.append('<button onclick="modifyInformation()" type="button" class="btn btn-primary">수정</button>')

        }
    }
    function modifyInformation(){
        info.html('<textarea id="modifyInformationContent">'+text.content+'</textarea>');
        CKEDITOR.replace('modifyInformationContent', {
            allowedContent: true,
            height: 500,
            'filebrowserUploadUrl': 'Uploader'
        });
        button.html('<button onclick="saveInformation()" type="button" class="btn btn-primary">저장</button>')
    }

    function saveInformation() {
        let newText = CKEDITOR.instances.modifyInformationContent.getData();
        let data = newText + "-/-/-" + text.id;
        $.ajax({
                url:"ajax.avocado",
                type : "POST",
                data:{
                    req : "saveInformation",
                    data : data
                },
                success : function(data){
                    alert(data);
                    location.reload();

                }
            }
        )
    }

</script>
