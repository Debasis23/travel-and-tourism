package com.joyland.bookings;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/booktrip")

public class Bookings extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String packages = req.getParameter("package");
        String gender = req.getParameter("gender");
        String travelDate = req.getParameter("date");

        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_and_tourism", "root", "root");
            String sql = "INSERT INTO bookings(name, email, phone, package, gender, travel_date, date) VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
			PreparedStatement ps= con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, packages);
            ps.setString(5, gender);
            ps.setString(6, travelDate);

            ps.executeUpdate();
            con.close();
            res.sendRedirect("success.html");

            }

         catch (Exception e) {
            System.out.println("JDBC issue: " + e.getMessage());
            e.printStackTrace();
            res.sendRedirect("failed.html");

        }
            
	}
}

