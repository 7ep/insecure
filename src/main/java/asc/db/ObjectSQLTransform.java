package asc.db;

/*
 * This web application has been simplified for demonstration purposes and do
 * not represent a real production implementation - For example, production
 * systems typically use tag libraries and a third-party MVC architecture (see
 * Spring Framework,Tapestry,WebWork,Struts,JSF,JSTL). Original author
 * L.Angrave. Copyright 2005 Isthmus Group LLC, Madison Wisconsin. Licensed
 * under the Apache License 2.0 http://www.apache.org/licenses/LICENSE-2.0
 */
import java.sql.ResultSet;
import java.sql.SQLException;

import asc.Account;
import asc.Product;
import asc.User;

public class ObjectSQLTransform {
	static User populateOneUser(ResultSet rs) throws SQLException {
		return new User(rs.getInt("userId"), rs.getString("name"), rs
				.getString("login"), rs.getString("email"), rs
				.getBoolean("admin"));
	}

	static Account populateOneAccount(ResultSet rs) throws SQLException {
		return new Account(rs.getInt("accountId"), rs.getInt("userId"), rs
				.getInt("amt_paid"), rs.getInt("amt_owed"), rs
				.getDate("opened"), rs.getBoolean("active"), rs
				.getString("comments"));
	}

	public static Product populateOneProduct(ResultSet rs) throws SQLException {
		return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs
				.getString(4), rs.getString(5), rs.getInt(6));
	}
}