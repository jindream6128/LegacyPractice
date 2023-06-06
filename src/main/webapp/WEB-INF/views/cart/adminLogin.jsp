<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>관리자</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=10" />
    <meta http-equiv="imagetoolbar" content="no" />
    <meta name="copyright" content="Copyright 2009 @ high1 all rights reserved" />
    <link href="${pageContext.request.contextPath}/resources/login/css/contents.css" rel="stylesheet" type="text/css"/>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
        $(function(){
            $("input#checker").attr('checked','${idCook}'!='');//쿠키생성 여부 확인 체크
            $("img#btnSubmit").click(function(){
                //유효성 검사
                $("form").submit();

            });
        });
    </script>
</head>
<body>
<form name="login" method="post" action="${pageContext.request.contextPath}/loginCheck">
    <div id="loginWrapper">
        <div class="loginForm">
            <fieldset>
                <legend>관리자 시스템 로그인</legend>
                <dl>
                    <dt><img src="${pageContext.request.contextPath}/resources/login/img/common/th_id.gif" alt="아이디" /></dt>
                    <dd><input type="text" name="id" class="text" id="user_id" value="${idCook}" /></dd>

                    <dt><img src="${pageContext.request.contextPath}/resources/login/img/common/th_pw.gif" alt="비밀번호" /></dt>
                    <dd><input type="password" name="password" class="text" id="user_passwd" /></dd>
                </dl>

                <div class="btn">
                    <img id="btnSubmit" src="${pageContext.request.contextPath}/resources/login/img/button/btn_login.gif" alt="LOGIN" title="LOGIN"  />
                </div>


                <div class="saveId"><input type="checkbox" id="checker" name="checker" />
                    <img src="${pageContext.request.contextPath}/resources/login/img/common/save_id.gif" alt="아이디 저장" />
                    <a href="/gosignup">&emsp;&emsp;회원가입</a>
                </div>

            </fieldset>
        </div>
    </div>
</form>
</body>
</html>





