package servlets;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

// import org.apache.tomcat.util.http.fileupload.IOUtils;


import Home.Home;

/**
 * Servlet implementation class addRestaurant
 */
@MultipartConfig(maxFileSize = 16177215) 
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		String id = request.getParameter("newroll");
		String name = request.getParameter("fname");
		String phone= request.getParameter("phone");
		String email = id+"@iitdh.ac.in";
		String hostel = request.getParameter("hno");
		Part filePart=request.getPart("newpic");
		
		  InputStream inputStream = null; 
	        if (filePart != null) {
	            // prints out some information for debugging
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	        }
		
		
		String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		int count=5;
		StringBuilder builder = new StringBuilder();
			while (count-- != 0) {
				int character = (int)(Math.random()*ALPHA_NUMERIC_STRING.length());
				builder.append(ALPHA_NUMERIC_STRING.charAt(character));
			}
			String random_otp=builder.toString();
		System.out.println(random_otp);
		
		
        try{
            String host ="smtp.gmail.com" ;
            String user = "buy.sell.iitdh@gmail.com";
            String pass = "HenrikhMkhitaryan";
            String to = email;
            String from = "buy.sell.iitdh@gmail.com";
            String subject = "Buy and Sell IITDh";
            
            String messageText = "Thank you for registering at Buy and Sell for IIT-Dh.\n Username->"+name+"\n Password->"+random_otp;
            
            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "25");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

         //   java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            msg.setText(messageText);

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
   		   Home.addAccount(id,name,phone,email,hostel,random_otp,inputStream);

           System.out.println("message send successfully");
           
           RequestDispatcher dispatcher = request.getRequestDispatcher("alert_signUp.jsp");
   			dispatcher.forward(request, response);
        }catch(Exception ex)
        {
            System.out.println(ex);
            RequestDispatcher dispatcher = request.getRequestDispatcher("signUp_failed.jsp");
    		dispatcher.forward(request, response);
        }
		
		
		

		
		
	}

}
