package com.ty.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ty.dao.UserDao;

@WebServlet("/forgetPwd")
public class ForgetPwd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   String email=req.getParameter("email");
	   try {
	   if(new UserDao().fetchProfileByEmail(email)!=null)
	   {
		   HttpSession httpSession=req.getSession();
		   httpSession.setAttribute("loginEmail", email);
		   req.getRequestDispatcher("pwdUpdate.jsp").forward(req, resp);
	   }
	   else
	   {
		   req.setAttribute("msg", "you dont have an account with "+email + " pls register");
		   req.getRequestDispatcher("signup.jsp").forward(req, resp);

	   }
	   }
	   catch (Exception e) {
		// TODO: handle exception
	}
	}
}
