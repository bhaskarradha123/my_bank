package com.ty.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ty.dao.BankAccountDao;
import com.ty.dto.BankAccount;

@WebServlet("/checkBalance")
public class CheckBalance extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int pin = Integer.parseInt(req.getParameter("pin"));
		String bankwithAccount = req.getParameter("bankName");

		String[] acc = bankwithAccount.split(":");
		String bankName = acc[0];
		long accountNumber = Long.parseLong(acc[1]);
		HttpSession session = req.getSession();
		String email = (String) session.getAttribute("loginEmail");
		try {
			List<BankAccount> list = new BankAccountDao().fetchBankByEmail(email);

			if (list.size() > 0) {
				for (BankAccount bankAccount : list) {

					if (bankAccount.getBankName().equals(bankName) && bankAccount.getAccountNumber() == accountNumber)
						if (pin == bankAccount.getPin()) {
							req.setAttribute("balanceMsg", " " + bankAccount.getBalance());
						} else
							req.setAttribute("wrongPin", "pin doesnt match");

					
				}
				req.getRequestDispatcher("checkBalannce.jsp").include(req, resp);

			}
		} catch (Exception e) {
		}
	}
}
