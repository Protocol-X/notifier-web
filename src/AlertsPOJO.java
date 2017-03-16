
public class AlertsPOJO {
	String id;
	String app_name;
	String email;
	String is_enabled;

	public AlertsPOJO(){}


	public AlertsPOJO(String id, String app_name, String email, String is_enabled) {
		super();
		this.id = id;
		this.app_name = app_name;
		this.email = email;
		this.is_enabled = is_enabled;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getApp_name() {
		return app_name;
	}

	public void setApp_name(String app_name) {
		this.app_name = app_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIs_enabled() {
		return is_enabled;
	}

	public void setIs_enabled(String is_enabled) {
		this.is_enabled = is_enabled;
	}
	
	@Override
	public String toString() {
		return "AlertsPOJO [id=" + id + ", app_name=" + app_name + ", email=" + email + ", is_enabled=" + is_enabled
				+ "]";
	}
	
}
