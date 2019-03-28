package Home;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class item_details {
	String category;
	int product_id;
	String product_name;
	int used;
	int seller_id;
	String seller_name;
	int price;
	String roll;
	String subcat;
	String gears;
	String brakes;
	String shockers;
	String product_image;
	String description;
	int units;
	
	
	String seller_phone;
	
	List<InputStream> inp1=new ArrayList<InputStream>();
	List<String> out1=new ArrayList<String>();
	
	int book_year;
	String book_branch;
	String book_academic;
	
	
	public void set_seller_phone(String a) {
		this.seller_phone=a;
	}
	public String get_seller_phone() {
		return this.seller_phone;
	}
	
	public void set_inp1(InputStream a) {
		this.inp1.add(a);
	}
	public List<InputStream> get_inp1() {
		return this.inp1;
	}
	public void set_out1(String a) {
		this.out1.add(a);
	}
	public List<String> get_out1() {
		return this.out1;
	}
	
	public void set_product_image(String a) {
		this.product_image=a;
	}
	public String get_product_image() {
		return this.product_image;
	}
	
	public void set_book_year(int a) {
		this.book_year=a;
	}
	public int get_book_year() {
		return this.book_year;
	}
	
	public void set_book_branch(String a) {
		this.book_branch=a;
	}
	public String get_book_branch() {
		return this.book_branch;
	}
	
	public void set_book_academic(String a) {
		this.book_academic=a;
	}
	public String get_book_academic() {
		return this.book_academic;
	}
	
	/*public enum subcat{
		Mobile,Laptop,Tablet,Speakers,Headphones_Earphones,Accessories,Others;
	}
	public enum gears{
		front,back,front_back;
	}
	public enum brakes{
		disk,power,regular;
	}*/
	
	public void set_roll(String a) {
		this.roll=a;
	}
	public String get_roll() {
		return this.roll;
	}
	
	
	public void set_seller_name(String a) {
		this.seller_name=a;
	}
	public String get_seller_name() {
		return this.seller_name;
	}
	
	public void set_seller_id(int a) {
		this.seller_id=a;
	}
	public int get_seller_id() {
		return this.seller_id;
	}
	
	public void set_product_name(String a) {
		this.product_name=a;
	}
	public String get_product_name() {
		return this.product_name;
	}
	
	public void set_category(String a) {
		this.category=a;
	}
	public String get_category() {
		return this.category;
	}
	
	public void set_product_id(int a) {
		this.product_id=a;
	}
	public int get_product_id() {
		return this.product_id;
	}
	
	public void set_used(int a) {
		this.used=a;
	}
	public int get_used() {
		return this.used;
	}
	
	public void set_price(int a) {
		this.price=a;
	}
	public int get_price() {
		return this.price;
	}
	
	public void set_subcat(String a) {
		this.subcat=a;
	}
	public String get_subcat() {
		return this.subcat;
	}
	
	public void set_gears(String a) {
		this.gears=a;
	}
	public String get_gears() {
		return this.gears;
	}
	
	public void set_shockers(String a) {
		this.shockers=a;
	}
	public String get_shockers() {
		return this.shockers;
	}
	
	public void set_brakes(String a) {
		this.brakes=a;
	}
	public String get_brakes() {
		return this.brakes;
	}
	
	public void set_description(String a) {
		this.description=a;
	}
	public String get_description() {
		return this.description;
	}
	
	public void set_units(int a) {
		this.units=a;
	}
	public int get_units() {
		return this.units;
	}
	
	
}

