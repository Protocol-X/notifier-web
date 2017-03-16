import java.util.Arrays;

public class AppsStat {
	
	String appName;
	String e_time;
	int elapse_time[] = new int[10];
	public AppsStat(){	}
	
	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getE_time() {
		return e_time;
	}

	public void setE_time(String e_time) {
		this.e_time = e_time;
	}

	public int[] getElapse_time() {
		return elapse_time;
	}

	public void setElapse_time(int[] elapse_time) {
		this.elapse_time = elapse_time;
	}

	@Override
	public String toString() {
		return "AppsStat [appName=" + appName + ", elapse_time=" + Arrays.toString(elapse_time) + "]";
	}
	
}
