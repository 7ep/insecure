package asc;
/* This web application has been simplified for demonstration purposes 
 * and do not represent a real production implementation - 
 * For example, production systems typically use tag libraries and a third-party MVC architecture (see Spring Framework,Tapestry,WebWork,Struts,JSF,JSTL). 
 * Original author L.Angrave. 
 * Copyright 2005 Isthmus Group LLC, Madison Wisconsin.
 * Licensed under the Apache License 2.0 
 * http://www.apache.org/licenses/LICENSE-2.0
 */
public class User {
	/**
	 * @return Returns the email.
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @return Returns the userId.
	 */
	public int getUserId() {
		return userId;
	}
	private int userId;
	private String name;
	private boolean isAdmin;
	private String login;
	private String email;

	public User(int userId, String name, String login, String email, boolean isAdmin) {
		this.userId = userId;
		this.name = name;
		this.login = login;
		this.email = email;
		this.isAdmin = isAdmin;
	}

	/**
	 * @return Returns the isAdmin.
	 */
	public boolean isAdmin() {
		return isAdmin;
	}

	/**
	 * @return Returns the login.
	 */
	public String getLogin() {
		return login;
	}

	/**
	 * @return Returns the name.
	 */
	public String getName() {
		return name;
	}
}