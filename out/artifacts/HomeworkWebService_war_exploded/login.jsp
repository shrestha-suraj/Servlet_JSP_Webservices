<%--
  Created by IntelliJ IDEA.
  User: suraj
  Date: 7/7/20
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <style><%@include file="/WEB-INF/css/login.css"%></style>
</head>
<body>
    <form method="POST" action="/home">
        <div>
            <label for="username">Username: </label>
            <input type="text" name="username">
        </div>

        <label for="password">Password: </label>
        <input type="password" name="password">
        <input type="submit" name="form_button" value="login">
        <input type="reset" value="reset">
        <input type="hidden" name="page" value="login.jsp">
    </form>
</body>
</html>
