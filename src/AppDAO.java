import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AppDAO {
	private Connection connection;

	public AppDAO() {
		connection = DbUtil.getConnection();
	}
		
		public List<AppPOJO> getAllUsers(String type) {
			List<AppPOJO> apps = new ArrayList<AppPOJO>();
			String query = "select "
					+ " app_id"
					+ ",app_name"
					+ ",app_user"
					+ ",app_final_status"
					+ ",app_type"
					+ ",app_url"
					+ ",app_start_time"
					+ ",app_finish_time"
					+ ",app_elapsed_time"
					+ ",app_diagnostics"
					+ " from applerts_db ";

			
			if (type.equalsIgnoreCase("all")){
				query = query + " where 0=0";
			} else if(type.equalsIgnoreCase("success")){
				query = query + " where app_final_status = 'SUCCEEDED' ";
			} else if(type.equalsIgnoreCase("failed")){
				query = query + " where app_final_status = 'FAILED' "	;
			} else if(type.equalsIgnoreCase("killed")){
				query = query + " where app_final_status = 'KILLED' "	;
			} else {
				query = query + " where 0!=0";
			}
			
			try {
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(query);
				while (rs.next()) {
					AppPOJO app = new AppPOJO();
					app.setId				(rs.getString("app_id"));
			        app.setName				(rs.getString("app_name"));
			        app.setUser				(rs.getString("app_user"));
			        app.setFinalStatus		(rs.getString("app_final_status"));
			        app.setTrackingUrl		(rs.getString("app_url"));
			        app.setApplicationType	(rs.getString("app_type"));
			        app.setStartedTime		(rs.getString("app_start_time"));
			        app.setFinishedTime		(rs.getString("app_finish_time"));
			        app.setElapsedTime		(rs.getString("app_elapsed_time"));
			        app.setDiagnostics		(rs.getString("app_diagnostics"));
			        apps.add(app);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return apps;
		}
		public List<String> getDistinctApps(){
			List<String> appnames = new ArrayList<String>();
			
			String query = "select distinct app_name from applerts_db order by app_name asc";
			try {
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(query);
				while (rs.next()) {
					appnames.add(rs.getString("app_name"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return appnames;
		}
		
		public List<AppsStat>  getAppStats(String[] appnames){
			List<AppsStat> 	appstats 	= new ArrayList<AppsStat>()	;			
			AppsStat 		astat									;
			
			int app_no 			= appnames.length	;
			int loop 			= 0					;
			int elapse_time[] = new int[10];	
			Arrays.fill(elapse_time,0);
			
			while (loop	<	app_no){	
				astat 		= new AppsStat()			;
				astat.appName = appnames[loop];				
				try {
					PreparedStatement preparedStatement = connection.prepareStatement("select app_elapsed_time/1000 as elapsed_time from applerts_db where app_name =? limit 10");
					preparedStatement.setString(1, appnames[loop]);
					ResultSet rs = preparedStatement.executeQuery();
					int stats	= 9;
					while (rs.next()) {
						elapse_time[stats] = rs.getInt("elapsed_time");
						stats--;		
					}
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				astat.e_time =Arrays.toString(elapse_time);
				appstats.add(astat);
				loop++;
			}
			return appstats;
		}		
	}




