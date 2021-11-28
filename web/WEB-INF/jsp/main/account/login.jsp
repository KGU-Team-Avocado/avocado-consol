<%--
  Created by IntelliJ IDEA.
  User: gykim
  Date: 2021-07-05
  Time: 오후 6:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>

    <%--        암호화--%>
    <script src="/theme/main/js/sha256.js"></script>

    <script>
        document.cookie.split(";").forEach(function(c) { document.cookie = c.replace(/^ +/, "").replace(/=.*/, "=;expires=" + new Date().toUTCString() + ";path=/"); });
        function letsSubmit() {
            if($('#id').val() != '' && $('#password').val() != ''){
                doSha();
                $('#login_form').submit();
            }
            else{
                alert("빈 칸을 입력해주세요");
            }
        }

        function doSha(){
            var forsha = $('#id').val() + $('#password').val();
            $('#password_hash').val(SHA256(forsha));
        }
    </script>
        <script>
            function onSignIn(googleUser) {
                var profile = googleUser.getBasicProfile();
                console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
                console.log('Full Name: ' + profile.getName());
                console.log('Given Name: ' + profile.getGivenName());
                console.log('Family Name: ' + profile.getFamilyName());
                console.log('Image URL: ' + profile.getImageUrl());
                console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
                var id_token = googleUser.getAuthResponse().id_token;
                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'googleLogin.avocado');
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onload = function () {
                    // console.log('Signed in as: ' + xhr.responseText);
                    if (xhr.responseText == 'success'){
                        window.location.href = 'main.avocado';
                    }
                    else if (xhr.responseText == 'register'){
                        window.location.href = 'signup.avocado'
                    }
                    else {
                        alert("잘못된 정보");
                    }
                };
                xhr.send('idtoken=' + id_token);
            }
        </script>


        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0">
    <%--    Bootstrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <%--    jQuery--%>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <%--    Bootstrap Table--%>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css">
    <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>

    <meta name="theme-color" content="#7952b3">
        <!-- content에 자신의 OAuth2.0 클라이언트ID를 넣습니다. -->
        <meta name="google-signin-client_id"
              content="470641167664-66ck3v2987td9ok4tdrji3vong8iv94i.apps.googleusercontent.com">
        <script src="https://apis.google.com/js/platform.js" async defer></script>


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: auto;
        }

        .form-signin .checkbox {
            font-weight: 400;
        }

        .form-signin .form-floating:focus-within {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>
<body class="text-center">

<main class="form-signin">
    <form method="POST" action="login.avocado" id="login_form">
<%--        <img class="mb-4" src="/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">--%>
        <h1 class="h3 mb-3 fw-normal">로그인</h1>

        <div class="form-floating">
            <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력하세요">
            <label for="id">아이디</label>
            <input type="submit" onclick="letsSubmit()" style="display:none">
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력하세요">
            <label for="password">비밀번호</label>
            <input type="hidden" name="password_hash" id="password_hash" class="iText" value="VALUE_NOT_EMPTY">
        </div>

        <div class="checkbox mb-3">
            <label>
                <p>
                    <span id="wrong_password">초기 비밀번호는 생년월일(6자리)입니다.</span>
                </p>
                <a href="signup.avocado">
                    <div>아직 회원가입을 안하셨나요?</div>
                </a>
            </label>
        </div>
        <div style="width: 100%">
            <a href="#" class="w-100 btn btn-lg btn-primary text-center" onclick="letsSubmit()" style = "text-decoration: none;">로그인</a>
        </div>
    <p class="mt-5 mb-3 text-muted"><a href="main.avocado">Avocado ConSol &copy; 2017–2021</a></p>
    </form>
    <%--        구글 로그인 버튼 --%>
    <div class="g-signin2 d-flex justify-content-center" data-onsuccess="onSignIn"></div>
    <%--구글 로그인 버튼 끝--%>
</main>


</body>
</html>

