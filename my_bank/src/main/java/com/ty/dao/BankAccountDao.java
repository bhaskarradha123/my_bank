package com.ty.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
				"CREATE TABLE IF NOT EXISTS bank (id INT PRIMARY KEY AUTO_INCREMENT,bankName varchar(45), pin INT(4),balance DOUBLE,accNum BIGINT(12) unique,ifsc VARCHAR(45),adharNum BIGINT(12),accountType VARCHAR(45),email VARCHAR(45),FOREIGN KEY (email) REFERENCES user(email) ON DELETE CASCADE ON UPDATE CASCADE)");
	}

	public List<BankAccount> fetchBankByEmail(String email) throws Exception {
		List<BankAccount> list = new ArrayList<BankAccount>();
		PreparedStatement ps = con().prepareStatement("select * from bank where email=?");
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			list.add(new BankAccount(rs.getInt("pin"), rs.getDouble("balance"), rs.getLong("accNum"),
					rs.getString("bankName")));
		}

		return list;

	}

	public int saveAccount(BankAccount b) throws SQLException, Exception {
		createTable();
		PreparedStatement ps = con().prepareStatement("insert into bank values(?,?,?,?,?,?,?,?,?)");
		ps.setInt(1, b.getId());
		ps.setString(2, b.getBankName());
		ps.setInt(3, b.getPin());
		ps.setDouble(4, b.getBalance());
		ps.setLong(5, b.getAccountNumber());
		ps.setString(6, b.getIfsc());
		ps.setLong(7, b.getAadharNum());
		ps.setString(8, b.getAccountType());
		ps.setString(9, b.getEmail());
		return ps.executeUpdate();

	}
}
