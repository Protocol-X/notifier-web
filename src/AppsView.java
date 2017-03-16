

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AppsView
 */
@WebServlet({ "/AppsView", "/AppsView/*" })
public class AppsView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AppDAO appDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppsView() {
        super();
        appDAO = new AppDAO();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		 String action = request.getParameter("action");		 
		 if (action == null ) action = "NONE";
		 
		 request.setAttribute("apps", appDAO.getAllUsers(action));
		 RequestDispatcher view = request.getRequestDispatcher("listApps.jsp");
		 view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
