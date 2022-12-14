<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<!-- Write your name and matric number here -->

<head>
<meta charset="ISO-8859-1">
    <title>Cust Payment</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>

.tbl{
	width: 100%;
	color:#008080;
	font-weight: 600;
	background-color: #50f9f661;
	border: 1px solid #008080;
	margin-top: 1.5em;
	margin-bottom: 1em;
}

        .btn{
            transition: all .5s ease;
            width: 30%;
            border-radius: 30px;
            color:#008080;
            font-weight: 600;
            background-color: #fff;
            border: 1px solid #008080;
            margin-top: 1.5em;
            margin-bottom: 1em;
        }
        .btn:hover, .btn:focus{
            background-color: #008080;
            color:#fff;
        }
        th{
        	background-color: #60ccb4;
        }
        .name{
        	text-transform: capitalize;
        }
        </style>
    </head>

<body>
    <div class="container-fluid">
        <h3>Breath Shield Inc.</h3>
        <h5>Payment</h5>
                <form method="post" action="PaymentServlet">
            <div class="col-lg-5">
                <h4>Customer Name : <label class="name" style="color:red;"><%
                					String name = (String)session.getAttribute("fullname") ;
                					out.print(name);%></label></h4>
					<table class="table table-dark tbl">
					<tr>
					<th>Item</th>
					<th>Size</th>
					<th>Quantity</th>
					<th>Price</th>
					</tr>
					<%
						response.setContentType("text/html");
						
						String KN95Chkbox = (String)session.getAttribute("KN95Chkbox");
						String P95Chkbox = (String)session.getAttribute("P95Chkbox");
						String sizeKN95= (String)session.getAttribute("sizeKN95");
						String sizeP95 = (String)session.getAttribute("sizeP95");
						String KN95Quantity = (String)session.getAttribute("KN95Quantity");
						String P95Quantity = (String)session.getAttribute("P95Quantity");
						
						String kn95price = (String)session.getAttribute("kn95price");
						String p95price = (String)session.getAttribute("p95price");
						String total = (String)session.getAttribute("Total");
						String ageDisc = (String)session.getAttribute("AgeDisc");
						String memDisc = (String)session.getAttribute("MemDisc");
						String totalDisc = (String)session.getAttribute("TotalDisc");
						String pay = (String)session.getAttribute("Pay");
						
						if(KN95Chkbox != null){
							out.print("<tr><td>KN95</td><td>" + sizeKN95 +
									"</td><td>" + KN95Quantity + "</td><td>" + kn95price
									+ "</td><tr>");
						}
						
						if(P95Chkbox != null){
							out.print("<tr><td>P95</td><td>" + sizeP95 +
									"</td><td>" + P95Quantity + "</td><td>" + p95price
									+ "</td><tr>");
						}
					%>
					</table>
					<%-- <%
						System.out.printf("Total Amount: $%.2f\n",total);
						out.printf("10% Senior Citizen (Age 65 years and above) Discount: $%.2f\n",ageDisc);
						out.printf("5% Platinum Member Discount: $%.2f\n", memDisc);
						out.printf("Total Discount: $%.2f\n",totalDisc);
						out.printf("Amount to Pay: $%.2f\n",pay);
					%> --%>
					Total Amount: <label style="color:red;">$<%=total %></label><br>
					10% Senior Citizen (Age 65 years and above) Discount: <label style="color:red;">$<%=ageDisc %></label><br>
					5% Platinum Member Discount: <label style="color:red;">$<%=memDisc %></label><br>
					Total Discount: <label style="color:red;">$<%=totalDisc %></label><br>
					Amount to Pay: <label style="color:red;">$<%=pay %></label><br>

            <div class="form-group>">
                <label for="payment">Payment Method : </label>
                
                    <select required name="payment">
                        <option value="" disabled selected>Select your payment method...</option>
                        <option value="online banking">Online Banking</option>
                        <option value="card">Credit/Debit Card</option>
                        <option value="e-wallet">E-Wallet</option>
                    </select>
                
                <br><br>
            </div>
            <input class="btn" type="submit" value="confirm payment" name="orderBtn" />

        </form>
    </div>
</body>

</html>