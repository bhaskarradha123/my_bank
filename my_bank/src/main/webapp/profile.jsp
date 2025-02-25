<%@page import="com.ty.dto.User"%>
<%@page import="com.ty.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #ffffff;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        height: 100vh;
        position: relative;
    }
    
    .dashboard-button {
        position: absolute;
        top: 20px;
        left: 20px;
        background: #3a8dde;
        color: white;
        padding: 10px 15px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 16px;
        box-shadow: 0 0 15px rgba(25, 3, 150, 0.7);
    }

    .dashboard-button:hover {
        background: #2f75b5;
    }
    
    .profile-container {
        background: #f8f9fa;
        padding: 30px;
        border-radius: 20px;
        box-shadow: 0 0 15px rgba(25, 3, 150, 0.5);
        width: 60%;
        max-width: 600px;
        text-align: center;
    }
    
    .image-div img {
        width: 300px;
        height: 120px;
         border-radius: 50%; 
        object-fit: cover;
        border: 3px solid #3a8dde;
        margin-bottom: 15px;
    }

    .upload-button {
        display: inline-block;
        background: #3a8dde;
        color: white;
        padding: 8px 12px;
        border-radius: 5px;
        cursor: pointer;
        position: relative;
    }
    
    .upload-button input {
        position: absolute;
        left: 0;
        top: 0;
        opacity: 0;
        width: 100%;
        height: 100%;
        cursor: pointer;
    }
    
    table {
        width: 60%;
        border-collapse: collapse;
        background: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
        margin-top: 15px;
        margin-left: 120px;
    }
    
    td {
        padding: 12px;
        text-align: center;
    }
    
    td:first-child {
        color: #3a8dde;
        font-weight: bold;
    }
    
    tr:nth-child(even) {
        background: #f2f2f2;
    }

    .edit-button, .delete-button {
        background: #3a8dde;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        margin: 15px;
        box-shadow: 0 0 15px rgba(25, 3, 150, 0.2);
    }
    
    .delete-button {
        background: #de3a3a;
    }
    
    .edit-button:hover {
        background: #2f75b5;
    }
    
    .delete-button:hover {
        background: #b52f2f;
    }
</style>
</head>
<body>
    <a href="dashboard.jsp" class="dashboard-button">DASHBOARD</a>
    
    <%
        String email = (String) session.getAttribute("loginEmail");
        UserDao dao = new UserDao();
        User p = dao.fetchProfileByEmail(email);
        
        if (email != null && p != null) {
            String imagePath = p.getImage();
            if (imagePath == null || imagePath.trim().isEmpty()) {
                imagePath = "default-profile.png"; // Fallback image
            } else {
                imagePath = "image?file=" + imagePath.substring(imagePath.lastIndexOf('/') + 1);
            }
    %>
    
    
    <div class="profile-container">
        <div class="image-div">
            <img alt="Your Image" src="<%= imagePath %>">
        </div>

        <div>
            <form action="updatepr" method="post" enctype="multipart/form-data">
                <label class="upload-button">
                    +
                    <input type="file" name="ima" accept="image/*" onchange="this.form.submit()">
                </label>
                <div class="upload-text">
                    <span class="finger-icon"></span> Edit your profile
                </div>
            </form>
        </div>

        <table>
            <tr>
                <td>Name</td>
                <td><%= p.getFirstname() + " " + p.getLastname() %></td>
            </tr>
            <tr>
                <td>Phone</td>
                <td><%= p.getPhone() %></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><%= p.getEmail() %></td>
            </tr>
            <tr>
                <td>Age</td>
                <td><%= p.getAge() %></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><%= p.getGender() %></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><%= p.getAddress() %></td>
            </tr>
        </table>
        
        <div class="buttons">
            <a href="update.jsp"><button class="edit-button">Edit</button></a>
            <a href="delete.jsp"><button class="delete-button">Delete</button></a>
        </div>
    </div>
    
    <% } else { %>
        <p>No user profile found.</p>
    <% } %>
</body>
</html>
