package com.joyland.tourguides;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteTourGuides")

public class DeleteTourGuides extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id= req.getParameter("id");	

        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_and_tourism", "root", "root");
			PreparedStatement ps= con.prepareStatement("delete from tour_guides where id=?");
			ps.setInt(1, Integer.parseInt(id));
//			ps.setInt(1,1);
			
            ps.execute();
            RequestDispatcher rs2 = req.getRequestDispatcher("admin_dashboard.jsp");
            rs2.forward(req, resp);
			
            con.close();
            }

         catch (Exception e) {
            System.out.println("JDBC issue: " + e.getMessage());
            e.printStackTrace();
        }
	
	}

}
