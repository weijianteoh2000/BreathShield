<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cust Invoice</title>
</head>
<body>
<h3>Breath Shield Inc.</h3>
<h5>Invoice</h5>
Customer Name : <label style="color:red;"><%=(String)session.getAttribute("fullname") %></label><br>
Amount Paid : <label style="color:red;">$<%=session.getAttribute("Pay") %></label><br>
Payment Method : <label style="color:red;"><%=(String)session.getAttribute("payment") %></label><br>
Shipping Address : <label style="color:red;"><%=(String)session.getAttribute("address") %></label><br>
</body>
</html>