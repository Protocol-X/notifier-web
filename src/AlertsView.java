
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AlertsView
 */
@WebServlet({ "/AlertsView", "/alertsview","/alertsview/*" })
public class AlertsView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AlertsDAO alertsDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlertsView() {
        super();
        // TODO Auto-generated constructor stub
        alertsDAO = new AlertsDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String forward = "listAlerts.jsp";
		String action = request.getParameter("action");
		if (action == null) action="";
		if (action.equalsIgnoreCase("delete")){
			int id = Integer.parseInt(request.getParameter("id"));
			alertsDAO.deleteAlert(id);
		}
		request.setAttribute("alerts", alertsDAO.getAllAlerts());
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String forward = "listAlerts.jsp";
		String app_name = request.getParameter("appname");
		String email	= request.getParameter("alertemail");
		alertsDAO.addAlert(app_name, email);
		request.setAttribute("alerts", alertsDAO.getAllAlerts());
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

}
