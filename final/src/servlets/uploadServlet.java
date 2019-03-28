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

/**
 * Servlet implementation class addRestaurant
 */
@MultipartConfig(maxFileSize = 16177215) 
@WebServlet("/uploadServlet")
public class uploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadServlet() {
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
		// TODO Auto-generated method stub
		
		  InputStream inputStream = null; // input stream of the upload file
	        HttpSession session = request.getSession();
			String seller_temp=(String)session.getAttribute("user_id");
			int seller_id=Integer.parseInt(seller_temp);
			
	        Part filePart = request.getPart("upd-image");
	        if (filePart != null|filePart.getSize()==0) {
	            // prints out some information for debugging
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	         
	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	        }
	        else {
	        	System.out.println("empty Update pic");
	        }
	  

		System.out.println("------------------------upload done----------------");
//		String locality = request.getParameter("locality");
		
		Home.updatePic(seller_id,inputStream);
		
		response.sendRedirect("Profile.jsp");

//		RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");
//		dispatcher.forward(request, response);

		
		
	}

}
