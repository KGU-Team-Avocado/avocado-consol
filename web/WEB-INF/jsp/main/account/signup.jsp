<%--
  Created by IntelliJ IDEA.
  User: gabri
  Date: 2021-11-07
  Time: 오후 3:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/theme/main/js/sha256.js"></script>
    <title>Title</title>
</head>
<body>
<%@include file="../../test/test_header.jsp"%>
<div class="container">
<div class="row g-3 needs-validation" novalidate>
    <div class="col-md-4">
        <label for="id" class="form-label">id</label>
        <input type="text" class="form-control" id="id" value="Mark" required>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
    <div class="col-md-4">
        <label for="password" class="form-label">password</label>
        <input type="password" class="form-control" id="password" value="Otto" required>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
    <div class="col-md-4">
        <label for="name" class="form-label">name</label>
        <div class="input-group has-validation">
            <span class="input-group-text" id="inputGroupPrepend">@</span>
            <input type="text" class="form-control" id="name" aria-describedby="inputGroupPrepend" required>
            <div class="invalid-feedback">
                Please choose a username.
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <label for="Birthday" class="form-label">Birthday</label>
        <input type="date" class="form-control" id="Birthday" required>
        <div class="invalid-feedback">
            Please provide a valid city.
        </div>
    </div>
    <div class="col-md-3">
        <label for="gender" class="form-label">gender</label>
        <select class="form-select" id="gender" required>
            <option selected disabled value="">Choose...</option>
            <option>남</option>
            <option>여</option>
        </select>
        <div class="invalid-feedback">
            Please select a valid state.
        </div>
    </div>
    <div class="col-md-6">
        <label for="email" class="form-label">e-mail</label>
        <input type="text" class="form-control" id="email" required>
        <div class="invalid-feedback">
            Please provide a valid city.
        </div>
    </div>
    <div class="col-md-6">
        <label for="phone" class="form-label">phone</label>
        <input type="text" class="form-control" id="phone" required>
        <div class="invalid-feedback">
            Please provide a valid city.
        </div>
    </div>
    <div class="col-md-3">
        <label for="type" class="form-label">type</label>
        <select class="form-select" id="type" required>
            <option selected disabled value="">Choose...</option>
            <option></option>
            <option>여</option>
        </select>
        <div class="invalid-feedback">
            Please select a valid state.
        </div>
    </div>
    <div class="col-md-6">
        <label for="image" class="form-label">image</label>
        <input type="text" class="form-control" id="image" required>
        <div class="invalid-feedback">
            Please provide a valid city.
        </div>
    </div>
    <div class="col-md-6">
        <label for="home" class="form-label">home</label>
        <input type="text" class="form-control" id="home" required>
        <div class="invalid-feedback">
            Please provide a valid city.
        </div>
    </div>
    <button class = "btn btn-success" onclick="signup()">회원가입하기</button>
</div>
</div>
<%@include file="/WEB-INF/jsp/test/test_footer.jsp"%>
</body>

<script>
    function signup(){
        let id = $('#id').val();
        let password = $('#password').val();
        let forsha = id+password;
        let hashcode = SHA256(forsha);
        let name = $('#name').val();
        let Birthday = $('#Birthday').val();
        let gender = $('#gender').val();
        let email = $('#email').val();
        let phone = $('#phone').val();
        let type = $('#type').val();
        let image = $('#image').val();
        let home = $('#home').val();
        let time = new Date();
        let text = id+'-/-/-'+hashcode+'-/-/-'+name+'-/-/-'+Birthday+'-/-/-'+gender+'-/-/-'+email+'-/-/-'+phone+'-/-/-'+type+'-/-/-'+image+'-/-/-'+home+'-/-/-'+time;
        $.ajax({
                url:"ajax.avocado",
                type : "POST",
                data:{
                    req : "signup",
                    data : text
                },
                success : function(data){
                    alert(data);
                    location.href='main.avocado';
                }
            }
        )
    }
</script>
</html>
