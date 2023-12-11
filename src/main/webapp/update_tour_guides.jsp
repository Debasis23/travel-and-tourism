<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Tour Guides</title>
<link rel="stylesheet" href="update_tour_guides.css">
</head>
<body>

<%
	String id = request.getParameter("id");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_and_tourism", "root", "root");
    PreparedStatement ps = con.prepareStatement("SELECT * FROM tour_guides WHERE id = ?");
   
    ps.setInt(1, Integer.parseInt(id));
    ResultSet rs2 = ps.executeQuery();

    rs2.next();
%>

<section>
        <div class="contact">        
            <div class="login form">
                <header>Update User Data</header>

                <form action="updateguide" method="post">
                  <input name="name" type="text" value="<%= rs2.getString("name") %>" class="feedback-input" placeholder="Enter Name" required />
                  <input name="email" type="email" value="<%= rs2.getString("email") %>" class="feedback-input" placeholder="Enter Email" required />
                  <input name="phone" type="tel" value="<%= rs2.getString("phone") %>" class="feedback-input" placeholder="Enter Phone Number" required maxlength="10" pattern="[0-9]{10}"/>

                  <div class="select-wrapper">
				    <select name="gender" class="feedback-input" required>
				        <option value="" disabled selected>Select gender</option>
				        <option value="male" <%= rs2.getString("gender").equals("male") ? "selected" : "" %>>Male</option>
				        <option value="female" <%= rs2.getString("gender").equals("female") ? "selected" : "" %>>Female</option>
				        <option value="others" <%= rs2.getString("gender").equals("others") ? "selected" : "" %>>Others</option>
				    </select>
				</div>


                  <input name="age" type="number" value="<%= rs2.getString("age") %>" class="feedback-input" placeholder="Enter Age" required />
                  <input type="hidden" name="id" value="<%= rs2.getInt("id") %>">
                  
                  <input type="submit" class="login-button" value="Update">
                </form>

                <div class="back-home">
                    <a href="admin_dashboard.jsp">Back to dashboard</a>
                </div>
            </div>
        </div>
    </section>

</body>
</html>