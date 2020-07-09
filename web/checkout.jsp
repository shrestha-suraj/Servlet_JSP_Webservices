<%@ page import="com.homework.domain.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %><%--
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
    <input type="hidden" name="page" value="checkout.jsp">
    <table class="items-table">
        <tr  style="width: 100%">
            <th colspan="4">Cart Summery</th>
        </tr>
        <tr>
            <th>Item Name</th>
            <th>Unit Price</th>
            <th>Quantity</th>
            <th>Sale Price</th>
        </tr>
        <%
            List<Item> items=(List<Item>) request.getAttribute("itemsList");
            List<String> quantity=null;
            List<String> checkedItems=null;
            DecimalFormat df=new DecimalFormat("#.##");
            double sum=0.0;
            try{
                quantity=(List<String>) session.getAttribute("itemsQuantity");
                checkedItems=(List<String>) session.getAttribute("checkedItems");
            }catch (Exception e){quantity=null;checkedItems=null;}
            int index=0;
            for(Item eachItem:items){
                int itemId=eachItem.getId();
                boolean inCart=quantity!=null && Integer.parseInt(quantity.get(index))>0 && checkedItems!=null & checkedItems.contains(itemId+"");
                if(inCart){
                    double salePrice=Integer.parseInt(quantity.get(index))*eachItem.getPrice();
                    sum+=salePrice;
        %>

        <tr>
            <td><%=eachItem.getName()%></td>
            <td>$ <%=eachItem.getPrice()%></td>
            <td><%=quantity.get(index)%></td>
            <td>$ <%=df.format(salePrice)%></td>
        </tr>

        <%}
            index++;
            }%>
        <tr>
            <td colspan="3">Total</td>
            <td>$ <%=df.format(sum)%></td>
        </tr>
    </table>
    <div class="button-class">
        <input type="submit" value="Back To Cart" name="action">
        <input type="submit" value="Checkout" name="action">
    </div>
</form>
</body>
</html>
