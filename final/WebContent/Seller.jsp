
<%@ page import="java.util.*"%>
<%@ page import="Home.*" %>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Buy and Sell : IIT Dharwad</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">

	<meta name="keywords" content="Realtie a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}

    function change_nav_inf(){
      document.getElementById("sel_rev").style.fontWeight="100";
      document.getElementById("nav2").style.backgroundColor="#e5e8e8";
      document.getElementById("add_rev").style.fontWeight="100";
      document.getElementById("nav3").style.backgroundColor="#e5e8e8";
      document.getElementById("gen_inf").style.fontWeight=null;
      document.getElementById("nav1").style.backgroundColor="white";

      document.getElementById("review").style.display="none";
      document.getElementById("add").style.display="none";
      document.getElementById("info").style.display=null;
    }

    function change_nav_rev(){
      document.getElementById("gen_inf").style.fontWeight="100";
      document.getElementById("nav1").style.backgroundColor="#e5e8e8";
      document.getElementById("add_rev").style.fontWeight="100";
      document.getElementById("nav3").style.backgroundColor="#e5e8e8";
      document.getElementById("sel_rev").style.fontWeight=null;
      document.getElementById("nav2").style.backgroundColor="white";

      document.getElementById("info").style.display="none";
      document.getElementById("add").style.display="none";
      document.getElementById("review").style.display=null;
    }

    function change_nav_add(){
      document.getElementById("gen_inf").style.fontWeight="100";
      document.getElementById("nav1").style.backgroundColor="#e5e8e8";
      document.getElementById("sel_rev").style.fontWeight="100";
      document.getElementById("nav2").style.backgroundColor="#e5e8e8";
      document.getElementById("add_rev").style.fontWeight=null;
      document.getElementById("nav3").style.backgroundColor="white";

      document.getElementById("info").style.display="none";
      document.getElementById("review").style.display="none";
      document.getElementById("add").style.display=null;
    }


	</script>

	<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
	<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
	<link href="css/style.css" rel='stylesheet' type='text/css' />
	<link href="css/fontawesome-all.css" rel="stylesheet">
  <link rel="stylesheet" href="css/circle.css">
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
			window.location.href="index_aman.jsp";
		}
	</script>
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
						<li class="nav-item active">
							<a class="nav-link" href="loginPage.jsp">Home
								<span class="sr-only">(current)</span>
							</a>
						</li>
						<li class="nav-item ml-xl-2">
							<a class="nav-link" href="Message.jsp">Messages</a>
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
<%
int id=0;
try{
	String str = ((String)session.getAttribute("user_id") == null) ? "0" : (String)session.getAttribute("user_id");
	id= Integer.parseInt(str);
}
catch(NullPointerException e){
	System.out.println("nullpointerexception");
}
if(id==0){
	out.print("<script>alert(\"You have already been logged out.\")</script>");
	response.addHeader("REFRESH","10;URL=index_aman.jsp");        
}

String reviewed = request.getParameter("revhyp");//incoming hyperlink
users a=new users();
System.out.println("reviewer ka->"+id);
System.out.println("reviewed hyplink ka->"+reviewed);
a=Home.user_info(Integer.parseInt(reviewed));

//System.out.println("hno->"+a.getu_hostel());
//System.out.println("id->"+a.getu_id());

System.out.println(a.getu_name());
%>
  <!--modify search-->
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
  <!-- search ends -->

  <br><br><br><br>
  <!-- content begins -->
  <div class="row">
    <div class="col-1"></div>

    <div class="col-10">
      <div class="row">
        <!-- left hand side -->
        <div class="col-4">
          <!--image-->
          <div class="row" style="height:300px; justify-content: center">
          
          <% 
        	  out.print("<img style=\"max-height:100%; max-width:100%; border-radius:500px\" src='data:image/jpeg;base64,"+a.getu_image()+"' \"/>"); 

          %>
          <%
				float ab2= Math.round(a.getu_sel_rat()*10)/(float)10;
			%>
          </div>
          <!--below image -->
          <div class="row">
            <div class="border" style="width:70%; height:190px; padding-top:5px; margin:10px auto;">
              <center><font size="5" style="font-weight:100;">Average Rating</font></center> <hr style="margin:5px auto;">
              
