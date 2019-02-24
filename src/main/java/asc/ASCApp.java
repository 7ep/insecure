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

import asc.db.ConnectionProvider;
import asc.db.DatabaseServiceImpl;
import asc.db.connection.DatasourceConnectionProvider;
import asc.db.connection.HsqlMemConnectionProvider;

public class ASCApp {
	protected static DatabaseService databaseService;
	protected static ConnectionProvider connectionProvider;
	
	public static ConnectionProvider getDatabaseConnectionProviderSingleton() {
		initSingletons();
		return connectionProvider;
	}
	public static DatabaseService getDatabaseServiceSingleton() {
		initSingletons();
		return databaseService;
	}
	
	public static WebUserService getWebUserService(HttpServletRequest request) {
		return new WebUserService(request,getDatabaseServiceSingleton());
	}
	
	synchronized static void initSingletons() {
		if(databaseService  != null) return;
		// Try to use a datasource connection first
		try {
			connectionProvider = new DatasourceConnectionProvider(); 
		} catch(Exception ex) {
			System.err.println("Warning; External datasource connection is not configured by the server or not present. (Error Message:"+ex.getMessage()+")");
		}			
		try {
			if(connectionProvider  == null) {
				System.err.println("Using transient internal in-process SQL database (HSql).");
				// default to in-memory database
				connectionProvider = new HsqlMemConnectionProvider();
			}
			databaseService = new DatabaseServiceImpl(connectionProvider);
		} catch(Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException(ex);
		}
		
	}	
}
