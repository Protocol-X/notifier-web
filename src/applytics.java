

import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class applytics
 */
@WebServlet({ "/applytics", "/applytics/*" })
public class applytics extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AppDAO appDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public applytics() {
        super();
        // TODO Auto-generated constructor stub
        appDAO = new AppDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("dapps", appDAO.getDistinctApps());
		 RequestDispatcher view = request.getRequestDispatcher("applytics.jsp");
		 view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] selected = request.getParameterValues("apps");
		

	      // Actual logic goes here.
	response.setContentType("text/html");     
  // PrintWriter out = response.getWriter();
	      //System.out.println(selected.length);
	      List<AppsStat> 	appstats = appDAO.getAppStats(selected);
	      String [] colors = {
	    		  "#E74C3C",
	    		  "#2ECC71",
	    		  "#34495E",
	    		  "#5B2C6F",
	    		  "#F1C40F"
	      };
	      int x =0;
			String chart = "";
	      for (AppsStat temp : appstats) {
	    	  chart = chart + ""
				+ "{"
				+ "label: \'"+temp.appName+"\'"
				+ ",data: " + temp.e_time
				+ ",borderColor: [\'"+ colors[x] + "\',]"
				+ ",backgroundColor: [ \'rgba(255, 99, 132, 0)\',]"
				+ ",borderWidth: 2"
				+ "},";
	    	  x+=1;
				
	      }
	      //out.println(chart);
	      	//request.setAttribute("appstats", appDAO.getAppStats(selected));
	      	request.setAttribute("dapps", appDAO.getDistinctApps());
	      	request.setAttribute("appchart", chart);
			RequestDispatcher view = request.getRequestDispatcher("applytics.jsp");
			view.forward(request, response);
	}

}
