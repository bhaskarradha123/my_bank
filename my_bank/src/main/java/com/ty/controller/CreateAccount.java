package com.ty.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ty.dao.BankAccountDao;
import com.ty.dao.UserDao;
import com.ty.dto.BankAccount;
import com.ty.dto.User;

@WebServlet("/createAccount")
public class CreateAccount extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		long accountNumber = Long.parseLong(req.getParameter("accountNumber"));
		String ifsc = req.getParameter("ifsc");
		String accountType = req.getParameter("accountType");
		int pin = Integer.parseInt(req.getParameter("pin"));
		String bankName=req.getParameter("bankName");
		BankAccountDao dao = new BankAccountDao();
       
		UserDao userDao=new UserDao();
		HttpSession session = req.getSession();
		try {
		String email = (String) session.getAttribute("loginEmail");
		User user = userDao.fetchProfileByEmail(email);

		if (email != null) {
          dao.saveAccount(new BankAccount(0, pin, 0, accountNumber, user.getPhone(), ifsc, accountType, email, bankName));
			req.getRequestDispatcher("dashboard.jsp").forward(req, resp);

		} else {
			req.setAttribute("msg", "session is closed .pls try to login");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		}
		catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "account already exist with accountNumber");
			req.getRequestDispatcher("account.jsp").forward(req, resp);

		}
	}
}
