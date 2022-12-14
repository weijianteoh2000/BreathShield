<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<!-- Write your name and matric number here -->

<head>
  <title>Cust Order</title>
<meta charset="ISO-8859-1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    </style>

</head>

<body>
  <div class="container">
    <form action="OrderServlet" method="post">
      <h3>Breath Shield Inc.</h3>
      <h5>Complete Your Order</h5>

      <table class="table table-dark tbl">
        <tr>
          <td> <img src="images/KN95.png" width="356" height="263" alt="KN95" /> </td>
          <td> <img src="images/P95.png" width="356" height="263" alt="P95" /></td>
        </tr>

        <tr>
          <div class="checkbox"></div>
          <td><input name="KN95Chkbox" type="checkbox" value="KN95" checked> NIOSH Approved KN95 Face Mask (50 pcs)</td>
          <td><input name="P95Chkbox" type="checkbox" value="P95" checked> 3M P95 Face Mask (50 pcs)</td>
  </div>
  </tr>

  <tr>
    <td>Select Size:
      <select required name="sizeKN95">
        <option value="" disabled selected>Select size...</option>
        <option value="kidsize">kid size</option>
        <option value="adultsize">adult size</option>
      </select>
    </td>
    <td>Select Size:
      <select required name="sizeP95">
        <option value="" disabled selected>Select size...</option>
        <option value="kidsize">kid size</option>
        <option value="adultMalesize">adult male size</option>
        <option value="adultFemalesize">adult female size</option>
      </select>
    </td>
  </tr>

  <tr>
    <div class="form-control">
      <td>Quantity: <input type="number" name="KN95Quantity" value="0" size="5" min="0" max="10"/></td>
      <td>Quantity: <input type="number" name="P95Quantity" value="0" size="5" min="0" max="10"/></td>
    </div>
  </tr>

  <tr>
    <td>
      <div style="text-align: left;">Price/Set : <br>
        Child Size : $25.00 <br>
        Adult Size : $28.00 <br>
    </td>
    <td>
      <div style="text-align: left;">Price/Set : <br>
        Child Size : $19.00 <br>
        Adult Male : $26.00 <br>
        Adult Female : $24.00 <br>
    </td>
  </tr>
  </table>

  <input class="btn" type="submit" value="Order" name="orderBtn" />
  <input class="btn" type="reset" value="Reset" name="resetBtn" />
  <br>
  </form>
  </div>
</body>

</html>