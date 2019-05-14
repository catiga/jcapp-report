import com.jeancoder.app.sdk.server.DevServer;

public class ReportMainTest {
	public static void main(String[] args) throws Exception {
		String fp = System.getProperty("user.dir");
		DevServer.start(8099, fp);
	}
}
