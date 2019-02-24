package asc;
/* This web application has been simplified for demonstration purposes 
 * and do not represent a real production implementation - 
 * For example, production systems typically use tag libraries and a third-party MVC architecture (see Spring Framework,Tapestry,WebWork,Struts,JSF,JSTL). 
 * Original author L.Angrave. 
 * Copyright 2005 Isthmus Group LLC, Madison Wisconsin.
 * Licensed under the Apache License 2.0 
 * http://www.apache.org/licenses/LICENSE-2.0
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class WebUserService {
	private static final String USER_ATTRIBUTE = "user";

	private HttpServletRequest request;

	private DatabaseService databaseService;

	public WebUserService(HttpServletRequest r, DatabaseService ds) {
		this.request = r;
		this.databaseService = ds;
	}

	public User getSessionUser() {
		return (User) request.getSession().getAttribute(USER_ATTRIBUTE);
	}

	public boolean isLoggedIn() {
		return null != getSessionUser();
	}

	public void logout() {
		request.getSession().invalidate();
	}

	public boolean login(String name, String pass) {
		User user = databaseService.findUser(name, pass);
		if (user != null) {
			request.getSession().setAttribute(USER_ATTRIBUTE, user);
		}
		return isLoggedIn();
	}

	public String getUserName() {
		User user = getSessionUser();
		return user != null ? user.getName() : null;
	}

	public boolean isAdmin() {
		User user = getSessionUser();
		return user != null ? user.isAdmin() : false;

	}
	
	public String getUserEmail() {
		User user = getSessionUser();
		return user != null ? user.getEmail() : "";
	}
	public String getGreeting(HttpSession session) {
		String greeting = session != null ? (String)session.getAttribute("userPrefs-greeting") : null;
		return greeting != null ? greeting : "Hello";
	}
	
}