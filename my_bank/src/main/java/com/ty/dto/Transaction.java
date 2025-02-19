package com.ty.dto;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Transaction {

	private int transactionsId;
	private long senderAccountNumber,receiverAccountNumber,receiverPhoneNumber;
	private BigDecimal amount;
	private String transactionType,transactionMode,status,remarks;
	
	private Timestamp transactionDate;
	
	
	public Timestamp getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(Timestamp transactionDate) {
		this.transactionDate = transactionDate;
	}
	public int getTransactionsId() {
		return transactionsId;
	}
	public void setTransactionsId(int transactionsId) {
		this.transactionsId = transactionsId;
	}
	public long getSenderAccountNumber() {
		return senderAccountNumber;
	}
	public void setSenderAccountNumber(long senderAccountNumber) {
		this.senderAccountNumber = senderAccountNumber;
	}
	public long getReceiverAccountNumber() {
		return receiverAccountNumber;
	}
	public void setReceiverAccountNumber(long receiverAccountNumber) {
		this.receiverAccountNumber = receiverAccountNumber;
	}
	public long getReceiverPhoneNumber() {
		return receiverPhoneNumber;
	}
	public void setReceiverPhoneNumber(long receiverPhoneNumber) {
		this.receiverPhoneNumber = receiverPhoneNumber;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	public String getTransactionMode() {
		return transactionMode;
	}
	public void setTransactionMode(String transactionMode) {
		this.transactionMode = transactionMode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public Transaction(long senderAccount, long receiverPhone, BigDecimal amount, String remark, String mode) {
		this.senderAccountNumber = senderAccount;
		this.receiverPhoneNumber = receiverPhone;
		this.amount = amount;
		this.remarks = remark;
		this.transactionMode=mode;
	
	}
	public Transaction() {
		super();
	}
	
	
	
	
	
	
	
}
