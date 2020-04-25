

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddMusic
 */
@WebServlet("/AddMusic")
public class AddMusic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMusic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		String artist=request.getParameter("artist");
		String url=request.getParameter("url");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
				if(con==null)
					out.println("connection not created");
				else
				{
					System.out.println("connection created");
					PreparedStatement ps=con.prepareStatement("INSERT INTO J2EE.MUSICS VALUES (?,?,?)");
					ps.setString(1, name);
					ps.setString(2, artist);
					ps.setString(3, url);
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
