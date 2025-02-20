package com.ty.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ty.dto.Transaction;

public class TransactionsDao {

	public Connection con() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/my_bank?createDatabaseIfNotExist=true", "root", "root");
		return con;
	}

	public void transferMoney(Transaction t) {
		Connection conn = null;
		PreparedStatement deductStmt = null;
		PreparedStatement creditStmt = null;
		PreparedStatement transactionStmt = null;

		try {
			conn = con();
			conn.setAutoCommit(false);

			String deductQuery = "UPDATE bank SET balance = balance - ? WHERE accNum = ? ";
			deductStmt = conn.prepareStatement(deductQuery);
			deductStmt.setBigDecimal(1, t.getAmount());
			deductStmt.setLong(2, t.getSenderAccountNumber());
			int senderUpdate = deductStmt.executeUpdate();

			String creditQuery = "UPDATE bank SET balance = balance + ? WHERE phoneNum = ? OR accNum = ?";
			creditStmt = conn.prepareStatement(creditQuery);
			creditStmt.setBigDecimal(1, t.getAmount());
			creditStmt.setLong(2, t.getReceiverPhoneNumber());
			creditStmt.setLong(3, t.getReceiverAccountNumber());

			int receiverUpdate = creditStmt.executeUpdate();

			String transactionQuery = "INSERT INTO transactions (sender_account_number,receiver_account_number, receiver_phone_number, amount, transaction_type, transaction_mode, status, remarks) VALUES (?, ?, ?, ?, 'DEBIT',?, 'SUCCESS', ?)";
			transactionStmt = conn.prepareStatement(transactionQuery);
			transactionStmt.setLong(1, t.getSenderAccountNumber());
			transactionStmt.setLong(2, t.getReceiverAccountNumber());

			transactionStmt.setLong(3, t.getReceiverPhoneNumber());
			transactionStmt.setBigDecimal(4, t.getAmount());
			transactionStmt.setString(5, t.getTransactionMode());
			transactionStmt.setString(6, t.getRemarks());
			transactionStmt.executeUpdate();

			conn.commit();

		} catch (Exception e) {
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException rollbackEx) {
					rollbackEx.printStackTrace();
				}
			}
			e.printStackTrace();

		} finally {
			try {
				if (deductStmt != null)
					deductStmt.close();
				if (creditStmt != null)
					creditStmt.close();
				if (transactionStmt != null)
					transactionStmt.close();
				if (conn != null)
					conn.setAutoCommit(true);
				if (conn != null)
					conn.close();
			} catch (SQLException closeEx) {
				closeEx.printStackTrace();
			}
		}
	}

	public List<Transaction> fetchTransactionsByAccount(long accountNumber) {
		List<Transaction> transactions = new ArrayList<>();
		String query = "SELECT *, CASE " + "WHEN sender_account_number = ? THEN 'DEBIT' "
				+ "WHEN receiver_account_number = ? THEN 'CREDIT' " + "END AS transaction_type_dynamic "
				+ "FROM transactions " + "WHERE sender_account_number = ? OR receiver_account_number = ? "
				+ "ORDER BY transaction_date DESC";

		try {
			PreparedStatement pst = con().prepareStatement(query);
			pst.setLong(1, accountNumber);
			pst.setLong(2, accountNumber);
			pst.setLong(3, accountNumber);
			pst.setLong(4, accountNumber);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Transaction txn = new Transaction();
				txn.setTransactionsId(rs.getInt("transaction_id"));
				txn.setSenderAccountNumber(rs.getLong("sender_account_number"));
				txn.setReceiverAccountNumber(rs.getLong("receiver_account_number"));
				txn.setReceiverPhoneNumber(rs.getLong("receiver_phone_number"));
				txn.setAmount(rs.getBigDecimal("amount"));
				txn.setTransactionMode(rs.getString("transaction_mode"));
				txn.setTransactionType(rs.getString("transaction_type_dynamic")); // Use dynamically fetched type
				txn.setTransactionDate(rs.getTimestamp("transaction_date"));
				txn.setStatus(rs.getString("status"));
				txn.setRemarks(rs.getString("remarks"));

				transactions.add(txn);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (transactions.size() > 0)
			return transactions;
		else
			return null;
	}

}
