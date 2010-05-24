package com.xm.chatserver;

import org.red5.server.adapter.ApplicationAdapter;
import org.red5.server.api.IConnection;
import org.red5.server.api.service.IServiceCapableConnection;

import com.xm.chatserver.apis.ClientApis;
import com.xm.chatserver.user.User;
import com.xm.chatserver.utils.DateGetter;

public class MainApp extends ApplicationAdapter {
	
	@Override
	public boolean appConnect(IConnection arg0, Object[] arg1) {
		User.addUser((IServiceCapableConnection)arg0,(String)arg1[0]);
		return super.appConnect(arg0, arg1);
	}
	
	@Override
	public void appDisconnect(IConnection arg0) {
		User.removeUserByConnection((IServiceCapableConnection)arg0);
		super.appDisconnect(arg0);
	}
	
	public void sendChatMsgToAll(String senderId,String senderName,String msg){
		User.callAllClient(ClientApis.CHAT_MSG_HANDLER, new Object[]{msg,senderName,DateGetter.getCurrentDate()});
	}
	
	/**
	 * ������ĳ�˽�����Ƶ����
	 * @param targetUserID
	 * @param senderUserID
	 * @param senderName
	 */
	public void reqVideoChat(String targetUserID,String senderUserID,String senderName){
		User user=User.getUser(targetUserID);
		if(user!=null){
			user.callClient(ClientApis.REQ_VIDEO_CHAT_HANDLER, new Object[]{senderUserID,senderName});
		}
	}
	
	/**
	 * ��Ƶ�ļ��ı�ʶ
	 */
	private int videoID=0;
	
	public void createVideoChatSession(String userID1,String userID2){
		User user1=User.getUser(userID1);
		User user2=User.getUser(userID2);
		
		//�涨ÿ���ͻ��������յ��Ĳ����У���һ���������õ�ID���ڶ����Ƿ������õ�ID
		String videoID1="video"+videoID;
		videoID++;
		String videoID2="video"+videoID;
		videoID++;
		
		if(user1!=null){
			user1.callClient(ClientApis.READY_FOR_VIDEO_CHAT_HANDLER, new Object[]{videoID1,videoID2});
		}
		
		if(user2!=null){
			user2.callClient(ClientApis.READY_FOR_VIDEO_CHAT_HANDLER,new Object[]{videoID2,videoID1});
		}
	}
	
	/**
	 * ��ĳ���˷�����Ϣ
	 * @param targetUserID	Ŀ���û�ID
	 * @param senderID 		������ID
	 * @param senderName	����������
	 * @param msg			���͵���Ϣ����
	 */
	public void sendChatMsgTo(String targetUserID,String targetUserName,String senderID,String senderName,String msg){
		User user=User.getUser(targetUserID);
		if(user!=null){
			user.callClient(ClientApis.CHAR_MSG_FROM_HANDLER, new Object[]{senderName,senderID,msg,DateGetter.getCurrentDate()});
		}
		User self=User.getUser(senderID);
		if(self!=null){
			self.callClient(ClientApis.CHAR_MSG_FROM_HANDLER, new Object[]{senderName,targetUserID,msg,DateGetter.getCurrentDate()});
		}
	}
}
