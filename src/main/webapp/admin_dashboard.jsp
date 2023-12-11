<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="admin_dashboard.css">
<title>Admin Dashboard</title>
</head>

<body>

<!-- Sidebar -->
    <div class="sidebar">
        <a href="#" class="logo">
            Joyland.
        </a>
        <ul class="side-menu">
            <li class="active" data-section="insights"><a href="#insights"><i class='bx bxs-dashboard'></i>Dashboard</a></li>
            <li data-section="bookings"><a href="#bookings"><i class='bx bx-calendar-check'></i>Bookings</a></li>
            <li data-section="messages"><a href="#messages"><i class='bx bx-chat'></i>Messages</a></li>
            <li data-section="tourguides"><a href="#tourguides"><i class='bx bx-user-voice'></i>Tour Guides</a></li>
        </ul>
    

        <ul class="side-menu">
            <li>
                <a href="admin_login.html" class="logout">
                    <i class='bx bx-log-out-circle'></i>Logout
                </a>
            </li>
        </ul>
    </div>
    <!-- End of Sidebar -->


    <!-- Main Content -->
    <div class="content">

        <!-- Navbar -->
        <nav>
            <i class='bx bx-menu'></i>
            <form action="#">

                <div class="form-input">
                    <input type="search" placeholder="Search...">
                    <button class="search-btn" type="submit"><i class='bx bx-search'></i></button>
                </div>

            </form>
            
        </nav>
        <!-- End of Navbar -->
        
        
        <!-- Start of Insights -->

        <main id="insights">
            <div class="header">
                <div class="left">
                    <h1>Dashboard</h1>
                </div>

            </div>
            
            <ul class="insights">
            
            <%
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con0 = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_and_tourism","root","root");
            Statement stInsights = con0.createStatement();
            
			%>
            
            <%
                    // Fetch number of bookings
                    ResultSet rsBookings = stInsights.executeQuery("SELECT COUNT(*) FROM bookings");
                    rsBookings.next();
                    int numberOfBookings = rsBookings.getInt(1);
                    

                    // Fetch total sales
					ResultSet rsSales = stInsights.executeQuery("SELECT SUM(CASE WHEN package = 'Basic' THEN 149 WHEN package = 'Popular' THEN 299 WHEN package = 'Premium' THEN 599 ELSE 0 END) FROM bookings");
                    rsSales.next();
                    double totalSales = rsSales.getDouble(1);

                    // Fetch number of messages
                    ResultSet rsMessages = stInsights.executeQuery("SELECT COUNT(*) FROM messages");
                    rsMessages.next();
                    int numberOfMessages = rsMessages.getInt(1);

                    // Fetch number of tour guides
                    ResultSet rsTourGuides = stInsights.executeQuery("SELECT COUNT(*) FROM tour_guides");
                    rsTourGuides.next();
                    int numberOfTourGuides = rsTourGuides.getInt(1);
                %>
                
                
                
                
                <li>
                    <i class='bx bx-calendar-check'></i>
                    <span class="info">
                        <h3><%= numberOfBookings %></h3>
                        <p>Bookings</p>
                    </span>
                </li>

                <li>
                    <i class='bx bx-dollar-circle'></i>
                    <span class="info">
        				<h3>$<%= String.format("%,.2f", totalSales) %></h3>
                        <p>Sales</p>
                    </span>
                </li>

                <li>
                    <i class='bx bx-chat'></i>
                    <span class="info">
                        <h3><%= numberOfMessages %></h3>
                        <p>Queries</p>
                    </span>
                </li>

                <li>
                    <i class='bx bx-user-voice'></i>
                    <span class="info">
                        <h3><%= numberOfTourGuides %></h3>
                        <p>Tour Guides</p>
                    </span>
                </li>

            </ul>
        </main>
        <!-- End of Insights -->


        <!-- Start of Booking section-->
        <%
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_and_tourism","root","root");
		    Statement st = con.createStatement();
		    ResultSet rs = st.executeQuery("select * from bookings");
		    
		%>

        <main id="bookings">

            <div class="header">
                <div class="left">
                    <h1>Bookings</h1>
                </div>
            </div>

            <div class="booking-data">
                <div class="booking-table">
                    
                    <table>
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Date</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Package</th>
                                <th>Gender</th>
                                <th>Travel Date</th>
            
                            </tr>
                        </thead>

                        <tbody>
                            <% while(rs.next()) { %>
				                <tr>
				                    <td><%= rs.getInt(1) %></td>
				                    <td><%= rs.getDate(2) %></td>
				                    <td><%= rs.getString(3) %></td>
				                    <td><%= rs.getString(4) %></td>
				                    <td><%= rs.getString(5) %></td>
				                    <td><%= rs.getString(6) %></td>
				                    <td><%= rs.getString(7) %></td>
				                    <td><%= rs.getString(8) %></td>
				                </tr>    
				            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- End of Booking section-->
        </main>


        <!-- Start of Messages section-->
        <%
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_and_tourism","root","root");
		    Statement st1 = con.createStatement();
			ResultSet rs1 = st.executeQuery("select * from messages");
		%>

        <main id="messages">

            <div class="header">
                <div class="left">
                    <h1>Messages</h1>
                </div>
            </div>

            <div class="message-data">
                <div class="message-table">
                    
                    <table>
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Date</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Message</th>            
                            </tr>
                        </thead>

                        <tbody>
                            <% while(rs1.next()) { %>
                            <tr>
				                <td><%= rs1.getInt(1) %></td>
				                <td><%= rs1.getDate(2) %></td>
				                <td><%= rs1.getString(3) %></td>
				                <td><%= rs1.getString(4) %></td>
				                <td><%= rs1.getString(5) %></td>
				            </tr>    
							<% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
        <!-- End of message section-->
        

        <!-- Start of Tour Guides section -->
        <%
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_and_tourism","root","root");
		    Statement st2 = con.createStatement();
			ResultSet rs2 = st.executeQuery("select * from tour_guides");
		%>
		
        <main id="tourguides">

            <div class="header">
                <div class="left">
                    <h1>Tour Guides</h1>
                </div>

                <a href="add_tour_guides.html" class="add-user">
                    <i class='bx bx-user-plus'></i>
                    <span>Add User</span>
                </a>
            </div>

            <div class="tour-data">
                <div class="tour-table">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Gender</th>
                                <th>Age</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            <%
							while(rs2.next()) { 
							%>
						
							<tr>
								<td><%= rs2.getInt(1) %></td>
								<td><%= rs2.getString(2) %></td>
								<td><%= rs2.getString(3) %></td>
								<td><%= rs2.getString(4) %></td>
								<td><%= rs2.getString(5) %></td>
								<td><%= rs2.getInt(6) %></td>
								<td>
                                    <a href="update_tour_guides.jsp?id=<%= rs2.getInt(1) %>" title="Edit">
                                        <span class="edit-icon"><i class='bx bx-edit'></i></span>
                                    </a>
                                    			
                                    <a href="DeleteTourGuides?id=<%= rs2.getInt(1) %>" title="Delete">
                                        <span class="delete-icon"><i class='bx bx-trash'></i></span>
                                    </a>                                    
                                </td>								
							</tr>
							<% } %>
                        </tbody>
                    </table>
                </div>
            </div>

        </main>

    </div>

    <script src="admin_dashboard.js"></script>
</body>
</html>