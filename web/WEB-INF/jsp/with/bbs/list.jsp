<%--
  Created by IntelliJ IDEA.
  User: ellie
  Date: 2021-11-10
  Time: 오후 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String bbs_list = (String)request.getAttribute("bbs_list");
    System.out.println(bbs_list);
%>


<html>
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
            <table class="boardtable" id="table1"  data-toggle="table"
                   data-pagination="true" data-toolbar="#toolbar"
                   data-search="true" data-side-pagination="true" data-click-to-select="true" data-height="600"
                   data-page-size="10"
                   data-page-list="[10,20,30]">
                <thead>
                <tr>
                    <th data-field="id" data-sortable="false">번호</th>
                    <th data-field="title" data-sortable="false">제목</th>
                    <th data-field="writer_name" data-sortable="false">글쓴이</th>
                    <th data-field="last_modified" data-sortable="false">작성일</th>
                    <th data-field="views" data-sortable="false">조회수</th>
                    <%--            <th data-field="likes" data-sortable="true">추천</th>--%>
                </tr>
                </thead>
            </table>
        </div>
    </section>
</div>
<%@include file="../main/footer.jsp"%>
</body>
</html>


<script>
    $(document).ready(function (){
        makeList();
    })
    function formatDate(date) {  //주어진 날짜를 yyyy-mm-dd 형식으로 반환해주는 함수
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [year, month, day].join('-');
    }
    function makeList(){
        $('#table1').bootstrapTable('load',tableData());
        // $('#table1').bootstrapTable('append',data());
        $('#table1').bootstrapTable('refresh');
    }
    function tableData(){

        var bbsList = <%=bbs_list%>;
        console.log(bbsList)
        var rows = [];
        if(bbsList!=null){
            for(var i=0;i<bbsList.length;i++){
                var bbs=bbsList[i];
                var url = 'bbs.avocado?mode=view'+'&&id='+bbs.id;
                rows.push({
                    id: '<a href="'+url+'">'+bbs.id+'</a>',
                    title: '<a href="'+url+'">'+bbs.title+'</a>',
                    writer_name: '<a href="'+url+'">'+bbs.writer+'</a>',
                    last_modified: '<a href="'+url+'">'+formatDate(bbs.date)+'</a>',
                    views: '<a href="'+url+'">'+bbs.view+'</a>',
                });
            }
        }
        return rows;
    }

</script>