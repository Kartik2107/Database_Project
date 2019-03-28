package Home;

import java.io.InputStream;

import java.util.ArrayList;
import java.util.List;

public class users {
	int user_id;
	String user_passwd;
	String user_name;
	String user_phone;
	String user_email;
	float user_rating_seller;
	float user_rating_buyer;
	String user_hostel;
	String user_image;

	
	public void setu_id(int a) {
		this.user_id = a;
	}
	public int getu_id() {
		return this.user_id;
	}
	
	public void setu_passwd(String a) {
		this.user_passwd = a;
	}
	public String getu_passwd() {
		return this.user_passwd;
	}
	
	public void setu_name(String a) {
		this.user_name = a;
	}
	public String getu_name() {
		return this.user_name;
	}
	
	public void setu_phone(String a) {
		this.user_phone = a;
	}
	public String getu_phone() {
		return this.user_phone;
	}
	
	public void setu_email(String a) {
		this.user_email = a;
	}
	public String getu_email() {
		return this.user_email;
	}
	
	public void setu_hostel(String a) {
		this.user_hostel = a;
	}
	public String getu_hostel() {
		return this.user_hostel;
	}
	
	
	public void setu_buy_rat(float a) {
		this.user_rating_buyer = a;
	}
	public float getu_buy_rat() {
		return this.user_rating_buyer;
	}
	
	public void setu_sel_rat(float a) {
		this.user_rating_seller = a;
	}
	public float getu_sel_rat() {
		return this.user_rating_seller;
	}	
	
	public void setu_image(String a) {
		this.user_image = a;
	}
	public String getu_image() {
		return this.user_image;
	}
	
}