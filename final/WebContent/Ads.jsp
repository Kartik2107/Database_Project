<%@ page import="java.util.*"%>
<%@ page import="Home.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Buy and Sell : IIT Dharwad</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">

	<meta name="keywords" content="Realtie a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

  <svg style="display: none;">
  <symbol id="star" viewBox="0 0 98 92">
  <path stroke='#000' stroke-width='5' d='M49 73.5L22.55 87.406l5.05-29.453-21.398-20.86 29.573-4.296L49 6l13.225 26.797 29.573 4.297-21.4 20.86 5.052 29.452z' fill-rule='evenodd'/>
  </svg>

	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}

    function which_ad(){
      if(document.getElementById('ad1').checked){
        document.getElementById("ad21").style.display="none";
        document.getElementById("ad11").style.display=null;
      }
      else if(document.getElementById("ad2").checked){
        document.getElementById("ad11").style.display="none";
        document.getElementById("ad21").style.display=null;
      }
    }
	</script>

	<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
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
			//alert("else");
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
						<li class="nav-item">
							<a class="nav-link" href="loginPage.jsp">Home
							</a>
						</li>
						<li class="nav-item ml-xl-2">
							<a class="nav-link" href="Message.jsp">Messages</a>
						</li>
						<li class="nav-item ml-xl-2 active">
							<a class="nav-link" href="Ads.jsp">Your Ads
							<span class="sr-only">(current)</span>
							</a>
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

  <br><br>

  <div class="heading" style="padding-top:5px; margin-bottom:5px">
    <center>YOUR ADS</center>
  </div>

  <center>
  <div class="tabs">
    <ul class="nav nav-pills justify-content-center" id="pills-tab" role="tablist">
      <li class="nav-item" style="width:10%; text-align:center">
        <a class="nav-link active" id="pills-profile-tab" data-toggle="pill" role="tab" aria-controls="pills-profile" aria-selected="true">Ad Status</a>
      </li>
    </ul>
  </div>
  </center>
  <div class="sorts-ad" style="display:block;" id="sort">
    <br>
    <form class="form-inline">
      <div class="col-6">
        <center>
          <input type="radio" onclick="which_ad()" name="ad" id="ad1" style="margin-right:5px;" checked>Current Ads</input>
        </center>
      </div>
      <div class="col-6">
        <center>
          <input type="radio" onclick="which_ad()" name="ad"  id="ad2" style="margin-right:5px;">Past Ads</input>
        </center>
      </div>
    </form>
    <br>
  </div>

  <br><br>


  <!-- current Ads format -->
  <div class="row" style="max-width:100%" id="ad11">
    <div class="col-2"></div>
    <div class="col-8">
<%

// yaha pr tu seller ki id daal de
int id=0;
System.out.println((String)session.getAttribute("user_id"));
try{
	String str = ((String)session.getAttribute("user_id") == null) ? "0" : (String)session.getAttribute("user_id");
	id= Integer.parseInt(str);
}
catch(NullPointerException e){
	System.out.println("nullpointerexception");
}
if(id==0){
	response.sendRedirect("http://localhost:8080/p3/index_aman.jsp");
}

List <Ad_details> l = new ArrayList<Ad_details>();
Ad_details current = new Ad_details() ;
l = Home.postedads(id) ;

for(int i=0 ; i<l.size(); i++){
	current = l.get(i);

      out.println("<div class=\"row\" style=\"height:250px\"> ");
      out.println(" <div class=\"col-3 my-auto text-center\"> ");
      out.println("  <img style=\"max-height:250px !important; max-width:100% !important;\" src='data:image/jpeg;base64,"+current.geta_photo()+"' > ");
      out.println(" </div>");
      out.println(" <div class=\"col-7 my-auto\"> ");
      out.println("		<h5>"+current.geta_product_name()+"</h5>");
      out.println("		<br>");
      out.println("		<h3>Rs. "+current.geta_price()+"</h3>");
      out.println("		<br>");
      out.println("		<b>Category</b> : "+current.geta_category() +"<br>");
      Date dNow2 = current.geta_postedon();
      SimpleDateFormat ft = 
      new SimpleDateFormat ("dd/MM/yyyy");
      
     
      out.println("		<b>Posted On</b> : "+ft.format(dNow2) +"<br>");
      out.println("		<b>Units remaining</b> : "+current.geta_unitrem() );

   	  out.println("	</div>");
      out.println(" <div class=\"col-2 my-auto\"> ");
      out.println("		<button class=\"ur-ad\" id=\""+current.geta_product_id()+"\" style=\"background-color:#ffc107\" onclick=\"display_modal(this.id,"+current.geta_unitrem()+")\">Sold</button><br><br> ");
      out.print("<form action='delete_item.jsp' method='post'>");
      out.println("		<button class=\"ur-ad\" style=\"background-color:red\" name='del_id' onclick=\"delete_item.jsp\" value=\""+current.geta_product_id()+"\"> Delete</button> ");
      out.println("</form>");
      out.println("	</div>");
      out.println("</div>");
      out.println("<hr>");
}
%>
    </div>
    <div class="col-2"></div>
  </div>

  <!-- current Ads format ends -->

  <!-- past Ads format -->
  <div class="row" id="ad21" style="display:none">
    <div class="col-2"></div>
    <div class="col-8">

