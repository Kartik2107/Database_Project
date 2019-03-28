package Home;

import java.io.InputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Ads {
	
	int product_id;
	String product_name;
	String category;
	Timestamp posted_on;
	double price;
	int unit_rem;
	int unit_sold;
	int buyer_id ;
	String buyer_name;
	Timestamp sold_on;
	String photo;
	
	public void seta_product_id(int a) {
		this.product_id = a;
	}
	public int geta_product_id() {
		return this.product_id ;
	}
	
	public void seta_product_name(String a) {
		this.product_name = a;
	}
	public String geta_product_name() {
		return this.product_name ;
	}
	
	public void seta_photo(String a) {
		this.photo = a;
	}
	public String geta_photo() {
		return this.photo ;
	}
	
	public void seta_category(String a) {
		this.category = a;
	}
	public String geta_category() {
		return this.category ;
	}
	
	public void seta_postedon(Timestamp a) {
		this.posted_on = a;
	}
	public Timestamp geta_postedon() {
		return this.posted_on ;
	}
	
	public void seta_solddon(Timestamp a) {
		this.posted_on = a;
	}
	public Timestamp geta_soldon() {
		return this.posted_on ;
	}
	
	public void seta_unitsold(int a) {
		this.unit_sold = a;
	}
	public int geta_unitsold() {
		return this.unit_sold ;
	}
	
	public void seta_unitrem(int a) {
		this.unit_rem = a;
	}
	public int geta_unitrem() {
		return this.unit_rem ;
	}
	
	public void seta_buyerid(int a) {
		this.buyer_id = a;
	}
	public int geta_buyer_id() {
		return this.buyer_id ;
	}
	
	public void seta_buyername(String a) {
		this.buyer_name = a;
	}
	public String geta_buyer_name() {
		return this.buyer_name ;
	}
	public void seta_price(double a) {
		this.price = a;
	}
	public double geta_price() {
		return this.price ;
	}
	
}