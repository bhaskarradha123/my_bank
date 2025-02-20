<%@page import="com.ty.dto.User"%>
<%@page import="com.ty.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Details</title>

</head>
<body>

<%
	String email = (String) session.getAttribute("loginEmail");
	UserDao dao = new UserDao();
	User p = dao.fetchProfileByEmail(email);
	if (email != null && p != null) {
	%>
<div class="profile-container">
    <!-- Image Section -->
    <div class="image-div">
        <img alt="Your Image" src="<%= p.getImage() %>">
    </div>

    <!-- Upload Section -->
    <div>
        <form action="updatepr" method="post" enctype="multipart/form-data">
            <label class="upload-button">
                + <!-- Plus icon -->
                <input type="file" class="file-input" name="ima" accept="image/*" onchange="this.form.submit()">
            </label>
            <div class="upload-text">
                <span class="finger-icon">&#9757;</span> <!-- Finger icon -->
                update your profile
            </div>
        </form>
    </div>

    <!-- User Details Table -->
    <table>
        <tr>
            <th class="a">Name</th>
            <th class="a">Phone</th>
            <th class="a">Email</th>
            <th class="a">Age</th>
            <th class="a">Gender</th>
            <th class="a">Address</th>
        </tr>
        <tr>
            <td class="b"><%= p.getFirstname() + " " + p.getLastname() %></td>
            <td class="b"><%= p.getPhone() %></td>
            <td class="b"><%= p.getEmail() %></td>
            <td class="b"><%= p.getAge() %></td>
            <td class="b"><%= p.getGender() %></td>
            <td class="b"><%= p.getAddress() %></td>
        </tr>
    </table>
    
<a href="dashboard.jsp"><button>DASHBOARD</button></a>
</div>
<%} %>
</body>
</html>
