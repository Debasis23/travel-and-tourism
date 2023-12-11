package com.joyland.tourguides;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateguide")

public class UpdateTourGuides extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String id = req.getParameter("id");
		String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String gender = req.getParameter("gender");
        String age = req.getParameter("age");
        

        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_and_tourism", "root", "root");
            String sql = "update tour_guides set name=?, email=?, phone=?, gender=?, age=? where id=?";
			PreparedStatement ps= con.prepareStatement(sql);
			
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, gender);
            ps.setInt(5, Integer.parseInt(age));
            ps.setInt(6, Integer.parseInt(id));
           
            ps.executeUpdate();
            con.close();
            res.sendRedirect("success_update.html");
            }

         catch (Exception e) {
            System.out.println("JDBC issue: " + e.getMessage());
            e.printStackTrace();
        }
            
	}

}
