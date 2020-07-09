<%@ page import="com.homework.domain.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: suraj
  Date: 7/8/20
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Items Page</title>
    <style><%@include file="/WEB-INF/css/items.css"%></style>
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
                <th>Select</th><th>Item Name</th><th>Unit Price</th><th>Quantity</th>
            </tr>
            <%
                List<Item> items=(List<Item>) request.getAttribute("itemsList");
                List<String> quantity=null;

                List<String> checkedItems=null;
                try{
                    quantity=(List<String>) session.getAttribute("itemsQuantity");
                    checkedItems=(List<String>) session.getAttribute("checkedItems");
                }catch (Exception e){quantity=null;checkedItems=null;}
                int index=0;
                for(Item eachItem:items){
                    int itemId=eachItem.getId();
                    boolean checked=quantity!=null && Integer.parseInt(quantity.get(index))>0 && checkedItems!=null && checkedItems.contains(itemId+"");
            %>

            <tr>
                <td><input type="checkbox" name="items-checkbox" value="<%=itemId%>" <%=checked?"checked":""%>></td>
                <td><%=eachItem.getName()%></td>
                <td>$ <%=eachItem.getPrice()%></td>
                <td><input type="number" name="items-quantities" value=<%=checked?quantity.get(index):"0"%>></td>
            </tr>

                <%index++;
                }%>
        </table>
        <div class="button-class">
            <input type="submit" value="Add To Cart" name="action" id="addToCart">
            <input type="submit" value="Checkout" name="action">
        </div>
    </form>
    <script>
        document.querySelector("#addToCart").addEventListener("click",(event)=>{
            alert("Items added to cart successfully.");
        })
    </script>

</body>
</html>
