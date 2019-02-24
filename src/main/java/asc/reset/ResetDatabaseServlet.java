package asc.reset;
/* This web application has been simplified for demonstration purposes 
 * and do not represent a real production implementation - 
 * For example, production systems typically use tag libraries and a third-party MVC architecture (see Spring Framework,Tapestry,WebWork,Struts,JSF,JSTL). 
 * Original author L.Angrave. 
 * Copyright 2005 Isthmus Group LLC, Madison Wisconsin.
 * Licensed under the Apache License 2.0 
 * http://www.apache.org/licenses/LICENSE-2.0
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import asc.ASCApp;
import asc.db.ConnectionProvider;


public class ResetDatabaseServlet extends HttpServlet {



	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("<form action=reset method=post><input type='submit' value='reset'></form>");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		
		Exception exception = ResetDatabase();
			
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    Reset Database: ");
		out.print(exception != null ? "Failed:" + exception.getMessage() : "Succeeded");
		out.println("");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		ResetDatabase();
	}


	/**
	 * 
	 */
	private Exception ResetDatabase()  {
		
		ConnectionProvider cp = ASCApp.getDatabaseConnectionProviderSingleton();
		Connection conn = null;
		BufferedReader stream = null;
		Exception exception = null;		
		
		try {
			stream = new BufferedReader(new InputStreamReader(this.getClass().getResourceAsStream("data.sql") ));
			
			conn = cp.getConnection();
			Statement stmt = conn.createStatement();
			while(true) {
				String sql = stream.readLine();
				if(sql == null) break;
				while(sql.indexOf(';') < 0) sql += stream.readLine().trim();
				log("Executing: "+sql);
				stmt.execute(sql);
			}
			
		} catch(Exception ex) {
			exception=ex;
			ex.printStackTrace();
		}
		finally {
			cp.returnConnection(conn,exception != null);
		}
		return exception;
	}

}
