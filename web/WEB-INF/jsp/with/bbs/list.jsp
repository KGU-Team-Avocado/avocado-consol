<%--
  Created by IntelliJ IDEA.
  User: ellie
  Date: 2021-11-10
  Time: 오후 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String getBBSList = (String)request.getAttribute("getBBSList");
%>
<%@include file="../main/header.jsp"%>
<div class="main-wrapper ">
    <section class="page-title bg-1">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block text-center">
                        <h1 class="text-capitalize mb-4 text-lg">게시판</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section blog-wrap bg-gray">
        <div class="container">
            <div id="tableSpace"></div>
<%--            <table class="table" id="table1" data-toggle="table"--%>
<%--                   data-pagination="true" data-toolbar="#toolbar"--%>
<%--                   data-search="true" data-side-pagination="true" data-click-to-select="true" data-height="600"--%>
<%--                   data-page-size="10"--%>
<%--                   data-page-list="[10,20,30]">--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th data-field="id" data-sortable="false">번호</th>--%>
<%--                    <th data-field="title" data-sortable="false">제목</th>--%>
<%--                    <th data-field="writer_name" data-sortable="false">글쓴이</th>--%>
<%--                    <th data-field="last_modified" data-sortable="false">작성일</th>--%>
<%--                    <th data-field="views" data-sortable="false">조회수</th>--%>
<%--                    &lt;%&ndash;            <th data-field="likes" data-sortable="true">추천</th>&ndash;%&gt;--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--            </table>--%>
        </div>
    </section>
</div>
<%@include file="../main/footer.jsp"%>


<script>
    $(document).ready(function (){
        tableData();
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
    function tableData(){
        var bbsList = <%=getBBSList%>;
        var tableSpace = $("#tableSpace");
        var tableData = '';
        for(var i=0;i<bbsList.length;i++){
            var bbs=bbsList[i];
            var url = 'bbs.avocado?mode=view'+'&&id='+bbs.id;
            tableData += '<div><a href="'+url+'">'+bbs.id+'</a>'
            tableData += '<a href="'+url+'">'+bbs.title+'</a>'
            tableData += '<a href="'+url+'">'+bbs.writer_name+'</a>'
            tableData += '<a href="'+url+'">'+formatDate(bbs.date)+'</a>'
            tableData += '<a href="'+url+'">'+bbs.view+'</a></div>'
        }
        tableSpace.html(tableData);
    }
    <%--function makeList(){--%>
    <%--    $('#table1').bootstrapTable('load',tableData());--%>
    <%--    $('#table1').bootstrapTable('refresh');--%>
    <%--}--%>

    <%--function tableData(){--%>
    <%--    $('#table1').DataTable();--%>
    <%--    var bbsList = <%=getBBSList%>;--%>
    <%--    var rows = [];--%>
    <%--    if(bbsList!=null){--%>
    <%--        for(var i=0;i<bbsList.length;i++){--%>
    <%--            var bbs=bbsList[i];--%>
    <%--            var url = 'bbs.avocado?mode=view'+'&&id='+bbs.id;--%>
    <%--            rows.push({--%>
    <%--                id: '<a href="'+url+'">'+bbs.id+'</a>',--%>
    <%--                title: '<a href="'+url+'">'+bbs.title+'</a>',--%>
    <%--                writer_name: '<a href="'+url+'">'+bbs.writer_name+'</a>',--%>
    <%--                last_modified: '<a href="'+url+'">'+formatDate(bbs.date)+'</a>',--%>
    <%--                views: '<a href="'+url+'">'+bbs.view+'</a>',--%>
    <%--            });--%>
    <%--        }--%>
    <%--    }--%>
    <%--    return rows;--%>
    <%--}--%>

</script>