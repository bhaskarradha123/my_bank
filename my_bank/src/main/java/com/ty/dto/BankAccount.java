package com.ty.dto;

public class BankAccount {
	
	 private int id, pin;
	 private  double balance;
	 private long accountNumber,aadharNum;
	 private String ifsc,accountType,email, bankName;
	 
	 
	 
	 
	public BankAccount(int pin, double balance, long accountNumber, String bankName) {
		super();
		this.pin = pin;
		this.balance = balance;
		this.accountNumber = accountNumber;
		this.bankName = bankName;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPin() {
		return pin;
	}
	public void setPin(int pin) {
		this.pin = pin;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public long getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}
	public long getAadharNum() {
		return aadharNum;
	}
	public void setAadharNum(long aadharNum) {
		this.aadharNum = aadharNum;
	}
	public String getIfsc() {
		return ifsc;
	}
	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public BankAccount(int id, int pin, double balance, long accountNumber, long aadharNum, String ifsc,
			String accountType, String email, String bankName) {
		super();
		this.id = id;
		this.pin = pin;
		this.balance = balance;
		this.accountNumber = accountNumber;
		this.aadharNum = aadharNum;
		this.ifsc = ifsc;
		this.accountType = accountType;
		this.email = email;
		this.bankName=bankName;
	}
	public BankAccount() {
		super();
	}
	@Override
	public String toString() {
		return "BankAccount [id=" + id + ", pin=" + pin + ", balance=" + balance + ", accountNumber=" + accountNumber
				+ ", aadharNum=" + aadharNum + ", ifsc=" + ifsc + ", accountType=" + accountType + ", email=" + email
				+ "]";
	}
	 
	 

}
