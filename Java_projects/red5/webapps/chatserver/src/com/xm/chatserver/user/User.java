package com.xm.chatserver.user;

import java.util.ArrayList;
import java.util.List;

import org.red5.server.api.service.IServiceCapableConnection;

import com.xm.chatserver.apis.ClientApis;

public class User {

	private static List<User> users=new ArrayList<User>();
	
	public static void addUser(IServiceCapableConnection connection,String userName) {
		User user=new User(connection,userName);
		users.add(user);
		
		sendUserListToAllClient();
	}
	
	public static void callAllClient(String methodName,Object[] objs){
		for (User user : users) {
			user.callClient(methodName,objs);
		}
	}
	
	public static void callAllClient(String methodName){
		for (User user : users) {
			user.callClient(methodName);
		}
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public static User getUser(String id){
		for (User user : users) {
			if (user.getUserID().equals(id)) {
				return user;
			}
		}
		return null;
	}
	
	public static void removeUserByConnection(IServiceCapableConnection connection) {
		for (User user : users) {
			if(connection.equals(user.connection)){
				users.remove(user);
				break;
			}
		}
		
		sendUserListToAllClient();
	}
	
	/**
	 * 向所有在线用户发送当前用户数组
	 */
	private static void sendUserListToAllClient() {
		List<AmfReadableUser> amfReadableUsers=new ArrayList<AmfReadableUser>();
		for (User user : users) {
			AmfReadableUser amfReadableUser=new AmfReadableUser();
			amfReadableUser.userID=user.getUserID();
			amfReadableUser.userName=user.getUserName();
			amfReadableUsers.add(amfReadableUser);
		}
		callAllClient(ClientApis.USER_LIST_HANDLER, new Object[]{amfReadableUsers});
	}
	
	private IServiceCapableConnection connection;
	
	
	/**
	 * 构造函数
	 * @param connection
	 */
	public User(IServiceCapableConnection connection,String userName) {
		this.connection=connection;
		this.setUserName(userName);
		
		//通知客户端ID
		this.callClient(ClientApis.USER_ID_HANDLER,new Object[]{this.getUserID()});
	}
	
	private String userNameString="";
	
	public void setUserName(String value) {
		userNameString=value;
	}
	
	public String getUserName() {
		return userNameString;
	}
	
	public void callClient(String methodName,Object[] objs){
		this.connection.invoke(methodName, objs);
	}
	
	public void callClient(String methodName){
		this.connection.invoke(methodName);
	}
	
	public String getUserID() {
		return this.connection.getClient().getId();
	}
}