<!--                <div class="c100 p50 text-center" style="margin-left:25%">
                  <span>4.3</span> -->
             <% out.println("<div style=\"margin-left:25%;\" class=\"c100 p"+Math.round(a.getu_sel_rat())*20+"\" text-center>");%>
                <% out.println("<span>"+ab2+"</span>"); %>  
                                  
                  <div class="slice">
                     <div class="bar"></div>
                     <div class="fill"></div>
                  </div>
               </div>
            </div>
          </div>
        </div>

        <!-- right hand side -->
        <div class="col-8 border">

          <!-- navigation -->
          <div class="row" style="height:40px;">
            <div id="nav1" class="col-4" style="cursor:pointer"><h5 class="text-center mt-2" onclick="change_nav_inf()" id="gen_inf">Information</h5></div>
            <div id="nav2" class="col-4" style="background-color:#e5e8e8; cursor:pointer"><h5 class="text-center mt-2" onclick="change_nav_rev()" id="sel_rev" style="font-weight:100">Customer Reviews</h5></div>
            <div id="nav3" class="col-4" style="background-color:#e5e8e8; cursor:pointer"><h5 class="text-center mt-2" onclick="change_nav_add()" id="add_rev" style="font-weight:100">Add Review</h5></div>
          </div>
          <!-- navigated content -->

          <!-- information division-->
          <div id="info" class="row">
            <div class="col-12">
              <br>
              <h3 class="pl-2">General</h3><hr class="mt-1"><br>
              <div class="row">
                <div class="col-3" style="text-align:right">
                  <span class="aman_seller">
                    Name :
                    <br><br>
                    Roll No :
                    <br><br>
                  <span>
                </div>
                <div class="col-9">
                  <span class="aman_seller">
                  <%out.print(a.getu_name()); %>
                  <br><br>
                  <%out.print(a.getu_id()); %>
                  <br><br>
                </span>
                </div>
              </div>

              <br>
              <h3 class="pl-2">Contact Info</h3><hr class="mt-1"><br>
              <div class="row">
                <div class="col-3" style="text-align:right">
                  <span class="aman_seller">
                    Hostel No :
                    <br><br>
                    Mobile No :
                    <br><br>
                    Email :
                    <br><br>
                  <span>
                </div>
                <div class="col-9">
                  <span class="aman_seller">
                  <%out.print(a.getu_hostel()); %>
                  <br><br>
                <%out.print(a.getu_phone()); %>
                  <br><br>
				<%out.print(a.getu_email()); %>
                  </span>
                </div>
              </div>
            </div>
          </div>
          <!-- information division ends -->
          
           <!-- review section -->
          <div id="review" class="row" style="display:none">
            <div class="col-12">
 
<%
List <reviews> b=new ArrayList<>();
b = Home.get_user_ratings(Integer.parseInt(reviewed),0);
int reviewer1;
double rating;
String review;
String photo;

if(b.size()>0){
	int j=0;
	reviewer1 = b.get(j).getr_revid();
	rating = b.get(j).getr_rat();
	review = b.get(j).getr_review();
	photo = b.get(j).getr_photo();
	
       out.println( "<div class=\"row\" style=\"height:170px; margin-top:35px\"> ");
       out.println( "<div class=\"col-1\"></div>");
       out.println( "<div class=\"col-3\">");
       out.println(  " <img style=\"max-height:100%; max-width:100%; border-radius:500px\" src='data:image/jpeg;base64,"+photo+"'>");
       out.println( "</div>");
       out.println( "<div class=\"col-7\">");
       out.println(   "<br>");
       out.println(   "<b>Name</b> :"+ reviewer1 +" <br>");
       out.println(   "<b>Rating</b> :"+ Math.round(rating*10)/(float)10 +"<br><br>");
       out.println(   "<b>Review</b> :" + review +"<br>");
       out.println( "</div>");
       out.println( "<div class=\"col-1\"></div>");
       out.println("</div>");
       out.println("<hr>");
}
for(int i=1 ; i<b.size(); i++){
	reviewer1 = b.get(i).getr_revid();
	rating = b.get(i).getr_rat();
	review = b.get(i).getr_review();
	photo = b.get(i).getr_photo();
	
       out.println( "<div class=\"row\" style=\"height:170px; margin-top:35px;\"> ");
       out.println( "<div class=\"col-1\"></div>");
       out.println( "<div class=\"col-3\">");
       out.println(  " <img style=\"max-height:100%; max-width:100%; border-radius:500px\" src='data:image/jpeg;base64,"+photo+"'>");
       out.println( "</div>");
       out.println( "<div class=\"col-7\">");
       out.println(   "<br>");
       out.println(   "<b>Name</b> :"+ reviewer1+" <br>");
       out.println(   "<b>Rating</b> :"+ Math.round(rating*10)/(float)10 +"<br><br>");
       out.println(   "<b>Review</b> :" + review +"<br>");
       out.println( "</div>");
       out.println( "<div class=\"col-1\"></div>");
       out.println("</div>");
       out.println("<hr>");
}


