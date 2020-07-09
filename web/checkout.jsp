<%@ page import="com.homework.domain.Item" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: suraj
  Date: 7/8/20
  Time: 7:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout</title>
    <style><%@include file="/WEB-INF/css/checkout.css"%></style>
</head>
<body>
<div class="header-div">
    <a href="?help=true">Help</a>
    <a href="?logout=true">Logout</a>
</div>
<form method="POST" action="/HomeworkWebService_war_exploded/home">
    <input type="hidden" name="page" value="items.jsp">
    <table class="items-table">
        <tr>
            <th>Cart Summery</th>
        </tr>
        <%
            List<Item> itemList=(List<Item>) request.getAttribute("itemList");
            List<String> quantities=(List<String>) session.getAttribute("quantities");
            for(Item eachItem:itemList){
                String id=eachItem.getId()+"";
        %>

        <tr>
            <td><input type="checkbox" name="items-checkbox" value="<%=eachItem.getId()%>" <%=checked?"checked":""%>></td>
            <td><%=eachItem.getName()%></td>
            <td>$ <%=eachItem.getPrice()%></td>
            <td><input type="number" name="items-quantities" value=<%=checked?quantities.get(Integer.parseInt(id)-1):"0"%>></td>
        </tr>

        <%}%>
    </table>
    <div class="button-class">
        <input type="submit" value="Add To Cart" name="action">
        <input type="submit" value="Checkout" name="action">
    </div>
</form>
</body>
</html>
