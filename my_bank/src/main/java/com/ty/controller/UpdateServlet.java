package com.ty.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.dao.UserDao;
import com.ty.dto.User;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fname = req.getParameter("firstName");
		String lname = req.getParameter("lastName");
		String address = req.getParameter("address");
		String gender = req.getParameter("gender");
		String email = req.getParameter("email");
		String pwd = req.getParameter("password");
		int age = Integer.parseInt(req.getParameter("age"));
		long phone = Long.parseLong(req.getParameter("phone"));

		User user = new User(email, pwd, fname, lname, gender, address, null, age, phone);

		try {
			new UserDao().update(user);
			req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
			
		} catch (Exception e) {

		}
	}
}