<%
// yaha pr tu seller ki id daal de

int id1= id;

List <Ad_details> l1 = new ArrayList<Ad_details>();
Ad_details current1 = new Ad_details() ;
l = Home.soldads(id1) ;

for(int i=0 ; i<l.size(); i++){
	current1 = l.get(i);

      out.println("<div class=\"row\" style=\"height:250px\"> ");
      out.println(" <div class=\"col-3 my-auto text-center\"> ");
      out.println("  <img style=\"max-height:250px !important; max-width:100% !important;\" src='data:image/jpeg;base64,"+current1.geta_photo()+"' > ");
      out.println(" </div>");
      out.println(" <div class=\"col-7 my-auto\"> ");
      out.println("		<h5>"+current1.geta_product_name()+"</h5>");
      out.println("		<br>");
      out.println("		<h3>Rs. "+current1.geta_price()+"</h3>");
      out.println("		<br>");
      out.println("		<b>Sold to</b> : "+current1.geta_buyer_name()+" <br>");
      out.println("		<b>Category</b> : "+current1.geta_category() +"<br>");
      out.println("		<b>Units sold</b> : "+current1.geta_unitsold()+"<br>" );
      Date dNow = current1.geta_soldon();
      SimpleDateFormat ft = 
      new SimpleDateFormat ("dd/MM/yyyy");
      
      out.println("		<b>On Date</b> : "+ft.format(dNow));
   	  out.println("	</div>");
      out.println(" <div class=\"col-2\"></div>");
      out.println("</div>");
      out.println("<hr>");
	
}
%>
    </div>
    <div class="col-2"></div>
  </div>
  <!-- past Ad format ends -->


  <!-- modal -->
  <!-- modal starts -->
  <div class="modal_aman" id="modal_aman">
    <div class="modal-content-aman">
      <span class="close">&times;</span>
      <p>
        <h3>Sale Details</h3><hr>

        <form action="item_sold.jsp" method="post">
          <div class="row">
            <div class="col-4">
              <label class="mt-2" style="float:right;" for="buyer">Sold To</label>
            </div>
            <div class="col-8">
              <input class="modal_form_sold" type="text" name="buyer" id="buyer" placeholder="Buyer's Roll No"><br>
            </div>
          </div>
          <br>

          <div class="row">
            <div class="col-4">
              <label class="mt-2" style="float:right;" for="price">Price</label>
            </div>
            <div class="col-8">
              <input class="modal_form_sold" type="number" name="price" min="0" id="price" placeholder="Sold at"><br>
            </div>
          </div>
          <br>
          <input type="hidden" name="p_id" id="p_id" >
          <div class="row">
            <div class="col-4">
              <label class="mt-2" style="float:right;" for="date">Sold On</label>
            </div>
            <div class="col-8">
              <input class="modal_form_sold" type="date" name="date" id="date"><br>
            </div>
          </div>
          <br>

          <div class="row">
            <div class="col-4">
              <label class="mt-2" style="float:right;" for="units">Units Sold</label>
            </div>
            <div class="col-8">
              <input class="modal_form_sold" type="number" name="units" id="units" min="1" placeholder="Units sold to buyer"><br>
            </div>
          </div>
          <br>

          <div class="row">
            <div class="col-4">
              <label class="mt-2" style="float:right;" for="rating">Rating</label>
            </div>
            <div class="col-8">
              <fieldset class="rating">
                <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="5 stars"></label>
                <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="4 stars"></label>
                <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="3 stars"></label>
                <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="2 stars"></label>
                <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="1 star"></label>
            </fieldset>
            </div>
          </div>
          <br>

          <div class="row">
            <div class="col-4">
              <label class="mt-2" style="float:right;" for="review">Review</label>
            </div>
            <div class="col-8">
              <input class="modal_form_sold" type="text" name="review" id="review" placeholder="Review about Buyer"><br>
            </div>
          </div>
          <br>

          <button class="upd-image-btn" type="submit">Update</button>
        </form>
     
    </div>
  </div>

  <script>
//   function delete_entry(id){
// 	  document.getElementById("del_id").value=id;
//   }
    function display_modal(id,units){
    //alert(units);	
    document.getElementById("p_id").value=id;
    document.getElementById("units").max=units;
    //alert(units);
    var modal = document.getElementById("modal_aman");
//       var prodid=document.getElementById("prod_id").value;
//       alert(prodid)
//       document.getElementById("p_id").value=prodid;
// 	  $().value();
      modal.style.display="block";
    }
    var span = document.getElementsByClassName("close")[0];
    span.onclick = function() {
      var modal = document.getElementById("modal_aman");
      modal.style.display = "none";
    }
  </script>

  <!-- modal ends -->
  <!-- modal ends -->

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
