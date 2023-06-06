
<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Start Simple Web</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <!-- <link href="css/login.css" rel="stylesheet"> -->
    <link href="${pageContext.request.contextPath}/resources/css/clean-blog.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link
            href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
            rel="stylesheet" type="text/css">
    <link
            href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
            rel='stylesheet' type='text/css'>
    <link
            href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
            rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!--jquery-->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script>
        $(function(){
            $("a#signup").click(function(){

                var id = $("input#signid").val(); //id
                var name = $("input#signname").val(); //name
                var pass = $("input#signpass").val(); //pass
                var repass = $("input#signrepass").val(); //pass chk


                if(id.length == 0){
                    alert("id를 입력 하세요");
                    $("input#signid").focus();
                    return false;
                }else if(name.length == 0){
                    alert("name을 입력하세요");
                    $("input#signname").focus();
                    return false;
                }else if(!(pass == repass)){
                    //비밀번호가 다를때
                    alert("입력하신 두개의 비밀번호가 일치하지 않습니다.");
                    $("input#signpass").focus();
                    return false;
                }else{
                    $('#signform').submit();
                }
                })
            }); //여기까지 signup 클릭


    </script>
</head>
<body style="background-image: url(${pageContext.request.contextPath}/resources/img/back.jpg)">



<div class="container" style="margin-top: 120px">
    <div class="row">
        <div class="main">
            <h3>
                SAMPLE SIGN UP</a>

            </h3>

            <form role="form" name="signform" id ="signform" action="/usersignup" method="post">
                <div>
                    <div class="form-group"> <%--아이디--%>
                        <input type="text" placeholder="아이디 또는 이메일" class="form-control"
                               id="signid" name="signid"/>

                    </div>
                    <div class="form-group"><%--이름--%>
                        <input type="text" placeholder="이름(별명)" class="form-control"
                               id="signname" name="signname"/>

                    </div>
                    <div class="form-group"><%--비밀번호--%>
                        <input type="text" placeholder="비밀번호" class="form-control"
                               id="signpass" name="signpass"/>

                    </div>
                    <div class="form-group"><%--비밀번호--%>
                        <!--<a class="pull-right" href="#">Esqueci a senha</a>-->
                        <input type="password" placeholder="비밀번호 확인" class="form-control"
                               id="signrepass" name="signrepass"/>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <a class="btn btn-sm btn-info btn-block" id="signup">SIGN UP</a>
                            <a class="btn btn-sm btn-info btn-block" href="/login">로그인</a>

                        </div>
                    </div>
                    <h6 style="font-weight: 400;font-size: 0.85714rem; color: gray " align="center">
                        회원가입을 클릭함으로써 <u><br>
                        <a href="#">사용약관</a> </u> 및 <u> <a href="#">개인정보취급방침</a> </u> 에 동의합니다.
                    </h6>
                </div>
            </form>
        </div>
    </div>
</div>

</body>

</html>