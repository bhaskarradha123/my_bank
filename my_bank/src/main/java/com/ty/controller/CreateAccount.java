package com.ty.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ty.dao.BankAccountDao;
import com.ty.dto.BankAccount;

@WebServlet("/createAccount")
public class CreateAccount extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		long accountNumber = Long.parseLong(req.getParameter("accountNumber"));
		long aadharNum = Long.parseLong(req.getParameter("aadharNum"));
		String ifsc = req.getParameter("ifsc");
		String accountType = req.getParameter("accountType");
		int pin = Integer.parseInt(req.getParameter("pin"));
		BankAccountDao dao = new BankAccountDao();
       
		HttpSession session = req.getSession();
		try {
		String email = (String) session.getAttribute("loginEmail");
		if (email != null) {
          dao.saveAccount(new BankAccount(0, pin, 0, accountNumber, aadharNum, ifsc, accountType, email));
			req.getRequestDispatcher("dashboard.jsp").forward(req, resp);

		} else {
			req.setAttribute("msg", "session is closed .pls try to login");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		}
		catch (Exception e) {
			req.setAttribute("msg", "account already exist with accountNumber");
			req.getRequestDispatcher("account.jsp").forward(req, resp);

		}
	}
}
