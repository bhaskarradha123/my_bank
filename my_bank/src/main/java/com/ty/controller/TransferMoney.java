package com.ty.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.RequestDispatcher;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.dao.BankAccountDao;
import com.ty.dao.TransactionsDao;
import com.ty.dto.BankAccount;
import com.ty.dto.Transaction;
import com.ty.enums.TransactionMode;

@WebServlet("/numberTransfer")
public class TransferMoney extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		long senderAccount = Long.parseLong(request.getParameter("senderAccount"));
		long receiverPhone = Long.parseLong(request.getParameter("receiverPhone"));
		String amountStr = request.getParameter("amount");

		int pin=Integer.parseInt(request.getParameter("pin"));
		String remark = "money transfer to mobile number";
		double amount = Double.parseDouble(amountStr);
		BigDecimal transferAmount = new BigDecimal(amount);

		BankAccountDao dao = new BankAccountDao();
		TransactionsDao transactionDao = new TransactionsDao();
		try {
			BankAccount presentdata = dao.fetchBalanceByAccNum(senderAccount);
			boolean recieverStatus = dao.fetchAccountByPhone(receiverPhone);
			if (presentdata.getPin() == pin) {
				if (presentdata.getBalance() > 0) {
					if (recieverStatus) {

						transactionDao.transferMoney( new Transaction(senderAccount, receiverPhone, transferAmount, remark,"PHONE"));
						request.setAttribute("status", "Successfull");

					} else
						request.setAttribute("status", "Reciever Number Not Exist");
				} else
					request.setAttribute("status", "insufficient funds");

			} else
				request.setAttribute("status", "pin is incorrect");

			RequestDispatcher dispatcher = request.getRequestDispatcher("phoneTransfer.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {

			e.printStackTrace();
		}

	}
}
