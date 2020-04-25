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
@WebServlet("/AddFavorite")
public class AddFavorite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFavorite() {
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
		String name=request.getParameter("a-name");
		String artist=request.getParameter("a-artist");
		String url=request.getParameter("a-url");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
				if(con==null)
					out.println("connection not created");
				else
				{
					System.out.println("connection created");
					PreparedStatement ps=con.prepareStatement("INSERT INTO J2EE.FAVORITES VALUES (?,?,?,?)");
					ps.setString(1, user);
					ps.setString(2, name);
					ps.setString(3, artist);
					ps.setString(4, url);
					int x=ps.executeUpdate();
					if(x>0)
						response.sendRedirect("Favorite.jsp");
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