<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a> <br>
<h1><a href="${pageContext.request.contextPath}/login">Go - Login</a></h1>
<h1><a href="${pageContext.request.contextPath}/signup">test</a> </h1>
</body>
</html>