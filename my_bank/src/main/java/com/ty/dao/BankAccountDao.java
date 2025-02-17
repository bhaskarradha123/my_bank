package com.ty.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.ty.dto.BankAccount;

public class BankAccountDao {

	public Connection con() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/my_bank?createDatabaseIfNotExist=true", "root", "root");
		return con;
	}

	public void createTable() throws Exception {
		Statement s = con().createStatement();
		s.execute(
				"CREATE TABLE IF NOT EXISTS bank (id INT PRIMARY KEY AUTO_INCREMENT, pin INT(4),balance DOUBLE,accNum BIGINT(12) unique,ifsc VARCHAR(45),adharNum BIGINT(12),accountType VARCHAR(45),email VARCHAR(45),FOREIGN KEY (email) REFERENCES user(email) ON DELETE CASCADE ON UPDATE CASCADE)");
	}

	public int saveAccount(BankAccount b) throws SQLException, Exception  {
		PreparedStatement ps = con().prepareStatement("insert into bank values(?,?,?,?,?,?,?,?)");
		ps.setInt(1, b.getId());
		ps.setInt(2, b.getPin());
		ps.setDouble(3, b.getBalance());
		ps.setLong(4, b.getAccountNumber());
		ps.setString(5, b.getIfsc());
		ps.setLong(6, b.getAadharNum());
		ps.setString(7, b.getAccountType());
		ps.setString(8, b.getEmail());
		return ps.executeUpdate();

	}
}
