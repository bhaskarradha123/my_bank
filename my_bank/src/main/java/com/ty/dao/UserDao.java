package com.ty.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ty.dto.User;

public class UserDao {

	public static Connection con() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/my_bank?createDatabaseIfNotExist=true", "root", "root");
		return con;
	}

	public static void createTable() throws Exception {
		Statement s = con().createStatement();
		s.execute(
				"create table if not exists user(email varchar(45) primary key,fname varchar(45),lname varchar(45),pwd varchar(45),gender varchar(45),address varchar(45),age int(5),phone bigint(10),image varchar(45))");
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
