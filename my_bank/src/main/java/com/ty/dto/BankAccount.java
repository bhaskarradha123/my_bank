package com.ty.dto;

public class BankAccount {

	private int id, pin;
	private double balance;
	private long accountNumber, phoneNum;
	private String ifsc, accountType, email, bankName, branch, city, state;

	public BankAccount(String ifsc, int pin, double balance, long accountNumber, String bankName) {
		super();
		this.ifsc = ifsc;
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

	public long getphoneNum() {
		return phoneNum;
	}

	public void setAadharNum(long phoneNum) {
		this.phoneNum = phoneNum;
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

	public long getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(long phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getCity() {
		return city;

	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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

	public BankAccount(int id, int pin, double balance, long accountNumber, long phoneNum, String ifsc,
			String accountType, String email, String bankName, String branch, String city, String state) {
		this(ifsc, pin, balance, accountNumber, bankName);
		this.id = id;
		this.phoneNum = phoneNum;
		this.accountType = accountType;
		this.email = email;
		this.branch = branch;
		this.city = city;
		this.state = state;
	}

	public BankAccount() {
		super();
	}

	@Override
	public String toString() {
		return "BankAccount [id=" + id + ", pin=" + pin + ", balance=" + balance + ", accountNumber=" + accountNumber
				+ ", phoneNum=" + phoneNum + ", ifsc=" + ifsc + ", accountType=" + accountType + ", email=" + email
				+ "]";
	}

}
