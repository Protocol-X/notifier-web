

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login_validate
 */
@WebServlet("/login_validate")
public class login_validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String userID = "admin";
	private final String password = "admin";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login_validate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");

	      // Actual logic goes here.
	      
	      String user = request.getParameter("user");
			String pwd = request.getParameter("pwd");
			
			if(userID.equals(user) && password.equals(pwd)){
				HttpSession session = request.getSession();
				session.setAttribute("eyes-logged-username", user);
				session.setAttribute("eyes-logged-usertype", "admin");
				session.setAttribute("eyes-logged-logstate", "loggedin");

				response.sendRedirect("dashboardinfo");
			}else{
				PrintWriter out= response.getWriter();
				out.println("<font color=red>Either user name or password is wrong.</font>" + user + "   "+ pwd);
				response.sendRedirect("login.jsp?message=failure");
			}
		
	}

}
