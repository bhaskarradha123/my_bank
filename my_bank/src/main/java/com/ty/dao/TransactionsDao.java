package com.ty.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TransactionsDao {

	public Connection con() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/my_bank?createDatabaseIfNotExist=true", "root", "root");
		return con;
	}

	
	
	
	


	    public void transferMoney(long senderAccount, long receiverPhoneNum, double amount, String remarks) {
	        Connection conn = null;
	        PreparedStatement deductStmt = null;
	        PreparedStatement creditStmt = null;
	        PreparedStatement transactionStmt = null;

	        try {
	        	conn=con();
	            conn.setAutoCommit(false);


	            String deductQuery = "UPDATE bank SET balance = balance - ? WHERE accNum = ? ";
	            deductStmt = conn.prepareStatement(deductQuery);
	            deductStmt.setDouble(1, amount);
	            deductStmt.setLong(2, senderAccount);
	            int senderUpdate = deductStmt.executeUpdate();

	            String creditQuery = "UPDATE bank SET balance = balance + ? WHERE phoneNum = ?";
	            creditStmt = conn.prepareStatement(creditQuery);
	            creditStmt.setDouble(1, amount);
	            creditStmt.setLong(2, receiverPhoneNum);
	            int receiverUpdate = creditStmt.executeUpdate();


	            String transactionQuery = "INSERT INTO transactions (sender_account_number, receiver_phone_number, amount, transaction_type, transaction_mode, status, remarks) VALUES (?, ?, ?, 'PHONE', 'DEBIT', 'SUCCESS', ?)";
	            transactionStmt = conn.prepareStatement(transactionQuery);
	            transactionStmt.setLong(1, senderAccount);
	            transactionStmt.setLong(2, receiverPhoneNum);
	            transactionStmt.setDouble(3, amount);
	            transactionStmt.setString(4, remarks);
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
