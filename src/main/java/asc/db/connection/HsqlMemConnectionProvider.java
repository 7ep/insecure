package asc.db.connection;
/* This web application has been simplified for demonstration purposes 
 * and do not represent a real production implementation - 
 * For example, production systems typically use tag libraries and a third-party MVC architecture (see Spring Framework,Tapestry,WebWork,Struts,JSF,JSTL). 
 * Original author L.Angrave. 
 * Copyright 2005 Isthmus Group LLC, Madison Wisconsin.
 * Licensed under the Apache License 2.0 
 * http://www.apache.org/licenses/LICENSE-2.0
 */


import java.sql.Connection;
import java.sql.DriverManager;

import asc.db.ConnectionProvider;

public class HsqlMemConnectionProvider implements ConnectionProvider {

	Connection lifetimeConnection;
	
	public HsqlMemConnectionProvider() throws Exception {
		Class.forName("org.hsqldb.jdbcDriver");

		String dbFile = "abcdef";
		String user = "sa";
		String pass = "";

		lifetimeConnection = DriverManager.getConnection("jdbc:hsqldb:mem:" + dbFile, user, pass); // Keep in memory database running for duration of the app.
	}

	public Connection getConnection() throws Exception {
		return lifetimeConnection;
	}

	public void returnConnection(Connection c, boolean sqlExceptionOccurred) {

	}

}