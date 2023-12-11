package com.joyland;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class AdminLogin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String psw=req.getParameter("password");
		
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		
		if(email.equals("debasis@joyland.com")&& psw.equals("123")) {
			RequestDispatcher rsd=req.getRequestDispatcher("admin_dashboard.jsp");
			rsd.forward(req,resp);
		}
		else {
			out.println("<h3>Invalid username or password</h3>");
			RequestDispatcher rsd=req.getRequestDispatcher("admin_login.html");
			rsd.include(req,resp);
		}
	}

}
