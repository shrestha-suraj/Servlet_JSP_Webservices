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

    <form method="POST" action="/HomeworkWebService_war_exploded/home">
        <div>
            <label for="username">Username: </label>
            <input type="text" name="username">
        </div>

        <label for="password">Password: </label>
        <input type="password" name="password">
        <%
            String errorMessage=(String) request.getAttribute("errorMessage");
            if(errorMessage!=null){
        %>
        <span style="color:red;"><%=request.getAttribute("errorMessage")%></span>

        <%}%>
        <input type="submit" name="action" value="login">
        <input type="reset" value="reset">
        <input type="hidden" name="page" value="login.jsp">
    </form>
</body>
</html>
