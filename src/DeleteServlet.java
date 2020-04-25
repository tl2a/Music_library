import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String table=request.getParameter("table");
		String iwth=request.getParameter("iwth");
		String iden=request.getParameter("iden");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
				if(con==null)
					out.println("connect not created");
				else
				{
					System.out.println("connection created");
					String query = "DELETE FROM J2EE." + table + " WHERE "+ iwth +"=?";
					PreparedStatement ps=con.prepareStatement(query);
					//ps.setString(1, table);
					ps.setString(1, iden);
					int x=ps.executeUpdate();
					if(x>0)
						response.sendRedirect("Musics.jsp");
					else
						out.println("Something went wrong!");
				}
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}

}