package com.ty.controller;

import java.io.IOException;
import java.math.BigDecimal;

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

@WebServlet("/selfTransfer")
public class SelfTransfer extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Transaction transaction = new Transaction();
		long senderAccount = Long.parseLong(request.getParameter("senderAccount"));
		long recieverAccount = Long.parseLong(request.getParameter("recieverAccount"));
		String amountStr = request.getParameter("amount");
		int pin = Integer.parseInt(request.getParameter("pin"));
		String remark = "money transfer to self account";
		double amount = Double.parseDouble(amountStr);
		BigDecimal transferAmount = new BigDecimal(amount);

		transaction.setAmount(transferAmount);
		transaction.setRemarks(remark);
		transaction.setSenderAccountNumber(senderAccount);
		transaction.setReceiverAccountNumber(recieverAccount);
		transaction.setTransactionMode("SELF");

		BankAccountDao dao = new BankAccountDao();
		TransactionsDao transactionDao = new TransactionsDao();
		try {
			if (senderAccount != 0 && recieverAccount != 0) {
               if(senderAccount!=recieverAccount) {
            	   BankAccount presentdata = dao.fetchBalanceByAccNum(senderAccount);
   				if (presentdata.getPin() == pin) {
   					if (presentdata.getBalance() > 0) {

   						transactionDao.transferMoney(transaction);
   						request.setAttribute("status", "Successfull");

   					} else
   						request.setAttribute("status", "insufficient funds");

   				} else
   					request.setAttribute("status", "pin is incorrect");

               }
               else
            	   request.setAttribute("status", "both accounts cant be same");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("selfTransfer.jsp");
				dispatcher.forward(request, response);

			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
