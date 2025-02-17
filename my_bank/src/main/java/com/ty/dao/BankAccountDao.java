package com.ty.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class BankAccountDao {

	public Connection con() throws Exception
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/my_bank?createDatabaseIfNotExist=true","root","root");
		return con;
	}
	
	public  void createTable() throws Exception
	{
		Statement s=con().createStatement();
		s.execute("CREATE TABLE IF NOT EXISTS bank (id INT PRIMARY KEY AUTO_INCREMENT, pin INT(4),balance DOUBLE,accNum BIGINT(12),ifsc VARCHAR(45),adharNum BIGINT(12),accountType VARCHAR(45),email VARCHAR(45),FOREIGN KEY (email) REFERENCES user(email) ON DELETE CASCADE ON UPDATE CASCADE)");
	}
}
