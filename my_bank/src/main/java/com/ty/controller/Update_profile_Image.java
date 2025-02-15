package com.ty.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ty.dao.UserDao;
import com.ty.dto.User;

@MultipartConfig(maxFileSize = 1000000000)
@WebServlet("/updatepr")
public class Update_profile_Image extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Part p = req.getPart("ima");
		String up = getServletContext().getRealPath("/uploads/");
		String image_path = "uploads/" + p.getSubmittedFileName();
		p.write(up + p.getSubmittedFileName());
		HttpSession hs = req.getSession();
		String email = (String) hs.getAttribute("loginEmail");

		
		User udto = new User(email, null, null, null, null, null, image_path, 0, 0);
		UserDao udao = new UserDao();
		try {
			int data = udao.updateProfile(udto);
			System.out.println(data);
			RequestDispatcher rd = req.getRequestDispatcher("profile.jsp");
			rd.include(req, resp);
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}