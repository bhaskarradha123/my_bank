package com.ty.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.dao.TransactionsDao;
import com.ty.dto.Transaction;

@WebServlet("/transactions")
public class DisplayTransactions extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long accountNumber = Long.parseLong(req.getParameter("account"));

		if (accountNumber != 0) {
			List<Transaction> data = new TransactionsDao().fetchTransactionsByAccount(accountNumber);

			if (data != null)
				req.setAttribute("data", data);
			else
				req.setAttribute("msg", "you dont have any transactions to display");

			req.getRequestDispatcher("transactions.jsp").include(req, resp);
		}

	}

}
