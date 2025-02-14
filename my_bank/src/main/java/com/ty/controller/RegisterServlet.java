package com.ty.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ty.dao.UserDao;
import com.ty.dto.User;

@MultipartConfig(maxFileSize = 1000000000)
@WebServlet("/save")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fname = req.getParameter("firstname");
        String lname = req.getParameter("lastname");
        String address = req.getParameter("address");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String pwd = req.getParameter("pwd");
        int age = Integer.parseInt(req.getParameter("age"));
        long phone = Long.parseLong(req.getParameter("phone"));
        
        Part p = req.getPart("ima");
        String image_path = null;

        if (p != null && p.getSize() > 0) {
            // Get the upload directory
            String uploadDir = getServletContext().getRealPath("/uploads/");
            
            // Create the directory if it doesn't exist
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            // Construct the image path and write the file
            image_path = "uploads/" + p.getSubmittedFileName();
            p.write(uploadDir + p.getSubmittedFileName());
        }

        User udto = new User(email, pwd, fname, lname, gender, address, image_path, age, phone);
        UserDao udao = new UserDao();

        try {
            int a = udao.save(udto);
            if (a > 0) {
                RequestDispatcher rd = req.getRequestDispatcher("successRegistration.jsp");
                rd.forward(req, resp);
            }
        } catch (Exception e) {
            String s = "Email already exists, please try with another.";
            req.setAttribute("msg", s);
            RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
            rd.include(req, resp);
        }
    }
}
