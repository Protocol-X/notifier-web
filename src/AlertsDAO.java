import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AlertsDAO {
	private Connection connection;

	public AlertsDAO() {
		connection = DbUtil.getConnection();
	}
		
		public List<AlertsPOJO> getAllAlerts() {
			List<AlertsPOJO> alerts = new ArrayList<AlertsPOJO>();
			String query = "select id,"
					+ "app_name,"
					+ "email,"
					+ "is_enabled"					
					+ " from alerts";

			try {
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(query);
				while (rs.next()) {
					AlertsPOJO alert = new AlertsPOJO();
					
					alert.setId			(rs.getString("id"))		;
					alert.setApp_name	(rs.getString("app_name"))	;
					alert.setEmail		(rs.getString("email"))		;
					alert.setIs_enabled	(rs.getString("is_enabled"));
					
					alerts.add(alert);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return alerts;
		}
		
		public boolean addAlert(String app_name, String email){
			
			try {
				PreparedStatement preparedStatement = connection
						.prepareStatement("insert into alerts(app_name,email,is_enabled) values (?, ?, ? )");
				// Parameters start with 1
				preparedStatement.setString(1, app_name);
				preparedStatement.setString(2, email);
				preparedStatement.setString(3, "true");
				preparedStatement.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return false;
		}
		
		public void deleteAlert(int id) {
			try {
				PreparedStatement preparedStatement = connection
						.prepareStatement("delete from alerts where id=?");
				// Parameters start with 1
				preparedStatement.setInt(1, id);
				preparedStatement.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}


