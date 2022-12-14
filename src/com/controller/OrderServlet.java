package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		
		String KN95Chkbox = (String)request.getParameter("KN95Chkbox");
		String P95Chkbox = (String)request.getParameter("P95Chkbox");
		String sizeKN95= (String)request.getParameter("sizeKN95");
		String sizeP95 = (String)request.getParameter("sizeP95");
		String KN95Quantity = (String)request.getParameter("KN95Quantity");
		String P95Quantity = (String)request.getParameter("P95Quantity");
		
		session.setAttribute("KN95Chkbox", request.getParameter("KN95Chkbox"));
		session.setAttribute("P95Chkbox", request.getParameter("P95Chkbox"));
		session.setAttribute("sizeKN95", request.getParameter("sizeKN95"));
		session.setAttribute("sizeP95", request.getParameter("sizeP95"));
		session.setAttribute("KN95Quantity", request.getParameter("KN95Quantity"));
		session.setAttribute("P95Quantity", request.getParameter("P95Quantity"));
		
		int age = Integer.parseInt((String)session.getAttribute("age"));
		String membership = (String)session.getAttribute("membership");
		
		session.setAttribute("AgeDisc", "0.00");
		session.setAttribute("MemDisc", "0.00");
		session.setAttribute("TotalDisc", "0.00");
		
		double total = 0.00;
		double knprice = 0.00;
		double pprice = 0.00;
		
		if(KN95Chkbox != null) {
			String size = sizeKN95;
			int quantity = Integer.parseInt(KN95Quantity);
			if (size.equals("kidsize")) {
				knprice = 25 * quantity;
			}
			else if(size.equals("adultsize")) {
				knprice = 28 * quantity;
			}
			total += knprice;
			String kn95price = String.format("%.2f", knprice);
			session.setAttribute("kn95price", kn95price);
			out.print(kn95price);
		}
		
		if(P95Chkbox != null) {
			String size = sizeP95;
			int quantity = Integer.parseInt(P95Quantity);
			if (size.equals("kidsize")) {
				pprice = 19 * quantity;
			}
			else if(size.equals("adultMalesize")) {
				pprice = 26 * quantity;
			}
			else if(size.equals("adultFemalesize")) {
				pprice = 24 * quantity;
			}
			total += pprice;
			String p95price = String.format("%.2f", pprice);
			session.setAttribute("p95price", p95price);
		}
		String Total = String.format("%.2f", total);
		session.setAttribute("Total", Total);
		
		double ageDisc = 0.00;
		if(age >= 65) {
			ageDisc = total * 10 / 100;
			String AgeDisc = String.format("%.2f", ageDisc);
			session.setAttribute("AgeDisc", AgeDisc);
		}
		double memDisc = 0.00;
		if(membership.equals("yes")) {
			memDisc = total * 5 / 100;
			String MemDisc = String.format("%.2f", memDisc);
			session.setAttribute("MemDisc", MemDisc);
		}
		double totalDisc = ageDisc + memDisc;
		String TotalDisc = String.format("%.2f", totalDisc);
		session.setAttribute("TotalDisc", TotalDisc);
		
		double pay = total - totalDisc;
		String Pay = String.format("%.2f", pay);
		session.setAttribute("Pay", Pay);
		
		response.sendRedirect("CustomerPayment.jsp");
	}



}
