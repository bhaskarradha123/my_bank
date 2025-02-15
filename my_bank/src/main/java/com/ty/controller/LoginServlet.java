package com.ty.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ty.dao.UserDao;
import com.ty.dto.User;


@WebServlet("/login")
public class LoginServlet  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email=req.getParameter("email");
		String pwd=req.getParameter("password");
		
		User udto=new User(email, pwd);
		UserDao udao=new UserDao();
		
		try {
			String result=udao.authentication(udto);
			if(result.equals("success"))
			{
				HttpSession hs=req.getSession();
				User loginData=udao.fetchProfileByEmail(email);
				
				hs.setAttribute("loginEmail", email);
				RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
				rd.forward(req, resp);
			}
			else
			{
				req.setAttribute("result", result);
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.include(req, resp);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
}
