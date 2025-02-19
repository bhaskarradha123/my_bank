package com.ty.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
	        	conn=con();
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
                  System.out.println(t.getTransactionMode());
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
	                if (deductStmt != null) deductStmt.close();
	                if (creditStmt != null) creditStmt.close();
	                if (transactionStmt != null) transactionStmt.close();
	                if (conn != null) conn.setAutoCommit(true); 
	                if (conn != null) conn.close();
	            } catch (SQLException closeEx) {
	                closeEx.printStackTrace();
	            }
	        }
	    }
	

	


}
