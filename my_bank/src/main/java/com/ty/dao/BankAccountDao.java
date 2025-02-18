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

	public BankAccount fetchBalanceByAccNum(long accNum) throws Exception {

		PreparedStatement ps = con().prepareStatement("select * from bank where accNum=? ");
		ps.setLong(1, accNum);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {

			return new BankAccount(rs.getInt("pin"), rs.getDouble("balance"), rs.getLong("accNum"),
					rs.getString("bankName"));

		} else

			return null;

	}
	
	
	public boolean fetchAccountByPhone(long phoneNum) throws Exception {

		PreparedStatement ps = con().prepareStatement("select * from bank where phoneNum=?");
		ps.setLong(1, phoneNum);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {

			return true;

		} else

			return false;

	}

	public int saveAccount(BankAccount b) throws SQLException, Exception {
		PreparedStatement ps = con().prepareStatement("insert into bank values(?,?,?,?,?,?,?,?,?)");
		ps.setInt(1, b.getId());
		ps.setString(2, b.getBankName());
		ps.setInt(3, b.getPin());
		ps.setDouble(4, b.getBalance());
		ps.setLong(5, b.getAccountNumber());
		ps.setString(6, b.getIfsc());
		ps.setLong(7, b.getphoneNum());
		ps.setString(8, b.getAccountType());
		ps.setString(9, b.getEmail());
		return ps.executeUpdate();

	}
}
