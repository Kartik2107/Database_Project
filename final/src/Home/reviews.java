package Home;


public class reviews {
	
	int reviewer_id;//jisne review kara
	float rating;//kya rate kiya	
	String review;
	int role;//jisko rate kiya wo buyer tha ya seller
	String photo;
	
	public void setr_revid(int a) {
		this.reviewer_id = a;
	}
	public int getr_revid() {
		return this.reviewer_id ;
	}

	public void setr_rat(float a) {
		this.rating = a;
	}
	public float getr_rat() {
		return this.rating ;
	}
	
	public void setr_review(String a) {
		this.review = a;
	}
	public String getr_review() {
		return this.review ;
	}
	
	public void setr_role(int a) {
		this.role = a;
	}
	public int getr_role() {
		return this.role ;
	}
	
	public void setr_photo(String a) {
		this.photo = a;
	}
	public String getr_photo() {
		return this.photo ;
	}
	
}
