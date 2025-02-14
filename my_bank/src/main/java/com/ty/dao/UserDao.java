package com.ty.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ty.dto.User;

public class UserDao {

	public User fetchprofileByEmail(String email) {
		return null;
	}

	public static Connection con() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/final_project?createDatabaseIfNotExist=true", "root", "root");
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

	public User fetchProfileById(String email) throws Exception
	{
		PreparedStatement ps=con().prepareStatement("select * from user where email=?");
		ps.setString(1, email);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			String fname=rs.getString("fname");
			String lname=rs.getString("lname");
			String gender=rs.getString("gender");
			String address=rs.getString("address");
			int age=rs.getInt("age");
			long phone=rs.getLong("phone");
			String path=rs.getString("image");
			String pwd=rs.getString("pwd");
			return new User(email, path, fname, lname, gender, address, pwd, age, phone);
			 
			
		}
		return null;
	}

}
