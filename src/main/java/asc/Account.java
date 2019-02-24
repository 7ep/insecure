package asc;
/* This web application has been simplified for demonstration purposes 
 * and do not represent a real production implementation - 
 * For example, production systems typically use tag libraries and a third-party MVC architecture (see Spring Framework,Tapestry,WebWork,Struts,JSF,JSTL). 
 * Original author L.Angrave. 
 * Copyright 2005 Isthmus Group LLC, Madison Wisconsin.
 * Licensed under the Apache License 2.0 
 * http://www.apache.org/licenses/LICENSE-2.0
 */
import java.sql.Date;

public class Account {
	private int userId;

	private int accountId;

	private int amountPaid;

	private int amountOwed;

	private Date opened;

	private boolean active;

	private String comments;

	public Account(int accountId, int userId,int amtPaid,int amtOwed,Date opened,boolean active, String comments) {
		this.userId = userId;
		this.accountId =accountId;
		this.amountOwed = amtOwed;
		this.amountPaid = amtPaid;
		this.opened = opened;
		this.active = active;
		this.comments = comments;
	
	}
	
	/**
	 * @return Returns the accountId.
	 */
	public int getAccountId() {
		return accountId;
	}

	/**
	 * @return Returns the active.
	 */
	public boolean isActive() {
		return active;
	}

	/**
	 * @return Returns the comments.
	 */
	public String getComments() {
		return comments;
	}

	/**
	 * @return Returns the userId.
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @return Returns the amountOwed.
	 */
	public int getAmountOwed() {
		return amountOwed;
	}

	/**
	 * @return Returns the amountPaid.
	 */
	public int getAmountPaid() {
		return amountPaid;
	}

	/**
	 * @return Returns the opened.
	 */
	public Date getOpened() {
		return opened;
	}
}