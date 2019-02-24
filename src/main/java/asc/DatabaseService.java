package asc;
/* This web application has been simplified for demonstration purposes 
 * and do not represent a real production implementation - 
 * For example, production systems typically use tag libraries and a third-party MVC architecture (see Spring Framework,Tapestry,WebWork,Struts,JSF,JSTL). 
 * Original author L.Angrave. 
 * Copyright 2005 Isthmus Group LLC, Madison Wisconsin.
 * Licensed under the Apache License 2.0 
 * http://www.apache.org/licenses/LICENSE-2.0
 */
import java.util.List;

public interface DatabaseService {
	
	User findUser(String name, String pass);
	User findUserByEmail(String email);

	List findAccountsByUserId(int userId);
	
	Account findAccountByAccountId(int accountId);

	List findProductsByName(String query);
	void setAccountActivation(int accId,String activateCd);	
}
