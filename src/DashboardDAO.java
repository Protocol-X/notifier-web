import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DashboardDAO {
	private Connection connection;

	public DashboardDAO() {
		connection = DbUtil.getConnection();
	}
	
	public List<Integer> widgetAppsCount(){
		List<Integer> widgetOne = new ArrayList<Integer>();
		String query = "select count(*) as apps_count from applerts_db group by app_final_status order by app_final_status desc;";
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(query);
			//System.out.println("I processes the request");
			while (rs.next()) {
				widgetOne.add(rs.getInt("apps_count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return widgetOne;
	}
}
