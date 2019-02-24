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

import javax.naming.Context;
import javax.sql.DataSource;

import asc.db.ConnectionProvider;

public class DatasourceConnectionProvider implements ConnectionProvider {

	Context initContext;

	Context envContext;
	
	DataSource dataSource;

	public DatasourceConnectionProvider() throws Exception {
		initContext = new javax.naming.InitialContext();
		envContext = (Context) initContext.lookup("java:/comp/env");
		dataSource = (DataSource)envContext.lookup("jdbc/asdb"); // see if datasource exists
		Connection c = getConnection();
		returnConnection(c,false);
	}

	public Connection getConnection() throws Exception {
		return dataSource.getConnection();
	}

	public void returnConnection(Connection c, boolean sqlExceptionOccurred) {
		try {
			c.close();
		} catch (Exception ignored) {
		}

	}

}