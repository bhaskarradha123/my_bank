package com.ty.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class TransactionsDao {

	public  Connection con() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/my_bank?createDatabaseIfNotExist=true", "root", "root");
		return con;
	}
}
