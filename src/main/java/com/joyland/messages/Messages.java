package com.joyland.messages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/query")

public class Messages extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("name");
        String email = req.getParameter("email");
        String message = req.getParameter("text");

        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_and_tourism", "root", "root");
            String sql = "INSERT INTO messages(name, email, message, date) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";
			PreparedStatement ps= con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, message);

            ps.executeUpdate();
            con.close();
            }

         catch (Exception e) {
            System.out.println("JDBC issue: " + e.getMessage());
            e.printStackTrace();
        }
            
	}
}