%>

<!--               <div class="row" style="height:200px">
                <div class="col-3 my-auto">
                  <img src="images/team2.jpg" style="max-width:100%; max-height:100%; border-radius:500px">
                </div>
                <div class="col-9 my-auto">
                  <span class="aman_seller">
                  <b>Name</b> : Namit Bhardwaj<br><br>
                </span>
                  <b>Rating</b> : 4.3<br>
                  <b>Review</b> : Myself coming from village area
                </div>
              </div>
              
              <hr>

              <div class="row" style="height:200px">
                <div class="col-3 my-auto">
                  <img src="images/team3.jpg" style="max-width:100%; max-height:100%; border-radius:500px">
                </div>
                <div class="col-9 my-auto">
                  <span class="aman_seller">
                  <b>Name</b> : Kartik Kataria<br><br>
                </span>
                  <b>Rating</b> : 3.3<br>
                  <b>Review</b> : Aree yaar, nashta chaiye yaar
                </div>
              </div>
 -->
            </div>
          </div>
          <!-- review section ends-->

          <!-- add review section begins -->
          <form id='addrev' method="post" action='addReview.jsp'>
            <br><br>
            <% out.println("<input type='hidden' name='revd' value=\""+a.getu_id()+"\">");%>
            <div class="row" id="add" style="display:none;">
              <div class="col-3 mt-2" style="text-align:right; font-size:20px;">
                <label for="rating">Rating</label> <br><br><br>
                <label for="review">Review</label>
              </div>
              <div class="col-9">
                <!-- <input class="form-input-small" type="number" placeholder="Rate the seller" id="rating" name="rating"><br><br><br> -->
                
          
              	<fieldset class="rating">
                	<input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="5 stars"></label>
                	<input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="4 stars"></label>
                	<input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="3 stars"></label>
                	<input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="2 stars"></label>
                	<input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="1 star"></label>
            	</fieldset>
            
            	<br><br><br>
          
                <input class="form-input" style="height:200px" type="text" placeholder="Express your opinion" id="review" name="review">
              </div>

              <button class="upd-image-btn" style="margin-top:50px" type="submit">Submit Review</button>
            </div>
          </form>
          <!-- add review section ends -->

          <!-- navigated content ends -->
        </div>
      </div>
    </div>

    <div class="col-1"></div>
  </div>
  <!-- content ends -->

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
            <a class="facebook" href="#">
              <i class="fab fa-facebook-f"></i>
              <a href="https://www.facebook.com/iitdharwadofficial">Facebook</a>
            </a>
          </li>
          <li>
            <a class="facebook" href="#">
              <i class="fab fa-twitter"></i>
              <a href="https://twitter.com/iitdhrwd">Twitter</a>
            </a>
          </li>
          <li class="mx-3">
            <a class="facebook" href="#">
              <i class="fab fa-youtube"></i>
              <a href="https://www.youtube.com/channel/UCG_M5tP34-uO-Jkr9Q7VDsA">Youtube</a>
            </a>
          </li>
        </ul>
      </div>

    </div>
  </div>
  </footer>
  <!---->

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
  <!-- js file -->


  <script type="text/javascript">
  function readURL(input,id) {
    console.log("readURL funtion me aaya");
    if (input.files && input.files[0]) {
      var imageId="#"+id+"1";
      console.log(imageId);
        var reader = new FileReader();
        reader.onload = function (e) {
          console.log(e.target.resut);
          $(imageId).attr('src', e.target.result);
        }
      reader.readAsDataURL(input.files[0]);
    }
  }
  function a(id){
    console.log(id);
    readURL(document.getElementById(id),id);
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

</body>

</html>
