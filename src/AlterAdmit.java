import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/AlterAdmit")
public class AlterAdmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlterAdmit() {
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
		String user=request.getParameter("user");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
				if(con==null)
					out.println("connection not created");
				else
				{
					System.out.println("connection created");
					PreparedStatement ps=con.prepareStatement("UPDATE J2EE.USERS SET role = 'admin' WHERE username = ?");
					ps.setString(1, user);
					int x=ps.executeUpdate();
					if(x>0)
						response.sendRedirect("Users.jsp");
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