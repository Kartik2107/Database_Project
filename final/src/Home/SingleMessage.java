package Home;

public class SingleMessage {
	int sender_id;
	int receiver_id;
	String message;
	
	public void setSenderId(int sender) {
		this.sender_id = sender;
	}
	public int getSenderId() {
		return this.sender_id;
	}
	
	public void setReceiverId(int receiver) {
		this.receiver_id = receiver;
	}
	public int getReceiverId() {
		return this.receiver_id;
	}
	
	public void setMessage(String msg) {
		this.message = msg;
	}
	public String getMessage() {
		return this.message;
	}
}
