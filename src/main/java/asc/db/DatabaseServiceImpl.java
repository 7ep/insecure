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
import java.util.ArrayList;
import java.util.List;

import asc.Account;
import asc.DatabaseService;
import asc.User;

public class DatabaseServiceImpl implements DatabaseService {
	ConnectionProvider connectionProvider;

	public DatabaseServiceImpl(ConnectionProvider provider) {
		connectionProvider = provider;
	}

	Object executeTask(DatabaseTask task) {
		Connection con = null;

		boolean exceptionOccurred = false;
		try {
			con = getConnection();
			task.createStatement(con);
			return task.perform();
		} catch (Throwable t) {
			exceptionOccurred = true;
			t.printStackTrace();
			if (t instanceof ThreadDeath)
				throw (ThreadDeath) t;
			throw new RuntimeException(t.getMessage());
		} finally {
			task.closeResultSet();
			task.closeStatement();
			connectionProvider.returnConnection(con, exceptionOccurred);
		}
	}

	Connection getConnection() throws Exception {
		return connectionProvider.getConnection();
	}

	void closeConnection(Connection c) {
		try {
			c.close();
		} catch (Exception ignore) {
		}
	}

	public User findUser(final String login, final String pass) {
		DatabaseTask task = new DatabaseTask() {
			public Object perform() throws SQLException {
				final String sql = "Select * From user WHERE login ='" + login
						+ "' AND pass='" + pass + "'";

				final ResultSet resultSet = statement.executeQuery(sql);
				try {
					if (resultSet.next())
						return ObjectSQLTransform.populateOneUser(resultSet);
					return null;
				} finally {
					resultSet.close();
				}
			}
		};
		return (User) executeTask(task);
	}

	public User findUserByEmail(final String email) {
		DatabaseTask task = new DatabaseTask() {
			public Object perform() throws SQLException {
				final String sql = "Select * From user WHERE email ='" + email
						+ "'";

				ResultSet resultSet = statement.executeQuery(sql);
				if (resultSet.next())
					return ObjectSQLTransform.populateOneUser(resultSet);
				return null;
			}
		};
		return (User) executeTask(task);
	}

	public List findAccountsByUserId(final int userId) {
		final List result = new ArrayList();
		DatabaseTask task = new DatabaseTask() {
			public Object perform() throws SQLException {
				final String sql = "Select * From account WHERE userId="
						+ userId;
				ResultSet resultSet = statement.executeQuery(sql);
				while (resultSet.next())
					result
							.add(ObjectSQLTransform
									.populateOneAccount(resultSet));
				return result;
			}
		};
		return (List) executeTask(task);
	}

	public Account findAccountByAccountId(final int accountId) {
		DatabaseTask task = new DatabaseTask() {
			public Object perform() throws SQLException {
				final String sql = "Select * From account WHERE accountId ="
						+ accountId;
				ResultSet resultSet = statement.executeQuery(sql);
				if (resultSet.next())
					return ObjectSQLTransform.populateOneAccount(resultSet);
				return null;
			}
		};
		return (Account) executeTask(task);
	}

	public void setAccountActivation(final int accountId,
			final String activateCd) {
		DatabaseTask task = new DatabaseTask() {
			public Object perform() throws SQLException {
				final String sql = "Update account set active='" + activateCd
						+ "' WHERE accountId =" + accountId;

				return new Integer(statement.executeUpdate(sql));
			}
		};
		executeTask(task);
	}


	public List findProductsByName(final String query) {

		DatabaseTask task = new DatabaseTask() {
			final List result = new ArrayList();
			public Object perform() throws SQLException {
				final String sql = "Select * From product WHERE name like '%"+query+"%'";
				ResultSet resultSet = statement.executeQuery(sql);
				while (resultSet.next())
					result.add( ObjectSQLTransform.populateOneProduct(resultSet) );
				return result;
			}
		};
		return (List) executeTask(task);
	}

}