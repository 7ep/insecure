package asc.db;
/* This web application has been simplified for demonstration purposes 
 * and do not represent a real production implementation - 
 * For example, production systems typically use tag libraries and a third-party MVC architecture (see Spring Framework,Tapestry,WebWork,Struts,JSF,JSTL). 
 * Original author L.Angrave. 
 * Copyright 2005 Isthmus Group LLC, Madison Wisconsin.
 * Licensed under the Apache License 2.0 
 * http://www.apache.org/licenses/LICENSE-2.0
 */
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public abstract class DatabaseTask {
	protected Statement statement;
	protected ResultSet resultSet;
	
	abstract public Object perform()
			throws SQLException;


	public Statement createStatement(Connection connection) throws SQLException {
		statement=connection.createStatement();
		return statement;
	}
	
	public void closeStatement() {
		try { if(statement!=null) statement.close(); } catch(Exception ignored) {}
		statement = null;
	}
	
	public void closeResultSet() {
		try { if(resultSet!=null) resultSet.close(); } catch(Exception ignored) {}
		resultSet = null;
	}
	
	public void close() {
		closeResultSet();
		closeStatement();
	}
}