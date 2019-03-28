package Home;

public class MessageThumb {
	
	int userId;
	String userName;
	String userImage;
	String recentMessage;
	
	public void setUserId(int id) {
		this.userId = id;
	}
	
	public int getUserId(){
		return this.userId;
	}
	
	public void setUserName(String name) {
		this.userName = name;
	}
	
	public String getUserName() {
		return this.userName;
	}
	
	public void setRecentMessage(String message) {
		this.recentMessage = message;
	}
	
	public String getRecentMessage(){
		return this.recentMessage;
	}
	
	public void setUserImage(String image) {
		this.userImage = image;
	}
	
	public String getUserImage(){
		return this.userImage;
	}

}
