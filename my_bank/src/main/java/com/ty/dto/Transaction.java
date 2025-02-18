package com.ty.dto;

import java.math.BigDecimal;

public class Transaction {

	private int transactionsId;
	private long senderAccountNumber,receiverAccountNumber,receiverPhoneNumber;
	private BigDecimal amount;
	private String transactionType,transactionMode,status,remarks;
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
	public Transaction(long senderAccountNumber, long receiverAccountNumber, long receiverPhoneNumber, BigDecimal amount,
			String transactionType, String transactionMode, String status, String remarks) {
		super();
		this.senderAccountNumber = senderAccountNumber;
		this.receiverAccountNumber = receiverAccountNumber;
		this.receiverPhoneNumber = receiverPhoneNumber;
		this.amount = amount;
		this.transactionType = transactionType;
		this.transactionMode = transactionMode;
		this.status = status;
		this.remarks = remarks;
	}
	
	
}
