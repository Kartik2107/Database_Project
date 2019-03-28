<%@ page import="Home.*"%>
<%@ page import="Home.Home" %> 
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
	</script>

	<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
	<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
	<link href="css/style.css" rel='stylesheet' type='text/css' />
	<link href="css/fontawesome-all.css" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">

</head>

<body>

  <div class="banner-w3layouts">
		<header>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<a class="navbar-brand" href="index.html">IIT-Dh : Buy and Sell</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
				    aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon">
						<i class="fas fa-bars"></i>
					</span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto">
					</ul>
		<!--  LOGIN FORM -->
			<form method="post" action="inter.jsp" class="form-inline my-2 my-lg-0" id="bksubmit">
	              <input class="form-control mr-sm-2" name="roll" id="roll" type="text" placeholder="Username" aria-label="Search">
	              <input class="form-control mr-sm-2" name="pwd" id="pwd" type="password" placeholder="Password" aria-label="Search">
	              
	              <button class="btn btn-outline-success my-2 my-sm-0" style="background-color:green; color:white" type="button" onclick="senduloginInfo()">LogIn</button>
          		  <span id="uloginres"  style =" font-size: 20px;font-family: 'PT Sans Narrow';"></span>
          	</form>

				</div>
			</nav>
		</header>
 		
		<div class="signup-form-aman">
			<br><h1 style="font-size:50px">Sign-Up</h1><br>

			<form  action="Register" method="post" enctype="multipart/form-data">
			<span id="amit" style =" font-size: 20px;font-family: 'PT Sans Narrow';" ></span>
				
				<input class="aman-input" required title="Not a valid Roll No" name="newroll" pattern="[0-9]{9,9}" placeholder="Enter your Roll No" onblur="sendInfo()" id="newroll"/><br style="line-height:50px">
				
				<input class="aman-input" required type="text"  title="Only Alphabets" name="fname" id="fname" pattern="[a-zA-Z\s]+" placeholder="Full Name"/><br style="line-height:50px">
				<!--<input class="aman-input" type="password" name="password" id="password" placeholder="Password"/><br style="line-height:50px">-->
				
				<select class="aman-input" style="margin-bottom:15px" required name="hno" id="hno">
					<option value="" disabled selected>Select Hostel Number</option>
					<option value="0">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
				</select>
				
				<input class="aman-input" required title="Only enter 10 digit mobile no." name="phone" pattern="[0-9]{10,10}" id="phone" placeholder="Mobile Number"/><br style="line-height:50px">
				<!-- <input class="aman-input" required title="Enter IIT-Dh email ID" pattern="(.*)@iitdh.ac.in" name="email" id="email" placeholder="IIT-Dh Email Id"/><br style="line-height:50px">
				 -->
				  <!-- profile pic upload --> 
				<label for="profile"><h4>Upload a profile picture</h4></label>
				<input class="aman-input" type="file" required accept="image/*" name="newpic" id="newpic"><br>
				 
				<button class="btn btn-outline-success my-2 my-sm-0" style="background-color:green; color:white; width:30%; height:40px;" type="submit">SignUp</button>
			</form>
		</div>

  </div>

	<!-- about -->
	<section class="about" style="padding-top:1cm; padding-left:1cm;">
		<div style="width:100%; height:350px;">
			<div style="width:30%; float:left">
				<img class="img-fluid rounded" src="images/ab.jpg" alt="">
			</div>
			<div style="width:70%; float:left; padding-left:1cm; padding-right:2cm;">
				<center><h1>About Us</h1></center><br>
					<p>We are a group of 3 pre-final year engineering graduates. Most of the times the problem arises that one wants to sell something(s) that he/she doesn't need anymore for example, a book, a cycle or even food (suppose we are going home for a month, so we would want to sell the food) but we don't know who all are the potential buyers or it may happen that we want to buy something but we don't want to buy a new product, we are fine with a used one, but we don't know who are all willing to sell their used products. So, this project will provide a common platform for buyers and sellers of this type to come together and do the trade.</p>

			</div>
		</div>
	</section>

  <!-- stats -->
	<section class="stats_test pb-5 container-fluid">
		<div class="row inner_stat_wthree_agileits">
			<div class="col-sm-3 col-6 py-5 stats_info counter_grid">
				<i class="fa fa-shopping-cart"></i>
				
				<p class="counter"><%out.println(Home.get_counter_pfs()); %></p>
				<h4>Products for Sale</h4>
			</div>
			<div class="col-sm-3 col-6 py-5 stats_info counter_grid1">
				<i class="fa fa-gift"></i>
				<p class="counter"><%out.println(Home.get_counter_stn()); %></p>
				<h4>Products Sold Till Now</h4>
			</div>
			<div class="col-sm-3 col-6 py-5 stats_info counter_grid2">
				<i class="fas fa-users"></i>
				<p class="counter"><%out.println(Home.get_counter_ru()); %></p>
				<h4>Registered Users</h4>
			</div>
			<div class="col-sm-3 col-6 py-5 stats_info counter_grid3">
				<i class="far fa-money-bill-alt"></i>
				<p class="counter"><%out.println(Home.get_counter_money()); %></p>
				<h4>Revenue Generated</h4>
			</div>
		</div>
	</section>
	<!-- //stats -->

  <section class="banner-w3layouts-bottom py-lg-5 py-3">
		<div class="container py-lg-4 py-3">
			<h3 class="tittle text-center">Developers</h3>
			<div class="row inner-sec-agileits-w3ls mt-lg-5 mt-3">
				<div class="col-sm-4">
					<div class="team-grid text-center">
						<div class="team-img">
							<img class="img-fluid rounded" src="images/team1.jpg" alt="">
						</div>
						<div class="team-info">
							<h4>Aman Jaiswal</h4>
							<span>Front-End Designer</span>
							<ul class="d-flex justify-content-center py-3 social-icons">
								<li>
									<a href="http://facebook.com/aman.jaiswal.15">
										<i class="fab fa-facebook-f"></i>
									</a>
								</li>
								<li class="mx-3">
									<a href="http://twitter.com/Aman_jaiswal_03">
										<i class="fab fa-twitter"></i>
									</a>
								</li>
								<li>
									<a href="mailto:160010004@iitdh.ac.in">
										<i class="fab fa-google-plus-g"></i>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="team-grid text-center">
						<div class="team-img">
							<img class="img-fluid rounded" src="images/team2.jpg" alt="">
						</div>
						<div class="team-info">
							<h4>Namit Bhardwaj</h4>
							<span>Back-End Developer</span>
							<ul class="d-flex justify-content-center py-3 social-icons">
								<li>
									<a href="#">
										<i class="fab fa-facebook-f"></i>
									</a>
								</li>
								<li class="mx-3">
									<a href="#">
										<i class="fab fa-twitter"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fab fa-google-plus-g"></i>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="team-grid text-center">
						<div class="team-img">
							<img class="img-fluid rounded" src="images/team3.jpg" alt="">
						</div>
						<div class="team-info">
							<h4>Kartik Kataria</h4>
							<span>Back-End Developer</span>
							<ul class="d-flex justify-content-center py-3 social-icons">
								<li>
									<a href="#">
										<i class="fab fa-facebook-f"></i>
									</a>
								</li>
								<li class="mx-3">
									<a href="#">
										<i class="fab fa-twitter"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fab fa-google-plus-g"></i>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
    </div>
  </section>

	<!-- footer -->
  <footer>
		<div class="footer-cpy p-lg-4 p-md-3 p-3 container-fluid">
			<div class="row">
				<div class="col-lg-6 copyrightbottom text-left">
					<h3>
						<a class="navbar-brand" href="index.html">IIT-Dh : Buy and Sell</a>
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
		<script>

	function a(){
		$('#login').modal('toggle');
	}
	var request;
	var op2;
	var op3;
	function sendInfo(){
		var v=document.getElementById("newroll").value;
		var url="index_check.jsp?val="+v;
		
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
	}
	
	function getInfo(){
		//	alert("hello");
		if(request.readyState==4){
		var val=request.responseText;
			document.getElementById("amit").style.color = "red";
			document.getElementById('amit').innerHTML=val;

		}
	}
	
	function senduloginInfo(){
		//alert("hey");
		var v=document.getElementById("roll").value;
		var pp=document.getElementById("pwd").value;
		//alert(v);
		//alert(pp);
		var url="credCheck.jsp?val="+v+"&pass="+pp;
		//alert(url);
		if(window.XMLHttpRequest){
			op2=new XMLHttpRequest();
		}
		else if(window.ActiveXObject){
			op2=new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		try{
			op2.onreadystatechange=getuloginInfo;
			op2.open("GET",url,true);
			op2.send();
		}
		catch(e){
		alert("Unable to connect to server");
		}
	}
	
	function getuloginInfo(){
		if(op2.readyState==4){
		var val=op2.responseText;
		//alert(val);
		var yyy="a";
		var y2="b";
		var re = new RegExp(yyy, 'g');
		var re2 = new RegExp(y2, 'g');
		if(val.match(re)!="a"){
			if(val.match(re2)=="b"){
				document.getElementById('bksubmit').action="admininter.jsp";
				document.getElementById('bksubmit').submit();
			}
			else{
				document.getElementById("uloginres").style.color = "red";
				document.getElementById('uloginres').innerHTML="Invalid Username/Password";
			}
		}
		else{
			//
			document.getElementById('bksubmit').submit();
			
		}
		}
	}
	var op21;
	function sendme(){
		//alert("hey");
		var v=document.getElementById("country").value;
		//var pp=document.getElementById("pwd").value;
		//alert(v);
		//alert(pp);
		var url="rescheck.jsp?val="+v;
		//alert(url);
		if(window.XMLHttpRequest){
			op21=new XMLHttpRequest();
		}
		else if(window.ActiveXObject){
			op21=new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		try{
			op21.onreadystatechange=getme;
			op21.open("GET",url,true);
			op21.send();
		}
		catch(e){
		alert("Unable to connect to server");
		}
	}
	
	function getme(){
		if(op21.readyState==4){
		var val=op21.responseText;
		//alert(val);
		var yyy="a";
		var y2="b";
		var re = new RegExp(yyy, 'g');
		var re2 = new RegExp(y2, 'g');
		if(val.match(re)=="a"){
				document.getElementById("uloginres1").style.color = "white";
				document.getElementById("uloginres1").innerHTML="No such Restaurant";
		}
		else{
			//
			document.getElementById('searchme').submit();
			
		}
		}
	}
</script>
<script>
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
	//alert("idhar");
	var url="Autotest.jsp";
	
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
	var str_array = val1.split(',');
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

/*An array containing all the country names in the world:*/

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/

</script>
</body>

</html>
