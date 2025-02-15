package com.ty.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.dao.UserDao;
import com.ty.dto.User;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = (String) req.getParameter("email");
		String pwd = (String) req.getParameter("pwd");
		try {
		if(new UserDao().deleteProfile(new User(email, pwd))>0) {
			req.getRequestDispatcher("logout").forward(req, resp);
		}
		else {
			req.setAttribute("msg", "enter correct pwd to delete your account");
			req.getRequestDispatcher("delete.jsp").include(req, resp);

		}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
