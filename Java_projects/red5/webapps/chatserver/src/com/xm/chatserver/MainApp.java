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
	 * 请求与某人进行视频聊天
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
	 * 视频文件的标识
	 */
	private int videoID=0;
	
	public void createVideoChatSession(String userID1,String userID2){
		User user1=User.getUser(userID1);
		User user2=User.getUser(userID2);
		
		//规定每个客户端所接收到的参数中，第一个播放所用的ID，第二个是发布所用的ID
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
	 * 向某个人发送消息
	 * @param targetUserID	目标用户ID
	 * @param senderID 		发送者ID
	 * @param senderName	发送者名字
	 * @param msg			发送的消息内容
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
