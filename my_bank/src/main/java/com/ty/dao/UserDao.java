package com.ty.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ty.dto.User;

public class UserDao {

	public Connection con() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/my_bank?createDatabaseIfNotExist=true", "root", "root");
		return con;
	}

	public void createTable() throws Exception {
		Statement s = con().createStatement();
		s.execute("CREATE TABLE IF NOT EXISTS user (" + "    email VARCHAR(45) PRIMARY KEY, "
				+ "    fname VARCHAR(45), " + "    lname VARCHAR(45), " + "    pwd VARCHAR(45), "
				+ "    gender VARCHAR(45), " + "    address VARCHAR(45), " + "    age INT(5), "
				+ "    phone BIGINT(10) UNIQUE, " + "    image VARCHAR(45)" + ")");

		s.execute("CREATE TABLE IF NOT EXISTS bank ("
		        + "    id INT PRIMARY KEY AUTO_INCREMENT, "
				+ "    bankName VARCHAR(45), " 
		        + "    pin INT(4), " 
				+ "    balance DOUBLE, "
				+ "    accNum BIGINT(12) UNIQUE, "
				+ "    ifsc VARCHAR(45), " 
				+ "    phoneNum BIGINT(10), "
				+ "    accountType VARCHAR(45), "
				+ "    branch varchar(50),"
				+ "    city varchar(50),"
				+ "    state varchar(50)," 
				+ "    email VARCHAR(45), "
				+ "    FOREIGN KEY (email) REFERENCES user(email) ON DELETE CASCADE ON UPDATE CASCADE" 
				+ ")");

		s.execute("CREATE TABLE IF NOT EXISTS transactions (" + "    transaction_id INT PRIMARY KEY AUTO_INCREMENT, "
				+ "    sender_account_number BIGINT(12) NOT NULL, " + "    receiver_account_number BIGINT(12), "
				+ "    receiver_phone_number VARCHAR(15), " + "    amount DECIMAL(12, 2) NOT NULL, "
				+ "    transaction_mode VARCHAR(20) CHECK (transaction_mode IN ('SELF', 'BANK', 'PHONE')), "
				+ "    transaction_type VARCHAR(10) CHECK (transaction_type IN ('CREDIT', 'DEBIT')) NOT NULL, "
				+ "    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, "
				+ "    status VARCHAR(20) CHECK (status IN ('SUCCESS', 'FAILED', 'PENDING')), "
				+ "    remarks VARCHAR(255), " + "    FOREIGN KEY (sender_account_number) REFERENCES bank(accNum), "
				+ "    INDEX idx_sender_account (sender_account_number), "
				+ "    INDEX idx_receiver_account (receiver_account_number), "
				+ "    INDEX idx_transaction_date (transaction_date) " + ")");

	}

	public int save(User udto) throws Exception {
		createTable();
		PreparedStatement ps = con().prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?)");
		ps.setString(1, udto.getEmail());
		ps.setString(2, udto.getFirstname());
		ps.setString(3, udto.getLastname());
		ps.setString(4, udto.getPassword());
		ps.setString(5, udto.getGender());
		ps.setString(6, udto.getAddress());
		ps.setInt(7, udto.getAge());
		ps.setLong(8, udto.getPhone());
		ps.setString(9, udto.getImage());
		int a = ps.executeUpdate();
		return a;
	}

	public String authentication(User udto) throws SQLException, Exception {
		{
			createTable();
			PreparedStatement ps = con().prepareStatement("select email,pwd from user where email=?");
			ps.setString(1, udto.getEmail());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getString("pwd").equals(udto.getPassword())) {
					return "success";
				} else {
					return "Invalid password";
				}
			} else {
				return "Invalid email";
			}
		}
	}

	public User fetchProfileByEmail(String email) throws Exception {
		PreparedStatement ps = con().prepareStatement("select * from user where email=?");
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			String fname = rs.getString("fname");
			String lname = rs.getString("lname");
			String gender = rs.getString("gender");
			String address = rs.getString("address");
			int age = rs.getInt("age");
			long phone = rs.getLong("phone");
			String path = rs.getString("image");
			String pwd = rs.getString("pwd");
			return new User(email, path, fname, lname, gender, address, pwd, age, phone);

		}
		return null;
	}

	public int update(User udto) throws Exception {
		PreparedStatement ps = con()
				.prepareStatement("update user set fname=?,lname=?,phone=?,age=?,gender=?, address=? where email=?");
		ps.setString(1, udto.getFirstname());
		ps.setString(2, udto.getLastname());
		ps.setLong(3, udto.getPhone());
		ps.setInt(4, udto.getAge());
		ps.setString(5, udto.getGender());
		ps.setString(6, udto.getAddress());
		ps.setString(7, udto.getEmail());
		int a = ps.executeUpdate();
		return a;
	}

	public int updatePwd(String email, String pwd) throws Exception {

		PreparedStatement ps1 = con().prepareStatement("update  user set pwd=? where(email=?)");
		ps1.setString(1, pwd);
		ps1.setString(2, email);
		return ps1.executeUpdate();

	}

	public int updateProfile(User udto) throws Exception {
		PreparedStatement ps = con().prepareStatement("update user set image=? where email=?");
		ps.setString(1, udto.getImage());
		ps.setString(2, udto.getEmail());

		return ps.executeUpdate();
	}

	public int deleteProfile(User udto) throws Exception {
		PreparedStatement ps = con().prepareStatement("delete from user where email=? and pwd =?");
		ps.setString(2, udto.getPassword());
		ps.setString(1, udto.getEmail());

		return ps.executeUpdate();
	}

}
