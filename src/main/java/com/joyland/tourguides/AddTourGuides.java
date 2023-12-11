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

@WebServlet("/tourguides")

public class AddTourGuides extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String gender = req.getParameter("gender");
        String age = req.getParameter("age");

        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_and_tourism", "root", "root");
            String sql = "INSERT INTO tour_guides(name, email, phone, gender, age ) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement ps= con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, gender);
            ps.setString(5, age);

            ps.executeUpdate();
            con.close();
            resp.sendRedirect("success_user.html");

            }

         catch (Exception e) {
            System.out.println("JDBC issue: " + e.getMessage());
            e.printStackTrace();

        }
	
	}

}
