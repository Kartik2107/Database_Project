<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Buy and Sell : IIT Dharwad</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">

<meta name="keywords"
	content="Realtie a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>

<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" property="" />
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css"
	media="all">
<link rel="stylesheet" href="css/owl.theme.css" type="text/css"
	media="all">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/fontawesome-all.css" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Quicksand:300,400,500,700"
	rel="stylesheet">
	
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
	<div style="background-color: black;">
		<header>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<a class="navbar-brand" href="loginPage.jsp">IIT-Dh : Buy and
					Sell</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"> <i class="fas fa-bars"></i>
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
						<li class="nav-item ml-xl-2">
							<a class="nav-link" href="Ads.jsp">Your Ads</a>
						</li>
						<li class="nav-item ml-xl-2 active">
							<a class="nav-link" href="PostAd.jsp">Post an Ad
							<span class="sr-only">(current)</span>
							</a>
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
	<div id="search_form" class="search_top text-center"
		style="padding-top: 20px; padding-bottom: 20px; background-color: #00a591;">
		<h3>Buy what you need, Sell what you don't</h3>
		<form action="ElectronicsResult.jsp" method="post" id="bksubmit"
			class="ban-form row" style="padding-left: 4cm;">
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
				<input class="form-control" id="country" name="country"
					onkeypress="sendAut()" type="text" name="Name" placeholder="Name">
			</div>

			<div class="col-md-3 banf">
				<input class="form-control" onclick="searchElt()" type="button"
					style="height: 50px; border: 1px solid #ffc107; background-color: #ffc107; color: white; font-weight: 700; font-size: 20px"
					value="Search">
			</div>
		</form>
	</div>
	<!-- search ends -->

	<!-- heading -->
	<div class="content-ad" style="text-align: center;">
		<div class="heading">POST AN AD</div>
		" Happy to have you onboard, sell what you don't need and get yourself
		some money "
	</div>

	<!-- category select -->
	<center>
		<div class="tabs">
			<ul class="nav nav-pills justify-content-center" id="pills-tab"
				role="tablist">
				<li class="nav-item" style="width: 10%; text-align: center"><a
					class="nav-link active" id="pills-profile-tab" data-toggle="pill"
					role="tab" aria-controls="pills-profile" aria-selected="true">Category</a>
				</li>
			</ul>
		</div>
	</center>


	<div class="sorts" style="display: block; width: 730px !important" id="sort">
		<br>
		<form class="form-inline"
			style="margin-left: 35px; margin-right: 35px">
			<input type="radio" onclick="displayForm()" name="category" id="1"
				style="margin-right: 5px" checked>Electronics</input>
			&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" onclick="displayForm()"
				name="category" id="2" style="margin-right: 5px">Food</input>
			&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" onclick="displayForm()"
				name="category" id="3" style="margin-right: 5px">Cycle</input>
			&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" onclick="displayForm()"
				name="category" id="4" style="margin-right: 5px">Mattress</input>
			&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" onclick="displayForm()"
				name="category" id="5" style="margin-right: 5px">Books</input>
			&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" onclick="displayForm()"
				name="category" id="6" style="margin-right: 5px">Stationary
			and Others</input>
		</form>
		<br>
	</div>

	<script type="text/javascript">
		function displayForm() {
			if (document.getElementById('1').checked) {
				document.getElementById('food').style.display = "none";
				document.getElementById('cycle').style.display = "none";
				document.getElementById('mattress').style.display = "none";
				document.getElementById('books').style.display = "none";
				document.getElementById('stationary&others').style.display = "none";
				document.getElementById('electronics').style.display = "block";
			} else if (document.getElementById('2').checked) {
				document.getElementById('cycle').style.display = "none";
				document.getElementById('mattress').style.display = "none";
				document.getElementById('books').style.display = "none";
				document.getElementById('stationary&others').style.display = "none";
				document.getElementById('electronics').style.display = "none";
				document.getElementById('food').style.display = "block";
			} else if (document.getElementById('3').checked) {
				document.getElementById('mattress').style.display = "none";
				document.getElementById('books').style.display = "none";
				document.getElementById('stationary&others').style.display = "none";
				document.getElementById('electronics').style.display = "none";
				document.getElementById('food').style.display = "none";
				document.getElementById('cycle').style.display = "block";
			} else if (document.getElementById('4').checked) {
				document.getElementById('books').style.display = "none";
				document.getElementById('stationary&others').style.display = "none";
				document.getElementById('electronics').style.display = "none";
				document.getElementById('food').style.display = "none";
				document.getElementById('cycle').style.display = "none";
				document.getElementById('mattress').style.display = "block";
			} else if (document.getElementById('5').checked) {
				document.getElementById('stationary&others').style.display = "none";
				document.getElementById('electronics').style.display = "none";
				document.getElementById('food').style.display = "none";
				document.getElementById('cycle').style.display = "none";
				document.getElementById('mattress').style.display = "none";
				document.getElementById('books').style.display = "block";
			} else if (document.getElementById('6').checked) {
				document.getElementById('electronics').style.display = "none";
				document.getElementById('books').style.display = "none";
				document.getElementById('food').style.display = "none";
				document.getElementById('cycle').style.display = "none";
				document.getElementById('mattress').style.display = "none";
				document.getElementById('stationary&others').style.display = "block";
			}
		}
	</script>


	<!-- forms -->

	<!--electronics form -->
	<div class="post-form" id="electronics" style="display: block">
		<center>
			<h3>ELECTRONICS</h3>
		</center>
		<hr style="margin-bottom: 40px;">
		<form action="Post_ad_process" method="post"
			enctype="multipart/form-data">
			<label class="add-label" for="name">Ad Title*</label> 
			<input class="form-input" type="text" name="name" id="name" max="50" placeholder="Enter the name of the product" required><br>
			<label class="add-label" for="age">Age*</label> 
			<input class="form-input-small" type="number" name="age" min="0" id="age" placeholder="Time since bought in 'Months'" required><br>
			<label class="add-label" for="units">No of Units*</label> 
			<input class="form-input-small" type="number" name="units" id="units" min="1" placeholder="No of units to be sold" required><br> 
			<label class="add-label" for="subcategory">Subcategory*</label> 
			<select class="form-input-small" name="subcategory" id="subcategory" required>
				<option value="" disabled selected>--subcategory--</option>
				<option value="Mobile">Mobile</option>
				<option value="Laptop">Laptop</option>
				<option value="Tablet/Ipad">Tablet/Ipad</option>
				<option value="Speakers">Speakers</option>
				<option value="Headphones/Earphones">Headphones/Earphones</option>
				<option value="Headphones/Earphones">Accessories</option>
				<option value="Others">Others</option>
			</select>
			<hr>
			<label class="add-label" for="description">Ad Description*</label> 
			<input class="form-description" type="text" name="description" id="description" max="250" placeholder="Brief description of your product (250 words)" required><br> 
			<label class="add-label" for="price">Price*</label> 
			<input class="form-input-small" type="number" name="price" id="price" min="0" placeholder="Quote a price you want to sell at" required>
			<hr>
			<br>

			<div>
				<div
					style="width: 18%; display: inline-block; text-align: right; padding-right: 20px">
					Upload Photos*</div>
				<div style="display: inline-block">
					<div class="image-upload" style="display: inline-block;">
						<label for="ePhoto1"> <img
							style="width: 96px; height: 81px" id="ePhoto11"
							src="images/add_main.jpg">
						</label> <input type="file" accept="image/*" name="ePhoto1" id="ePhoto1"
							onchange="a(this.id)" required><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="ePhoto2"> <img
							style="width: 96px; height: 81px" id="ePhoto21"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="ePhoto2" id="ePhoto2"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="ePhoto3"> <img
							style="width: 96px; height: 81px" id="ePhoto31"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="ePhoto3" id="ePhoto3"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="ePhoto4"> <img
							style="width: 96px; height: 81px" id="ePhoto41"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="ePhoto4" id="ePhoto4"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="ePhoto5"> <img
							style="width: 96px; height: 81px" id="ePhoto51"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="ePhoto5" id="ePhoto5"
							onchange="a(this.id)"><br>
					</div>
				</div>

				<br> <br>
				<hr>

				<input type="hidden" value="1" id="catpass" name="catpass">

				<center>
					By clicking "Post Ad" you agree to our <a href="#">Terms of use</a>
					and <a href="#">Posting Rules</a>
					<div class="col-md-3 banf"
						style="margin-bottom: 30px; margin-top: 30px">
						<input class="post-button" type="submit" value="Post Ad">
					</div>
				</center>
			</div>
		</form>
	</div>
	<!-- electronics form ends -->

	<!--Food form -->
	<div class="post-form" id="food" style="display: none">
		<center>
			<h3>FOOD</h3>
		</center>
		<hr style="margin-bottom: 40px;">
		<form action="Post_ad_process" method="post"
			enctype="multipart/form-data">

			<label class="add-label" for="name">Ad Title*</label> 
			<input class="form-input" type="text" name="name" id="name" max="50" placeholder="Enter the name of the product" required><br>
			<label class="add-label" for="age">Best Before</label> 
			<input class="form-input-small" type="number" name="age" id="age" min="0" placeholder="Expiry Date(in months)" required><br> 
			<label class="add-label" for="units">No of Units*</label> 
			<input class="form-input-small" type="number" name="units" min="1" id="units" placeholder="No of units to be sold" required><br>
			<hr>
			<label class="add-label" for="description">Ad Description*</label> 
			<input class="form-description" type="text" name="description" id="description" max="250" placeholder="Brief description of your product(250 words)" required><br> 
			<label class="add-label" for="price">Price*</label> 
			<input class="form-input-small" type="number" name="price" id="price" min="0" placeholder="Quote a price you want to sell at" required>
			<hr>

			<br>

			<div>
				<div
					style="width: 18%; display: inline-block; text-align: right; padding-right: 20px">
					Upload Photos*</div>
				<div style="display: inline-block">
					<div class="image-upload" style="display: inline-block;">
						<label for="fphoto1"> <img
							style="width: 96px; height: 81px" id="fphoto11"
							src="images/add_main.jpg">
						</label> <input type="file" accept="image/*" name="fphoto1" id="fphoto1"
							onchange="a(this.id)" required><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="fphoto2"> <img
							style="width: 96px; height: 81px" id="fphoto21"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="fphoto2" id="fphoto2"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="fphoto3"> <img
							style="width: 96px; height: 81px" id="fphoto31"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="fphoto3" id="fphoto3"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="fphoto4"> <img
							style="width: 96px; height: 81px" id="fphoto41"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="fphoto4" id="fphoto4"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="fphoto5"> <img
							style="width: 96px; height: 81px" id="fphoto51"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="fphoto5" id="fphoto5"
							onchange="a(this.id)"><br>
					</div>
				</div>

				<br> <br>
				<hr>

				<input type="hidden" value="2" id="catpass" name="catpass">

				<center>
					By clicking "Post Ad" you agree to our <a href="#">Terms of use</a>
					and <a href="#">Posting Rules</a>
					<div class="col-md-3 banf"
						style="margin-bottom: 30px; margin-top: 30px">
						<input class="post-button" type="submit" value="Post Ad">
					</div>
				</center>
			</div>
		</form>
	</div>
	<!-- food form ends -->

	<!-- cycle form -->
	<div class="post-form" id="cycle" style="display: none">
		<center>
			<h3>CYCLE</h3>
		</center>
		<hr style="margin-bottom: 40px;">
		<form action="Post_ad_process" method="post"
			enctype="multipart/form-data">
			<label class="add-label" for="name">Ad Title*</label> <input
				class="form-input" type="text" name="name" id="name"
				placeholder="Enter the name of the product" max="50" required><br>
			<label class="add-label" for="age">Age*</label> <input
				class="form-input-small" type="number" name="age" id="age"
				placeholder="Time since bought in 'Months'" min="0" required><br>
			<label class="add-label" for="units">No of Units*</label> <input
				class="form-input-small" type="number" name="units" id="units"
				placeholder="No of units to be sold"  min="1" required><br> <label
				class="add-label" for="brakes">Brakes*</label> <select
				class="form-input-small" name="brakes" id="brakes" required>
				<option value="" disabeled selected>--brakes--</option>
				<option value="v">V-Brake</option>
				<option value="p">Power Brake</option>
				<option value="d">Disc Brake</option>
			</select> <br> <label class="add-label" for="gear">Gear*</label> <select
				class="form-input-small" name="gear" id="gear" required>
				<option value="" disabeled selected>--gear--</option>
				<option value="ss">Single Speed</option>
				<option value="g">Geared</option>
			</select> <br> <label class="add-label" for="shockers">Shockers*</label>
			<select class="form-input-small" name="shockers" id="shockers"
				required>
				<option value="" disabeled selected>--shockers--</option>
				<option value="f">front</option>
				<option value="b">back</option>
				<option value="fb">front and back</option>
			</select>
			<hr>
			<label class="add-label" for="description">Ad Description*</label> <input
				class="form-description" type="text" name="description"
				id="description" max="250" placeholder="Brief description of your product(250 words)"
				required></br> <label class="add-label" for="price">
				Price* </label> <input class="form-input-small" type="number" name="price"
				id="price" placeholder="Quote a price you want to sell at" min="0" required>
			<hr>
			<br>

			<div>
				<div
					style="width: 18%; display: inline-block; text-align: right; padding-right: 20px">
					Upload Photos*</div>
				<div style="display: inline-block">
					<div class="image-upload" style="display: inline-block;">
						<label for="cphoto1"> <img
							style="width: 96px; height: 81px" id="cphoto11"
							src="images/add_main.jpg">
						</label> <input type="file" accept="image/*" name="cphoto1" id="cphoto1"
							onchange="a(this.id)" required><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="cphoto2"> <img
							style="width: 96px; height: 81px" id="cphoto21"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="cphoto2" id="cphoto2"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="cphoto3"> <img
							style="width: 96px; height: 81px" id="cphoto31"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="cphoto3" id="cphoto3"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="cphoto4"> <img
							style="width: 96px; height: 81px" id="cphoto41"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="cphoto4" id="cphoto4"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="cphoto5"> <img
							style="width: 96px; height: 81px" id="cphoto51"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="cphoto5" id="cphoto5"
							onchange="a(this.id)"><br>
					</div>
				</div>

				<br> <br>
				<hr>

				<input type="hidden" value="3" id="catpass" name="catpass">

				<center>
					By clicking "Post Ad" you agree to our <a href="#">Terms of use</a>
					and <a href="#">Posting Rules</a>
					<div class="col-md-3 banf"
						style="margin-bottom: 30px; margin-top: 30px">
						<input class="post-button" type="submit" value="Post Ad">
					</div>
				</center>
			</div>
		</form>
	</div>
	<!-- cycle form ends -->


	<!--Mattress form -->
	<div class="post-form" id="mattress" style="display: none">
		<center>
			<h3>MATTRESS</h3>
		</center>
		<hr style="margin-bottom: 40px;">
		<form action="Post_ad_process" method="post"
			enctype="multipart/form-data">
			<label class="add-label" for="name">Ad Title*</label> <input
				class="form-input" type="text" name="name" id="name"
				placeholder="Enter the name of the product" max="50" required><br>
			<label class="add-label" for="age">Age*</label> <input
				class="form-input-small" type="number" name="age" id="age"
				placeholder="Time since bought in 'Months'" min="0" required><br>
			<label class="add-label" for="units">No of Units*</label> <input
				class="form-input-small" type="number" name="units" id="units"
				placeholder="No of units to be sold" min="1" required><br> <label
				class="add-label" for="roll">Rollable*</label> <select
				class="form-input-small" name="roll" id="roll" required>
				<option value="" disabeled selected>--rollability--</option>
				<option value="r">Rollable</option>
				<option value="s">Stiff</option>
			</select>
			<hr>
			<label class="add-label" for="description">Ad Description*</label> <input
				class="form-description" type="text" name="description"
				id="description" max="250" placeholder="Brief description of your product(250 words)"
				required></br> <label class="add-label" for="price">
				Price* </label> <input class="form-input-small" type="number" name="price"
				id="price" placeholder="Quote a price you want to sell at" min="0" required>
			<hr>
			<br>

			<div>
				<div
					style="width: 18%; display: inline-block; text-align: right; padding-right: 20px">
					Upload Photos*</div>
				<div style="display: inline-block">
					<div class="image-upload" style="display: inline-block;">
						<label for="mphoto1"> <img
							style="width: 96px; height: 81px" id="mphoto11"
							src="images/add_main.jpg">
						</label> <input type="file" accept="image/*" name="mphoto1" id="mphoto1"
							onchange="a(this.id)" required><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="mphoto2"> <img
							style="width: 96px; height: 81px" id="mphoto21"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="mphoto2" id="mphoto2"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="mphoto3"> <img
							style="width: 96px; height: 81px" id="mphoto31"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="mphoto3" id="mphoto3"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="mphoto4"> <img
							style="width: 96px; height: 81px" id="mphoto41"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="mphoto4" id="mphoto4"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="mphoto5"> <img
							style="width: 96px; height: 81px" id="mphoto51"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="mphoto5" id="mphoto5"
							onchange="a(this.id)"><br>
					</div>
				</div>

				<br> <br>
				<hr>

				<input type="hidden" value="4" id="catpass" name="catpass">

				<center>
					By clicking "Post Ad" you agree to our <a href="#">Terms of use</a>
					and <a href="#">Posting Rules</a>
					<div class="col-md-3 banf"
						style="margin-bottom: 30px; margin-top: 30px">
						<input class="post-button" type="submit" value="Post Ad">
					</div>
				</center>
			</div>
		</form>
	</div>
	<!-- Mattress form ends -->

	<!--books form -->
	<div class="post-form" id="books" style="display: none">
		<center>
			<h3>BOOKS</h3>
		</center>
		<hr style="margin-bottom: 40px;">
		<form action="Post_ad_process" method="post"
			enctype="multipart/form-data">
			<label class="add-label" for="name">Ad Title*</label> <input
				class="form-input" type="text" name="name" id="name"
				placeholder="Enter the name of the product" max="50" required><br>
			<label class="add-label" for="age">Age*</label> <input
				class="form-input-small" type="number" name="age" id="age"
				placeholder="Time since bought in 'Months'" min="0" required><br>
			<label class="add-label" for="units">No of Units*</label> <input
				class="form-input-small" type="number" name="units" id="units"
				placeholder="No of units to be sold" min="1" required><br> <label
				class="add-label" for="type">Type*</label> <select
				class="form-input-small" name="type" id="type" required>
				<option value="" disabeled selected>--type--</option>
				<option value="a">Academic</option>
				<option value="na">Non-academic</option>
			</select> <br> <label class="add-label" for="branch">Branch*</label> <select
				class="form-input-small" name="branch" id="branch" required>
				<option value="" disabled selected>--branch--</option>
				<option value="cse">CSE</option>
				<option value="me">ME</option>
				<option value="ee">EE</option>
				<option value="others">Not Applicable</option>
			</select> <br> <label class="add-label" for="year">Academic Year*</label>
			<select class="form-input-small" name="year" id="year" required>
				<option value="" disabled selected>--academic year--</option>
				<option value="1">1st year</option>
				<option value="2">2nd year</option>
				<option value="3">3rd year</option>
				<option value="4">Not Applicable</option>
			</select>
			<hr>
			<label class="add-label" for="description">Ad Description*</label> <input
				class="form-description" type="text" name="description"
				id="description" max="250" placeholder="Brief description of your product(250 words)"
				required></br> <label class="add-label" for="price">
				Price* </label> <input class="form-input-small" type="number" name="price"
				id="price" placeholder="Quote a price you want to sell at" min="0" required>
			<hr>
			<br>

			<div>
				<div
					style="width: 18%; display: inline-block; text-align: right; padding-right: 20px">
					Upload Photos*</div>
				<div style="display: inline-block">
					<div class="image-upload" style="display: inline-block;">
						<label for="bphoto1"> <img
							style="width: 96px; height: 81px" id="bphoto11"
							src="images/add_main.jpg">
						</label> <input type="file" accept="image/*" name="bphoto1" id="bphoto1"
							onchange="a(this.id)" required><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="bphoto2"> <img
							style="width: 96px; height: 81px" id="bphoto21"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="bphoto2" id="bphoto2"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="bphoto3"> <img
							style="width: 96px; height: 81px" id="bphoto31"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="bphoto3" id="bphoto3"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="bphoto4"> <img
							style="width: 96px; height: 81px" id="bphoto41"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="bphoto4" id="bphoto4"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="bphoto5"> <img
							style="width: 96px; height: 81px" id="bphoto51"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="bphoto5" id="bphoto5"
							onchange="a(this.id)"><br>
					</div>
				</div>

				<br> <br>
				<hr>

				<input type="hidden" value="5" id="catpass" name="catpass">

				<center>
					By clicking "Post Ad" you agree to our <a href="#">Terms of use</a>
					and <a href="#">Posting Rules</a>
					<div class="col-md-3 banf"
						style="margin-bottom: 30px; margin-top: 30px">
						<input class="post-button" type="submit" value="Post Ad">
					</div>
				</center>
			</div>
		</form>
	</div>
	<!-- books form ends -->

	<!--stationary&others form -->
	<div class="post-form" id="stationary&others" style="display: none">
		<center>
			<h3>STATIONARY AND OTHERS</h3>
		</center>
		<hr style="margin-bottom: 40px;">
		<form action="Post_ad_process" method="post"
			enctype="multipart/form-data">
			<label class="add-label" for="name">Ad Title*</label> <input
				class="form-input" type="text" name="name" id="name" max="50"
				placeholder="Enter the name of the product" required><br>
			<label class="add-label" for="age">Age*</label> <input
				class="form-input-small" type="number" name="age" id="age"
				placeholder="Time since bought in 'Months'" min="0" required><br>
			<label class="add-label" for="units">No of Units*</label> <input
				class="form-input-small" type="number" min="1" name="units" id="units"
				placeholder="No of units to be sold" required><br>
			<hr>
			<label class="add-label" for="description">Ad Description*</label> <input
				class="form-description" type="text" name="description"
				id="description" max="250" placeholder="Brief description of your product(250 words)"
				required></br> <label class="add-label" for="price">
				Price* </label> <input class="form-input-small" type="number" name="price"
				id="price" placeholder="Quote a price you want to sell at" required>
			<hr>
			<br>

			<div>
				<div
					style="width: 18%; display: inline-block; text-align: right; padding-right: 20px">
					Upload Photos*</div>
				<div style="display: inline-block">
					<div class="image-upload" style="display: inline-block;">
						<label for="sphoto1"> <img
							style="width: 96px; height: 81px" id="sphoto11"
							src="images/add_main.jpg">
						</label> <input type="file" accept="image/*" name="sphoto1" id="sphoto1"
							onchange="a(this.id)" required><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="sphoto2"> <img
							style="width: 96px; height: 81px" id="sphoto21"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="sphoto2" id="sphoto2"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="sphoto3"> <img
							style="width: 96px; height: 81px" id="sphoto31"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="sphoto3" id="sphoto3"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="sphoto4"> <img
							style="width: 96px; height: 81px" id="sphoto41"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="sphoto4" id="sphoto4"
							onchange="a(this.id)"><br>
					</div>

					<div class="image-upload" style="display: inline-block;">
						<label for="sphoto5"> <img
							style="width: 96px; height: 81px" id="sphoto51"
							src="images/add.jpg">
						</label> <input type="file" accept="image/*" name="sphoto5" id="sphoto5"
							onchange="a(this.id)"><br>
					</div>
				</div>

				<br> <br>
				<hr>

				<input type="hidden" value="6" id="catpass" name="catpass">

				<center>
					By clicking "Post Ad" you agree to our <a href="#">Terms of use</a>
					and <a href="#">Posting Rules</a>
					<div class="col-md-3 banf"
						style="margin-bottom: 30px; margin-top: 30px">
						<input class="post-button" type="submit" value="Post Ad">
					</div>
				</center>
			</div>
		</form>
	</div>
	<!-- stationary&others form ends -->



	<!-- footer -->
	<footer style="padding-top: 80px">
		<div class="footer-cpy p-lg-4 p-md-3 p-3 container-fluid">
			<div class="row">
				<div class="col-lg-6 copyrightbottom text-left">
					<h3>
						<a class="navbar-brand" href="loginPage.jsp">IIT-Dh : Buy and
							Sell</a>
					</h3>
					<p>
						© 2018 <a href="http://www.iitdh.ac.in">IIT Dharwad</a> | Design
						by <a href="mailto:160010004@iitdh.ac.in">Aman Jaiswal</a>, <a
							href="mailto:160010036@iitdh.ac.in">Namit Bhardwaj</a>, <a
							href="mailto:160030015@iitdh.ac.in">Kartik Kataria</a>
					</p>
				</div>

				<div class="col-lg-6 copyrighttop mt-3 text-right">
					<ul>
						<li class="mx-3"><a class="facebook" href="#"> <i
								class="fab fa-facebook-f"></i> <a
								href="https://www.facebook.com/iitdharwadofficial">Facebook</a>
						</a></li>
						<li><a class="facebook" href="#"> <i
								class="fab fa-twitter"></i> <a
								href="https://twitter.com/iitdhrwd">Twitter</a>
						</a></li>
						<li class="mx-3"><a class="facebook" href="#"> <i
								class="fab fa-youtube"></i> <a
								href="https://www.youtube.com/channel/UCG_M5tP34-uO-Jkr9Q7VDsA">Youtube</a>
						</a></li>
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
		$(document).ready(function() {
			$('.owl-carousel').owlCarousel({
				loop : true,
				margin : 10,
				responsiveClass : true,
				responsive : {
					0 : {
						items : 1,
						nav : true
					},
					600 : {
						items : 2,
						nav : false
					},
					900 : {
						items : 3,
						nav : false
					},
					1000 : {
						items : 4,
						nav : true,
						loop : false,
						margin : 20
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
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation : "slide",
				start : function(slider) {
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
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //end-smooth-scrolling -->

	<!-- dropdown nav -->
	<script>
		$(document).ready(function() {
			$(".dropdown").hover(function() {
				$('.dropdown-menu', this).stop(true, true).slideDown("fast");
				$(this).toggleClass('open');
			}, function() {
				$('.dropdown-menu', this).stop(true, true).slideUp("fast");
				$(this).toggleClass('open');
			});
		});
	</script>
	<!-- //dropdown nav -->
	<!-- smooth-scrolling-of-move-up -->
	<script>
		$(document).ready(function() {
			/*
			var defaults = {
			    containerID: 'toTop', // fading element id
			    containerHoverID: 'toTopHover', // fading element hover id
			    scrollSpeed: 1200,
			    easingType: 'linear'
			};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->
	<script src="js/bootstrap.js"></script>
	<!-- js file -->


	<script type="text/javascript">
		function readURL(input, id) {
			if (input.files && input.files[0]) {
				var imageId = "#" + id + "1";
				var reader = new FileReader();
				reader.onload = function(e) {
					$(imageId).attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		function a(id) {
			readURL(document.getElementById(id), id);
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
			inp
					.addEventListener(
							"input",
							function(e) {
								var a, b, i, val = this.value;
								/*close any already open lists of autocompleted values*/
								closeAllLists();
								if (!val) {
									return false;
								}
								currentFocus = -1;
								/*create a DIV element that will contain the items (values):*/
								a = document.createElement("DIV");
								a.setAttribute("id", this.id
										+ "autocomplete-list");
								a.setAttribute("class", "autocomplete-items");
								/*append the DIV element as a child of the autocomplete container:*/
								this.parentNode.appendChild(a);
								/*for each item in the array...*/
								for (i = 0; i < arr.length; i++) {
									/*check if the item starts with the same letters as the text field value:*/
									if (arr[i].substr(0, val.length)
											.toUpperCase() == val.toUpperCase()) {
										/*create a DIV element for each matching element:*/
										b = document.createElement("DIV");
										/*make the matching letters bold:*/
										b.innerHTML = "<strong>"
												+ arr[i].substr(0, val.length)
												+ "</strong>";
										b.innerHTML += arr[i]
												.substr(val.length);
										/*insert a input field that will hold the current array item's value:*/
										b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
										/*execute a function when someone clicks on the item value (DIV element):*/
										b
												.addEventListener(
														"click",
														function(e) {
															/*insert the value for the autocomplete text field:*/
															inp.value = this
																	.getElementsByTagName("input")[0].value;
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
				if (x)
					x = x.getElementsByTagName("div");
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
						if (x)
							x[currentFocus].click();
					}
				}
			});
			function addActive(x) {
				/*a function to classify an item as "active":*/
				if (!x)
					return false;
				/*start by removing the "active" class on all items:*/
				removeActive(x);
				if (currentFocus >= x.length)
					currentFocus = 0;
				if (currentFocus < 0)
					currentFocus = (x.length - 1);
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
			document.addEventListener("click", function(e) {
				closeAllLists(e.target);
			});
		}
		var ashlulz;

		function sendAut() {
			var catsearch = document.getElementById("country12").value;
			//alert(catsearch);
			var url = "autocomp.jsp?category=" + catsearch;

			if (window.XMLHttpRequest) {
				ashlulz = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				ashlulz = new ActiveXObject("Microsoft.XMLHTTP");
			}

			try {
				ashlulz.onreadystatechange = getAut;
				ashlulz.open("GET", url, true);
				ashlulz.send();
			} catch (e) {
				alert("Unable to connect to server");
			}
		}

		function getAut() {
			//alert("hello1122");
			if (ashlulz.readyState == 4) {
				//alert("hello");
				var val1 = ashlulz.responseText;
				//alert(val1);
				var str_array = val1.split(',');
				//alert(str_array);
				for (var i = 0; i < str_array.length; i++) {
					// Trim the excess whitespace.
					str_array[i] = str_array[i].replace(/^\s*/, "").replace(
							/\s*$/, "");
					// Add additional code here, such as:
					//alert(str_array[i]);
				}
				//alert(str_array[0]);
				//alert(countries1[0]);

				autocomplete(document.getElementById("country"), str_array);
			}
		}
		function searchElt() {
			var x1 = "Electronics";
			var x2 = "Food";
			var x3 = "Cycle";
			var x4 = "Mattress";
			var x5 = "Book";
			var x6 = "Others";
			var xtest = document.getElementById("country12").value;
			if (x1 === xtest) {
				document.getElementById('bksubmit').action = "ElectronicsResult.jsp";
				document.getElementById('bksubmit').submit();
			} else if (x2 === xtest) {
				document.getElementById('bksubmit').action = "FoodResult.jsp";
				document.getElementById('bksubmit').submit();
			} else if (x3 === xtest) {
				document.getElementById('bksubmit').action = "CycleResult.jsp";
				document.getElementById('bksubmit').submit();
			} else if (x4 === xtest) {
				document.getElementById('bksubmit').action = "MattressResult.jsp";
				document.getElementById('bksubmit').submit();
			} else if (x5 === xtest) {
				document.getElementById('bksubmit').action = "BookResult.jsp";
				document.getElementById('bksubmit').submit();
			} else if (x6 === xtest) {
				document.getElementById('bksubmit').action = "OtherResult.jsp";
				document.getElementById('bksubmit').submit();
			}
		}
	</script>
</body>

</html>
