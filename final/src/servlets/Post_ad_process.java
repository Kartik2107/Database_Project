package servlets;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

// import org.apache.tomcat.util.http.fileupload.IOUtils;

import Home.Home;
import Home.item_details;

/**
 * Servlet implementation class addRestaurant
 */
@MultipartConfig(maxFileSize = 16177215) 
@WebServlet("/Post_ad_process")
public class Post_ad_process extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Post_ad_process() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("-----------inpostad backed---------------");
		String category = request.getParameter("catpass");
		System.out.println(category);

        HttpSession session = request.getSession();
        
		String seller_temp=(String)session.getAttribute("user_id");
		int seller_id=Integer.parseInt(seller_temp);
		System.out.println(seller_id);
		
		String product_name=request.getParameter("name");
		System.out.println(product_name);
		//System.out.println(request.getParameter("age"));

		int used=Integer.parseInt(request.getParameter("age"));
		int no_of_units=Integer.parseInt(request.getParameter("units"));
		String description=request.getParameter("description");
		int price=Integer.parseInt(request.getParameter("price"));

		item_details obj=new item_details();//initializing the object 

		//filling the object 
		obj.set_product_name(product_name);
		obj.set_description(description);
		obj.set_price(price);
		obj.set_used(used);
		obj.set_units(no_of_units);
		obj.set_seller_id(seller_id);
		
		if(category.matches("1")){//electronics
			String subcat=request.getParameter("subcategory");
			obj.set_category("Electronics");
			System.out.println(subcat);

			obj.set_subcat(subcat);
			InputStream inputStream1 = null;
			
			Part filePart1 = request.getPart("ePhoto1");
			if (filePart1 != null & filePart1.getSize()!=0) {
			   inputStream1 = filePart1.getInputStream();
			   obj.get_inp1().add(inputStream1);
			}

			InputStream inputStream2 = null;
			Part filePart2 = request.getPart("ePhoto2");
			if (filePart2 != null & filePart2.getSize()!=0) {
			   inputStream2 = filePart2.getInputStream();
			   obj.get_inp1().add(inputStream2);

			}
			InputStream inputStream3 = null;
			Part filePart3 = request.getPart("ePhoto3");
			if (filePart3 != null & filePart3.getSize()!=0) {
			   inputStream3 = filePart3.getInputStream();
			   obj.get_inp1().add(inputStream3);

			}
			InputStream inputStream4 = null;
			Part filePart4 = request.getPart("ePhoto4");
			if (filePart4 != null & filePart4.getSize()!=0) {
			   inputStream4 = filePart4.getInputStream();
			   obj.get_inp1().add(inputStream4);

			}
			InputStream inputStream5 = null;
			Part filePart5 = request.getPart("ePhoto5");
			if (filePart5 != null & filePart5.getSize()!=0) {
			   inputStream5 = filePart5.getInputStream();
			   obj.get_inp1().add(inputStream5);

			}
			
			//filling the object
			Home.ad_post(obj, category);
		}
		else if(category.matches("2")){//food
			obj.set_category("Food");

			InputStream inputStream1 = null;
			Part filePart1 = request.getPart("fphoto1");
			System.out.println("fp1 size->"+filePart1.getSize());
			if (filePart1 != null & filePart1.getSize()!=0) {
//				System.out.println("1st photo mili");
//				System.out.println(filePart1.getName());
//	            System.out.println(filePart1.getSize());
//	            System.out.println(filePart1.getContentType());
//	             
			   inputStream1 = filePart1.getInputStream();
			   obj.get_inp1().add(inputStream1);
			}

			InputStream inputStream2 = null;
			Part filePart2 = request.getPart("fphoto2");
			System.out.println("fp2 size->"+filePart2.getSize());
			if (filePart2.getSize()!=0 & filePart2.getSize()!=0) {
//				System.out.println("2nd photo mili");
//				System.out.println(filePart2.getName());
//	            System.out.println(filePart2.getSize());
//	            System.out.println(filePart2.getContentType());
	             
			   inputStream2 = filePart2.getInputStream();
			   obj.get_inp1().add(inputStream2);

			}
			InputStream inputStream3 = null;
			Part filePart3 = request.getPart("fphoto3");
			System.out.println("fp3 size->"+filePart3.getSize());
			if (filePart3 != null & filePart3.getSize()!=0) {
//				System.out.println("3rd photo mili");
			   inputStream3 = filePart3.getInputStream();
			   obj.get_inp1().add(inputStream3);

			}
			InputStream inputStream4 = null;
			Part filePart4 = request.getPart("fphoto4");
			
			if (filePart4 != null & filePart4.getSize()!=0) {
//				System.out.println("4th photo mili");

			   inputStream4 = filePart4.getInputStream();
			   obj.get_inp1().add(inputStream4);

			}
			InputStream inputStream5 = null;
			Part filePart5 = request.getPart("fphoto5");
			if (filePart5 != null & filePart5.getSize()!=0 ) {
//				System.out.println("5th photo mili");

			   inputStream5 = filePart5.getInputStream();
			   obj.get_inp1().add(inputStream5);
			}
			Home.ad_post(obj, category);

		}
		else if(category.matches("3")){//cycle
			obj.set_category("Cycle");

			String gears=request.getParameter("gear");
			String shockers=request.getParameter("shockers");
			String brakes=request.getParameter("brakes");
			obj.set_gears(gears);
			obj.set_shockers(shockers);
			obj.set_brakes(brakes);
			InputStream inputStream1 = null;
			Part filePart1 = request.getPart("cphoto1");
			if (filePart1 != null & filePart1.getSize()!=0) {
			   inputStream1 = filePart1.getInputStream();
			   obj.get_inp1().add(inputStream1);
			}

			InputStream inputStream2 = null;
			Part filePart2 = request.getPart("cphoto2");
			if (filePart2 != null & filePart2.getSize()!=0) {
			   inputStream2 = filePart2.getInputStream();
			   obj.get_inp1().add(inputStream2);

			}
			InputStream inputStream3 = null;
			Part filePart3 = request.getPart("cphoto3");
			if (filePart3 != null & filePart3.getSize()!=0) {
			   inputStream3 = filePart3.getInputStream();
			   obj.get_inp1().add(inputStream3);

			}
			InputStream inputStream4 = null;
			Part filePart4 = request.getPart("cphoto4");
			if (filePart4 != null & filePart4.getSize()!=0) {
			   inputStream4 = filePart4.getInputStream();
			   obj.get_inp1().add(inputStream4);

			}
			InputStream inputStream5 = null;
			Part filePart5 = request.getPart("cphoto5");
			if (filePart5 != null & filePart5.getSize()!=0) {
			   inputStream5 = filePart5.getInputStream();
			   obj.get_inp1().add(inputStream5);
			}
			Home.ad_post(obj, category);

		}
		else if(category.matches("4")){//mattress
			String roll=request.getParameter("roll");
			obj.set_roll(roll);
			obj.set_category("Mattress");

			InputStream inputStream1 = null;
			Part filePart1 = request.getPart("mphoto1");
			if (filePart1 != null & filePart1.getSize()!=0) {
			   inputStream1 = filePart1.getInputStream();
			   obj.get_inp1().add(inputStream1);
			}

			InputStream inputStream2 = null;
			Part filePart2 = request.getPart("mphoto2");
			if (filePart2 != null  & filePart2.getSize()!=0) {
			   inputStream2 = filePart2.getInputStream();
			   obj.get_inp1().add(inputStream2);

			}
			InputStream inputStream3 = null;
			Part filePart3 = request.getPart("mphoto3");
			if (filePart3 != null & filePart3.getSize()!=0) {
			   inputStream3 = filePart3.getInputStream();
			   obj.get_inp1().add(inputStream3);

			}
			InputStream inputStream4 = null;
			Part filePart4 = request.getPart("mphoto4");
			if (filePart4 != null & filePart4.getSize()!=0) {
			   inputStream4 = filePart4.getInputStream();
			   obj.get_inp1().add(inputStream4);

			}
			InputStream inputStream5 = null;
			Part filePart5 = request.getPart("mphoto5");
			if (filePart5 != null & filePart5.getSize()!=0) {
			   inputStream5 = filePart5.getInputStream();
			   obj.get_inp1().add(inputStream5);
			}
			Home.ad_post(obj, category);

		}
		else if(category.matches("5")){//book
			obj.set_category("Book");

			String branch=request.getParameter("branch");
			int year=Integer.parseInt(request.getParameter("year"));
			String acad=request.getParameter("type");
			obj.set_book_academic(acad);
			obj.set_book_branch(branch);
			obj.set_book_year(year);
			
			InputStream inputStream1 = null;
			Part filePart1 = request.getPart("bphoto1");
			if (filePart1 != null & filePart1.getSize()!=0) {
			   inputStream1 = filePart1.getInputStream();
			   obj.get_inp1().add(inputStream1);
			}

			InputStream inputStream2 = null;
			Part filePart2 = request.getPart("bphoto2");
			if (filePart2 != null  & filePart2.getSize()!=0) {
			   inputStream2 = filePart2.getInputStream();
			   obj.get_inp1().add(inputStream2);

			}
			InputStream inputStream3 = null;
			Part filePart3 = request.getPart("bphoto3");
			if (filePart3 != null & filePart3.getSize()!=0) {
			   inputStream3 = filePart3.getInputStream();
			   obj.get_inp1().add(inputStream3);

			}
			InputStream inputStream4 = null;
			Part filePart4 = request.getPart("bphoto4");
			if (filePart4 != null & filePart4.getSize()!=0) {
			   inputStream4 = filePart4.getInputStream();
			   obj.get_inp1().add(inputStream4);

			}
			InputStream inputStream5 = null;
			Part filePart5 = request.getPart("bphoto5");
			if (filePart5 != null & filePart5.getSize()!=0) {
			   inputStream5 = filePart5.getInputStream();
			   obj.get_inp1().add(inputStream5);
			}
			Home.ad_post(obj, category);


		}
		else if(category.matches("6")){//others
			obj.set_category("Others");
			
			InputStream inputStream1 = null;
			Part filePart1 = request.getPart("sphoto1");
			if (filePart1 != null & filePart1.getSize()!=0) {
			   inputStream1 = filePart1.getInputStream();
			   obj.get_inp1().add(inputStream1);
			}

			InputStream inputStream2 = null;
			Part filePart2 = request.getPart("sphoto2");
			if (filePart2 != null & filePart2.getSize()!=0) {
			   inputStream2 = filePart2.getInputStream();
			   obj.get_inp1().add(inputStream2);

			}
			InputStream inputStream3 = null;
			Part filePart3 = request.getPart("sphoto3");
			if (filePart3 != null & filePart3.getSize()!=0) {
			   inputStream3 = filePart3.getInputStream();
			   obj.get_inp1().add(inputStream3);

			}
			InputStream inputStream4 = null;
			Part filePart4 = request.getPart("sphoto4");
			if (filePart4 != null & filePart4.getSize()!=0) {
			   inputStream4 = filePart4.getInputStream();
			   obj.get_inp1().add(inputStream4);

			}
			InputStream inputStream5 = null;
			Part filePart5 = request.getPart("sphoto5");
			if (filePart5 != null & filePart5.getSize()!=0) {
			   inputStream5 = filePart5.getInputStream();
			   obj.get_inp1().add(inputStream5);
			}
			
			Home.ad_post(obj, category);

			
		}
//
//		RequestDispatcher dispatcher = request.getRequestDispatcher("loginPage.jsp");
//		dispatcher.forward(request, response);
		response.sendRedirect("Ads.jsp");
	}

}
