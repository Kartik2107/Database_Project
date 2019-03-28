<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="Home.*" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Buy and Sell : IIT Dharwad</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">

	<meta name="keywords" content="Realtie a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

	<script>
	
		var schedule;
		
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
		
		function sendInfo(id){
			var v=<%out.print((String)session.getAttribute("user_id"));%>;
			var u=id;
			var url="message_server.jsp?sender="+v+"&receiver="+u;
			
			if(window.XMLHttpRequest){
				request=new XMLHttpRequest();
			}
			else if(window.ActiveXObject){
				request=new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			try{
				request.onreadystatechange=getInfo;
				request.open("POST",url,true);
				request.send();
			}
			catch(e){
				alert("Unable to connect to server");
			}
		}
		
		var sh;
		
		function change_tab(id, name){
			//alert(name);
			var a = name;
		
			if(a=="null"){
				//alert("null checked");
				document.getElementById("msgName").innerHTML = "--";
			}
			else{
				document.getElementById("msgName").innerHTML = name;
			}
			
			var x = document.getElementsByName("thumbnail");
			
			var i;
			for(i=0; i<x.length; i++){
				if(x[i].id==id){
					x[i].style.backgroundColor="#e5e8e8";
				}
				else{
					x[i].style.backgroundColor=null;
				}
			}
			
			document.getElementById("receiver").value=id;
			//alert("hello");
			
			document.getElementById("recentMsg").innerHTML=null;
			
			document.getElementById("sendButton").name=name;
			//alert("hello1");
			
			clearInterval(schedule);
			sendInfo(id);
			schedule = window.setInterval(function(){sendInfo(id)}, 50);
			
			setTimeout(function(){document.getElementById("scroll").scrollTop = 1832; sh = document.getElementById("scroll").scrollHeight;},100);	
		}
		
		
		
		
		function getInfo(){
			if(request.readyState==4){
				var val=request.responseText;
				$('#msg').html(null);
				$('#msg').html(val);
				
				//console.log(sh);
				if(sh < document.getElementById("scroll").scrollHeight){
					//console.log("news" + (document.getElementById("scroll").scrollHeight + 5000));
					setTimeout(function(){document.getElementById("scroll").scrollTop = (document.getElementById("scroll").scrollHeight + 1000) ;},100);
				}
			}
		}
		
		function submitMessage(name){
			var sender = <%out.print((String)session.getAttribute("user_id"));%>;
			var receiver = document.getElementById("receiver").value;
			var msg = document.getElementById("message").value;
			
			if(msg == ""){
				alert("please type a message");	
			}
			
			else{
			var emsg=encodeURIComponent(msg);
			var url="sendMessage.jsp?sender="+sender+"&receiver="+receiver+"&msg="+emsg;
			//alert(emsg);
			if(window.XMLHttpRequest){
				request=new XMLHttpRequest();
			}
			else if(window.ActiveXObject){
				request=new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			try{
				request.onreadystatechange=getInfo;
				request.open("GET",url,true);
				request.send();
			}
			catch(e){
				alert("Unable to connect to server");
			}
			
			document.getElementById("message").value=null;
		
			change_tab(receiver, name);
			}
		}
	</script>


	<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
	<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
	<link href="css/style.css" rel='stylesheet' type='text/css' />
	<link href="css/fontawesome-all.css" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
	
	
		<style>
	.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;
  display: inline-block;
}


.autocomplete-items {
  margin-right:5px;
  margin-left:5px;
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

.autocomplete-items div:hover {
  /*when hovering an item:*/
  background-color: #e9e9e9; 
}

.autocomplete-active {
  /*when navigating through the items using the arrow keys:*/
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
	</style>
</head>

<body>
<script>
		var v=<%out.print((String)session.getAttribute("loggedin"));%>
		if(v){
			//alert("hey"+v);
		}
		else{
			alert("You have already been logged out.");
			window.location.href="index_aman.jsp";
		}
	</script>
	<!-- header -->
	<div style="background-color:black;">
		<header>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<a class="navbar-brand" href="loginPage.jsp">IIT-Dh : Buy and Sell</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
				    aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon">
						<i class="fas fa-bars"></i>
					</span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item">
							<a class="nav-link" href="loginPage.jsp">Home</a>
						</li>
						<li class="nav-item ml-xl-2 active">
							<a class="nav-link" href="Message.jsp">Messages
							<span class="sr-only">(current)</span>
							</a>
						</li>
						<li class="nav-item ml-xl-2">
							<a class="nav-link" href="Ads.jsp">Your Ads</a>
						</li>
						<li class="nav-item ml-xl-2">
							<a class="nav-link" href="PostAd.jsp">Post an Ad</a>
						</li>
						<li class="nav-item ml-xl-2">
							<a class="nav-link" href="Profile.jsp">Profile</a>
						</li>
						<li class="nav-item ml-xl-2">
							<a class="nav-link" href="logout.jsp">LogOut</a>
						</li>
					</ul>
				</div>
			</nav>
		</header>
	</div>
	<!-- header ends -->

 	<!-- modify search -->
 	
  	<div id="search_form" class="search_top text-center" style="padding-top:20px; padding-bottom:20px; background-color: #00a591;">
	    <h3>Buy what you need, Sell what you don't</h3>
					<form action="ElectronicsResult.jsp" method="post" id="bksubmit" class="ban-form row" style="padding-left:4cm;">
					<div class="col-md-3 banf">
						<select class="form-control" id="country12" required>
							<option value="" disabled selected>Category</option>
          					<option value="Electronics">Electronics</option>
					        <option value="Food">Food</option>
					        <option value="Cycle">Cycle</option>
					        <option value="Mattress">Mattress</option>
					        <option value="Book">Books</option>
					        <option value="Others">Stationary and Others</option>
						</select>
					</div>
					<div class="col-md-3 banf">
						<input class="form-control" id="country" name="country" onkeypress="sendAut()" type="text" name="Name" placeholder="Name">
					</div>

					<div class="col-md-3 banf">
						<input class="form-control" onclick="searchElt()" type="button" style="height:50px; border:1px solid #ffc107; background-color:#ffc107; color:white; font-weight:700; font-size:20px" value="Search">
					</div>
				</form>
	</div>
	<!--  modify search ends -->
	
	<!-- container -->
  <div class="row mt-2" style="max-width:100%">
    <div class="col-1"></div>
    <div class="col-3">
      <div class="row border">
        <div class="col-12 text-center mt-2 mb-2">
          <h5>Messenger</h5>
        </div>
      </div>

      <div class="row" style="height:800px; overflow:scroll">
        <div class="col-12 border">
        
        <!-- division in loop -->
        
        <% 
        int id=0;
        try{
        	String str = ((String)session.getAttribute("user_id") == null) ? "0" : (String)session.getAttribute("user_id");
        	id= Integer.parseInt(str);
        }
        catch(NullPointerException e){
        	System.out.println("nullpointerexception"+e);
        }

        List<MessageThumb> recent = new ArrayList<>();
       	recent=Home.recentMessages(id);
    	System.out.println("id in message jsp->"+id);
    	System.out.println(recent.size());

		MessageThumb obj=new MessageThumb();

        if(id==0){
        	out.print("<script>alert(\"You have already been logged out.\")</script>");
        	response.addHeader("REFRESH","10;URL=index_aman.jsp");        
        }
        else{
        	if(recent == null || recent.isEmpty()){
        		System.out.println("No messages yet, say something");
        	}
        	else{        	
        	 	obj = recent.get(0);
        	 	System.out.println("********in messagejsp****" + obj.getUserId() + "************ #");
			       	out.println("<div class=\"row border\" id="+obj.getUserId()+" name=\"thumbnail\" onclick=\"change_tab(this.id,'"+obj.getUserName()+"')\" style=\"height:100px; background-color:#e5e8e8\">");
			       	out.println("	<div class=\"col-4 my-auto\">");
			        out.println("		<img src='data:image/*;base64,"+obj.getUserImage()+"'style=\"max-width:100%; max-height:90px; border-radius:500px\">");
			       	out.println("	</div>");
			       	out.println("	<div class=\"col-8 my-auto\">");
			       	out.println("<div class=\"row\">");
			        out.println("		<b>"+obj.getUserName()+"</b><br>");
			        out.println("</div>");
			        out.println("<div class=\"row\" id=\"recentMsg\">");
			        out.println("<span style=\"display:block; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;\">"+obj.getRecentMessage()+"</span>");
			        out.println("</div>");
			       	out.println("	</div>");
			     	out.println("</div>");
	        	
	        	for(int i=1; i<recent.size(); i++){
	        		MessageThumb object = recent.get(i);
	        		System.out.println("************" + object.getUserId() + "************");
	          		out.println("<div class=\"row border\" id="+object.getUserId()+" name=\"thumbnail\" onclick=\"change_tab(this.id,'"+object.getUserName()+"')\" style=\"height:100px;\">");
	            	out.println("	<div class=\"col-4 my-auto\">");
	              	out.println("		<img src='data:image/*;base64,"+object.getUserImage()+"'style=\"max-width:100%; max-height:90px; border-radius:500px\">");
	            	out.println("	</div>");
	            	out.println("	<div class=\"col-8 my-auto\">");
	            	out.println("<div class=\"row\">");
			        out.println("		<b>"+object.getUserName()+"</b><br>");
			        out.println("</div>");
			        out.println("<div class=\"row\" id=\"recentMsg\">");
			        out.println("<span style=\"display:block; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;\">"+object.getRecentMessage()+"</span>");
			        out.println("</div>");
			        out.println("</div>");;
	          		out.println("</div>");
	        	}
        	}
        }
          %>
          <!-- div ends here -->

        </div>
      </div>

    </div>
    <div class="col-7">
      <div class="row border">
        <div class="col-12 text-right mt-2 mb-2 pr-5">
          <h5><a href="#" style="color:black; cursor:pointer" id="msgName"></a></h5>
        </div>
      </div>

	
      <!-- ye message ka division hai -->
      <div class="row border" style="height:690px; overflow:scroll; border-bottom:0px !important" id="scroll">
        <div class="col-12 mt-2 mb-2" id="msg">
			        
			        <!-- iska content ajax se aata hai -->

        </div>
      </div>
      <!-- message division ends -->
      
      <div class="row" style="height:10px; border-right:1px solid #e5e8e8; border-left:1px solid #e5e8e8"></div>

	<div class="row border" style="height:100px">
        <div class="col-10">
          <input class="msg-box" type="text" id="message" name="message" required>
        </div>
        	<input type="hidden" name="receiver" id="receiver" value="<%out.print(obj.getUserId());%>">
        <div class="col-2 my-auto text-center">
          <button class="send-btn" id="sendButton" name="<%out.print(obj.getUserName());%>" onclick="submitMessage(this.name)">Send</button>
        </div>
      </div>
      
     

    </div>
    <div class="col-1"></div>
  </div>
  <!-- container ends -->
  
	<!-- footer -->
	<footer style="padding-top:80px">
  	<div class="footer-cpy p-lg-4 p-md-3 p-3 container-fluid">
    	<div class="row">
      	<div class="col-lg-6 copyrightbottom text-left">
        	<h3>
          		<a class="navbar-brand" href="loginPage.jsp">IIT-Dh : Buy and Sell</a>
        	</h3>
        	<p>© 2018 <a href="http://www.iitdh.ac.in">IIT Dharwad</a> | Design by
          		<a href="mailto:160010004@iitdh.ac.in">Aman Jaiswal</a>,
          		<a href="mailto:160010036@iitdh.ac.in">Namit Bhardwaj</a>,
          		<a href="mailto:160030015@iitdh.ac.in">Kartik Kataria</a>
        	</p>
      	</div>

      	<div class="col-lg-6 copyrighttop mt-3 text-right">
        	<ul>
          		<li class="mx-3">
            		<a class="facebook" href="#">              		<i class="fab fa-facebook-f"></i>
            		</a>
          		</li>
          		<li>
            		<a class="facebook" href="#">
              		<i class="fab fa-twitter"></i>
            		</a>
          		</li>
          		<li class="mx-3">
            		<a class="facebook" href="#">
              		<i class="fab fa-youtube"></i>
            		</a>
          		</li>
        	</ul>
      	</div>

    	</div>
  	</div>
  	</footer>
  	<!-- footer ends -->

  <!-- /.footer -->
  <script src="js/jquery-2.2.3.min.js"></script>

  <!-- carousel -->
  <script src="js/owl.carousel.js"></script>
  <script>
    $(document).ready(function () {
      $('.owl-carousel').owlCarousel({
        loop: true,
        margin: 10,
        responsiveClass: true,
        responsive: {
          0: {
            items: 1,
            nav: true
          },
          600: {
            items: 2,
            nav: false
          },
          900: {
            items: 3,
            nav: false
          },
          1000: {
            items: 4,
            nav: true,
            loop: false,
            margin: 20
          }
        }
      })
    })
  </script>
  <!-- //carousel -->
  <!-- stats -->
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.countup.js"></script>
  <script>
    $('.counter').countUp();
  </script>
  <!-- //stats -->
  <!-- flexSlider -->
  <script defer src="js/jquery.flexslider.js"></script>
  <script>
    $(window).load(function () {
      $('.flexslider').flexslider({
        animation: "slide",
        start: function (slider) {
          $('body').removeClass('loading');
        }
      });
    });
  </script>
  <!-- //flexSlider -->
  <!-- start-smooth-scrolling -->
  <script src="js/move-top.js"></script>
  <script src="js/easing.js"></script>
  <script>
    jQuery(document).ready(function ($) {
      $(".scroll").click(function (event) {
        event.preventDefault();

        $('html,body').animate({
          scrollTop: $(this.hash).offset().top
        }, 1000);
      });
    });
  </script>
  <!-- //end-smooth-scrolling -->
  <!-- dropdown nav -->
  <script>
    $(document).ready(function () {
      $(".dropdown").hover(
        function () {
          $('.dropdown-menu', this).stop(true, true).slideDown("fast");
          $(this).toggleClass('open');
        },
        function () {
          $('.dropdown-menu', this).stop(true, true).slideUp("fast");
          $(this).toggleClass('open');
        }
      );
    });
  </script>
  <!-- //dropdown nav -->
  <!-- smooth-scrolling-of-move-up -->
  <script>
    $(document).ready(function () {
    	
    	change_tab(<%out.print(obj.getUserId());%>, '<%out.print(obj.getUserName());%>');
    	setTimeout(function(){document.getElementById("scroll").scrollTop = 1832;},100);
    	
    	
    	
      /*
      var defaults = {
          containerID: 'toTop', // fading element id
          containerHoverID: 'toTopHover', // fading element hover id
          scrollSpeed: 1200,
          easingType: 'linear'
      };
      */

      $().UItoTop({
        easingType: 'easeOutQuart'
      });

    });
  </script>
  
  <!-- //smooth-scrolling-of-move-up -->
  <script src="js/bootstrap.js"></script>
     <script>
  function send_Filter_and_Search_Info(){//filter and sort 
  //	 alert("hello");
  	//
  	  var name_search=document.getElementById("name_search").value;
  	  var price=$('input[name=price]:checked').val();
      if(typeof price=="undefined"){
     	 price="";
      }
      var used=$('input[name=used]:checked').val();
      if(typeof used=="undefined"){
     	 used="";
      }
      var url="filterres.jsp?category=Other&price="+price+"&used="+used+"&name_used="+name_used;
       //alert(url);
       if(window.XMLHttpRequest){
      	 fil=new XMLHttpRequest();
       }
       else if(window.ActiveXObject){
       	fil=new ActiveXObject("Microsoft.XMLHTTP");
       }

       try
       {
      	 //alert(url);
	         fil.onreadystatechange=get_Filter_and_Search_Info;
	         fil.open("GET",url,true);
	         fil.send();
       }
       catch(e)
       {
       	alert("Unable to connect to server");
       }
   }
	
   function get_Filter_and_Search_Info(){
  	 //alert("aa gya");
       if(fil.readyState==4){
	         var val=fil.responseText;
	   		alert(val);

	   		$('#content_main').html(val);
	   		
       	//document.getElementById('col-8').innerHTML=val;
	     }
   }

  
  </script>
  <script>
	var catsearch;
	function autocomplete(inp, arr) {
		  /*the autocomplete function takes two arguments,
		  the text field element and an array of possible autocompleted values:*/
		  var currentFocus;
		  //alert("hello");
		  /*execute a function when someone writes in the text field:*/
		  inp.addEventListener("input", function(e) {
		      var a, b, i, val = this.value;
		      /*close any already open lists of autocompleted values*/
		      closeAllLists();
		      if (!val) { return false;}
		      currentFocus = -1;
		      /*create a DIV element that will contain the items (values):*/
		      a = document.createElement("DIV");
		      a.setAttribute("id", this.id + "autocomplete-list");
		      a.setAttribute("class", "autocomplete-items");
		      /*append the DIV element as a child of the autocomplete container:*/
		      this.parentNode.appendChild(a);
		      /*for each item in the array...*/
		      for (i = 0; i < arr.length; i++) {
		        /*check if the item starts with the same letters as the text field value:*/
		        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
		          /*create a DIV element for each matching element:*/
		          b = document.createElement("DIV");
		          /*make the matching letters bold:*/
		          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
		          b.innerHTML += arr[i].substr(val.length);
		          /*insert a input field that will hold the current array item's value:*/
		          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
		          /*execute a function when someone clicks on the item value (DIV element):*/
		          b.addEventListener("click", function(e) {
		              /*insert the value for the autocomplete text field:*/
		              inp.value = this.getElementsByTagName("input")[0].value;
		              /*close the list of autocompleted values,
		              (or any other open lists of autocompleted values:*/
		              closeAllLists();
		          });
		          a.appendChild(b);
		        }
		      }
		  });
		  /*execute a function presses a key on the keyboard:*/
		  inp.addEventListener("keydown", function(e) {
		      var x = document.getElementById(this.id + "autocomplete-list");
		      if (x) x = x.getElementsByTagName("div");
		      if (e.keyCode == 40) {
		        /*If the arrow DOWN key is pressed,
		        increase the currentFocus variable:*/
		        currentFocus++;
		        /*and and make the current item more visible:*/
		        addActive(x);
		      } else if (e.keyCode == 38) { //up
		        /*If the arrow UP key is pressed,
		        decrease the currentFocus variable:*/
		        currentFocus--;
		        /*and and make the current item more visible:*/
		        addActive(x);
		      } else if (e.keyCode == 13) {
		        /*If the ENTER key is pressed, prevent the form from being submitted,*/
		        e.preventDefault();
		        if (currentFocus > -1) {
		          /*and simulate a click on the "active" item:*/
		          if (x) x[currentFocus].click();
		        }
		      }
		  });
		  function addActive(x) {
		    /*a function to classify an item as "active":*/
		    if (!x) return false;
		    /*start by removing the "active" class on all items:*/
		    removeActive(x);
		    if (currentFocus >= x.length) currentFocus = 0;
		    if (currentFocus < 0) currentFocus = (x.length - 1);
		    /*add class "autocomplete-active":*/
		    x[currentFocus].classList.add("autocomplete-active");
		  }
		  function removeActive(x) {
		    /*a function to remove the "active" class from all autocomplete items:*/
		    for (var i = 0; i < x.length; i++) {
		      x[i].classList.remove("autocomplete-active");
		    }
		  }
		  function closeAllLists(elmnt) {
		    /*close all autocomplete lists in the document,
		    except the one passed as an argument:*/
		    var x = document.getElementsByClassName("autocomplete-items");
		    for (var i = 0; i < x.length; i++) {
		      if (elmnt != x[i] && elmnt != inp) {
		        x[i].parentNode.removeChild(x[i]);
		      }
		    }
		  }
		  /*execute a function when someone clicks in the document:*/
		  document.addEventListener("click", function (e) {
		      closeAllLists(e.target);
		  });
		}
		var ashlulz;

		function sendAut(){
		  	var catsearch=document.getElementById("country12").value;
			//alert(catsearch);
			var url="autocomp.jsp?category="+catsearch;
			
			if(window.XMLHttpRequest){
				ashlulz=new XMLHttpRequest();
			}
			else if(window.ActiveXObject){
				ashlulz=new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			try{
				ashlulz.onreadystatechange=getAut;
				ashlulz.open("GET",url,true);
				ashlulz.send();
			}
			catch(e){
			alert("Unable to connect to server");
			}
		}

		function getAut(){
			//alert("hello1122");
			if(ashlulz.readyState==4){
			//alert("hello");
			var val1=ashlulz.responseText;
			//alert(val1);
			var str_array = val1.split(',');
			//alert(str_array);
			for(var i = 0; i < str_array.length; i++) {
				   // Trim the excess whitespace.
				   str_array[i] = str_array[i].replace(/^\s*/, "").replace(/\s*$/, "");
				   // Add additional code here, such as:
				   //alert(str_array[i]);
				}
			//alert(str_array[0]);
			//alert(countries1[0]);
			
			autocomplete(document.getElementById("country"),str_array);
			}
		}
		function searchElt(){
			var x1="Electronics";
			var x2="Food";
			var x3="Cycle";
			var x4="Mattress";
			var x5="Book";
			var x6="Others";
		  	var xtest=document.getElementById("country12").value;
		  	if(x1===xtest){
		  		document.getElementById('bksubmit').action="ElectronicsResult.jsp";
				document.getElementById('bksubmit').submit();
		  	}
		  	else if(x2===xtest){
		  		document.getElementById('bksubmit').action="FoodResult.jsp";
				document.getElementById('bksubmit').submit();
		  	}
		  	else if(x3===xtest){
		  		document.getElementById('bksubmit').action="CycleResult.jsp";
				document.getElementById('bksubmit').submit();
		  	}
		  	else if(x4===xtest){
		  		document.getElementById('bksubmit').action="MattressResult.jsp";
				document.getElementById('bksubmit').submit();
		  	}
		  	else if(x5===xtest){
		  		document.getElementById('bksubmit').action="BookResult.jsp";
				document.getElementById('bksubmit').submit();
		  	}
		  	else if(x6===xtest){
		  		document.getElementById('bksubmit').action="OtherResult.jsp";
				document.getElementById('bksubmit').submit();
		  	}
		}

	</script>
  <!-- js file -->
</body>

</html>
	