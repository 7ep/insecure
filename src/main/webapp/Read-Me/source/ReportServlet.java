package asc;
/**
Original author L.Angrave. Copyright 2005 IsthmusGroup, Madison Wisconsin.
Licensed under the Apache License 2.0, 
http://www.apache.org/licenses/LICENSE-2.0
 */
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 */
public class ReportServlet extends HttpServlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response)
		 throws IOException, ServletException {

		
		String reportName = ""; // request.getParameter("name");
		
		String path = request.getPathInfo();
		if(path != null) {
			//strip leading / if it's present (it should be according to the servlet spec)
			reportName = path.startsWith("/") ? path.substring(1) : path; 
		}
		
		String format = "pdf";

		String htmlValue = null;
		Connection conn = null;
		InputStream is = null;
		try {
			
			is = getServletContext().getResourceAsStream("WEB-INF/reports/" +reportName.trim());
			
			if (is != null) {
				BufferedInputStream bis = new BufferedInputStream(is);
				response.setContentType("application/pdf");
				response.setHeader("Content-Disposition", "inline; filename=\"report.pdf\"");
				//response.setContentLength(bytes.length);
				ServletOutputStream ouputStream = response.getOutputStream();
				byte byteBuffer[] = new byte[8192];
				while(true) {
				int bytesRead = is.read(byteBuffer);
				if(bytesRead < 0) break;
				ouputStream.write(byteBuffer, 0, bytesRead);
				}
				
				ouputStream.flush();
				ouputStream.close();
				
				byteBuffer = null;
			} else {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.println("<html>");
				out.println("<head>");
				out.println("<title>Report Error</title>");
				out.println("</head>");
				out.println("<body bgcolor=\"white\">");
				out.println("Report '"+reportName+"' could not be generated:");
				out.println("</body>");
				out.println("</html>");
				out.flush();				
			}

		} catch (Exception e) {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Report Error</title>");
			out.println("</head>");
			out.println("<body bgcolor=\"white\">");
			out.println("The Report could not be generated:"+e.getMessage());
			out.println("</body>");
			out.println("</html>");
			out.flush();
		} finally {
			if(is != null ) try { is.close();} catch(Exception ignored) {}
			
		}


	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
		 throws IOException, ServletException {
		//
		/*
		* IE has problems loading plugins that result in multiple calls 
		* to the plugin. The following code will try and handle this 
		* problem and perform as expected. The request will still be sent
		* multiple times, however it will only be processed once.
		*/
		String theAgent = request.getHeader("user-agent");

		/*
		* IE5 sends a user-agent of contype on the first request, so this can 
		* be ignored
		*/
		if (request.getHeader("user-agent").equals("contype")) {
			response.setContentType("application/pdf");
			response.setStatus(HttpServletResponse.SC_OK);
			return;
		}
		/*
		* IE 5.5 and IE 6 only has an accept-language header on the first 
		* request so if present ignore this request 
		*/
		else if (theAgent.indexOf("MSIE") != -1){
			if (request.getHeader("accept-language") != null) {
				response.setContentType("application/pdf");
				response.setStatus(HttpServletResponse.SC_OK); 
				return; 
			}
		}
	}
		

}
