

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DashboardInfo
 */
@WebServlet({ "/DashboardInfo", "/dashboardinfo" })
public class DashboardInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DashboardDAO dashboard;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardInfo() {
        super();
        // TODO Auto-generated constructor stub
        dashboard = new DashboardDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("I too the request");
		
		 request.setAttribute("widgetOne", dashboard.widgetAppsCount());
		 //System.out.println("I too the response");
		 RequestDispatcher view = request.getRequestDispatcher("main.jsp");
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
