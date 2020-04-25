import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String uid=request.getParameter("uid");
		String pass=request.getParameter("pass");
		RequestDispatcher rd=null;
		//ServletContext sc=getServletContext();
		HttpSession hs=request.getSession(true);
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
				if(con==null)
					out.println("connect not created");
				else
				{
					System.out.println("connection created");
					PreparedStatement ps=con.prepareStatement("SELECT * FROM J2EE.USERS WHERE USERNAME=? AND PASSWORD=?");
					ps.setString(1, uid);
					ps.setString(2, pass);
					ResultSet rs=ps.executeQuery();
					if(rs.next())
					{
						String role = rs.getString("role");
						response.sendRedirect("Musics.jsp");
						
						hs.setAttribute("username", uid);
						hs.setAttribute("role", role);
					}
					else
					{
						rd=request.getRequestDispatcher("Login.jsp");
					}
					rd.forward(request, response);
				}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}