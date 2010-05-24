import org.red5.server.adapter.ApplicationAdapter;
import org.red5.server.api.IConnection;


public class MainApp extends ApplicationAdapter{
	
	@Override
	public boolean appConnect(IConnection arg0, Object[] arg1) {
		log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>"+arg1[0]+"connected,and his password is:"+arg1[1]);
		return super.appConnect(arg0, arg1);
	}
}
