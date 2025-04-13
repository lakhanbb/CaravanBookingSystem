<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Account</title>

<style type="text/css">

body, h1, h2, p {
	margin: 0;
	padding: 0;
}

/* Global styles */
body {
	margin: 0;
	color: #6a6f8c;
	background-color: #f0f0f0;
	font: 600 16px/18px 'Open Sans', sans-serif;
	display: flex;
	flex-direction: column;
	min-height: 105vh;
	/* Make sure the body takes at least the height of the viewport */
	
}

header {
	background-color: #333;
	color: #fff;
	padding: 10px 0;
}

nav {
	max-width: 1200px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.nav-links {
	display: flex;
	align-items: center;
}

.nav-links li {
	list-style: none;
	margin-left: 20px; /* Adjust margin as needed */
}

.nav-links a {
	text-decoration: none;
	color: #fff;
}

.hero {
   
    background-size: cover;
    width: 100%;
    height: 700px;
    background-position: center;
    padding: 30px 0;
    color: #fff;
    margin-bottom: 20px; /* Adjust the margin */
 
}

footer {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 10px 0;
    margin-top: 75px;
}

/* Style the dropdown button */
.dropbtn {
	background-color: #f36f6f;
	color: #fff;
	padding: 10px 20px;
	border: none;
	min-width: 105px;
	border-radius: 5px;
	cursor: pointer;
	position: relative;
	margin-right: 10px;
	/* Adjust the margin between button and dropdown content */
}

.dropbtn::after {
	content: '\25BC'; /* Unicode for down arrow */
	margin-left: 10px;
}

/* Position the dropdown content */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #fff;
	min-width: 103px;
	max-width: 103px;
	border-radius: 5px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	margin-top: 0px; /* Remove the top margin to align with the button */
	margin-left: 2px; /* Adjust the margin to align with the button */
}

/* Style the dropdown links */
.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: center;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
}

/* Show the dropdown content on hover */
.dropdown:hover .dropdown-content {
	display: block;
}



*, :after, :before {
	box-sizing: border-box
}

.clearfix:after, .clearfix:before {
	content: '';
	display: table
}

.clearfix:after {
	clear: both;
	display: block
}

a {
	color: inherit;
	text-decoration: none
}

.login-wrap {
	width: 100%;
	margin: auto auto auto auto;
	max-width: 525px;
	min-height: 605px;
	position: relative;
	background:
	url(https://github.com/lakhanbb/caravan-img/raw/main/bg.jpg)
	no-repeat center;
	box-shadow: 0 12px 15px 0 rgba(0, 0, 0, .24), 0 17px 50px 0
		rgba(0, 0, 0, .19);
}

.login-html {
	width: 100%;
	height: 100%;
	position: absolute;
	padding: 90px 70px 50px 70px;
	background: rgba(40, 57, 101, .9);
}

.login-html .sign-in-htm, .login-html .sign-up-htm {
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	position: absolute;
	transform: rotateY(180deg);
	backface-visibility: hidden;
	transition: all .4s linear;
}

.login-html .sign-in, .login-html .sign-up, .login-form .group .check {
	display: none;
}

.login-html .tab, .login-form .group .label, .login-form .group .button
	{
	text-transform: uppercase;
}

.login-html .tab {
	font-size: 22px;
	margin-right: 15px;
	padding-bottom: 5px;
	margin: 0 15px 10px 0;
	display: inline-block;
	border-bottom: 2px solid transparent;
}

.login-html .sign-in:checked+.tab, .login-html .sign-up:checked+.tab {
	color: #fff;
	border-color: #1161ee;
}

.login-form {
	min-height: 345px;
	position: relative;
	perspective: 1000px;
	transform-style: preserve-3d;
	
}

.login-form .group {
	margin-bottom: 15px;
}

.login-form .group .label, .login-form .group .input, .login-form .group .button
	{
	width: 100%;
	color: #fff;
	display: block;
}

.login-form .group .input, .login-form .group .button {
	border: none;
	padding: 15px 20px;
	border-radius: 25px;
	background: rgba(255, 255, 255, .1);
}

.login-form .group input[data-type="password"] {
	text-security: circle;
	-webkit-text-security: circle;
}

.login-form .group .label {
	color: #aaa;
	font-size: 12px;
}

.login-form .group .button {
	background: #1161ee;
}

.login-form .group label .icon {
	width: 15px;
	height: 15px;
	border-radius: 2px;
	position: relative;
	display: inline-block;
	background: rgba(255, 255, 255, .1);
}

.login-form .group label .icon:before, .login-form .group label .icon:after
	{
	content: '';
	width: 10px;
	height: 2px;
	background: #fff;
	position: absolute;
	transition: all .2s ease-in-out 0s;
}

.login-form .group label .icon:before {
	left: 3px;
	width: 5px;
	bottom: 6px;
	transform: scale(0) rotate(0);
}

.login-form .group label .icon:after {
	top: 6px;
	right: 0;
	transform: scale(0) rotate(0);
}

.login-form .group .check:checked+label {
	color: #fff;
}

.login-form .group .check:checked+label .icon {
	background: #1161ee;
}

.login-form .group .check:checked+label .icon:before {
	transform: scale(1) rotate(45deg);
}

.login-form .group .check:checked+label .icon:after {
	transform: scale(1) rotate(-45deg);
}

.login-html .sign-in:checked+.tab+.sign-up+.tab+.login-form .sign-in-htm
	{
	transform: rotate(0);
}

.login-html .sign-up:checked+.tab+.login-form .sign-up-htm {
	transform: rotate(0);
}

.hr {
	height: 2px;
	margin: 60px 0 50px 0;
	background: rgba(255, 255, 255, .2);
}

.foot-lnk {
	text-align: center;
}

.nav-links a:hover {
    
    color: #f36f6f; /* Set the text color for the hover effect */
}

.current {
    background-color: #111; /* Background color for the current page link */
    color: #fff; /* Text color for the current page link (white) */
    padding: 5px 10px; /* Add padding to create a button-like structure */
    border: 1px solid #111; /* Add a border */
    border-radius: 5px; /* Add rounded corners */
    text-decoration: none; /* Remove underlines */
}

</style>

<script>

let isSessionValid = true; 

function logout() {
	

	
    if (!isSessionValid) {
        alert('Session is already invalidated. You are already logged out.');
        return;
    }

    fetch('logout', {
        method: 'POST',  // Use POST method
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Logout failed.');
        }
        // Show a popup for successful logout
        alert('Logout successful.');
        document.getElementById('usernameDropdown').style.display = 'none';

        window.location.href = 'myAccount';
        
    })
    .catch(error => {
        console.error('Logout failed:', error);
        // Handle the error as needed
        alert('Logout failed.');
    });
}



	function showPopupAndRedirect(message, redirectUrl) {
		alert(message);

		
		if (message.toLowerCase().includes('invalid user name and password')) {
			setTimeout(function() {
				window.location.href = 'myAccount';
			}); 
		} else {
			setTimeout(function() {
				window.location.href = redirectUrl;
			});
		}
	}
	
	
</script>



</head>
<body>
	<header>
	<div>
		<nav>
			<div class="logo">
				<h1>Vacation on Wheel</h1>
			</div>
			<c:set var="currentPage" value="myAccount" />
			<ul class="nav-links">
				<li><a href="home">Home</a></li>
				<li><a href="caravan">Caravans</a></li>
				
				
				<c:if test="${!(sessionScope.loginuser.role eq 'admin' )}">
					<li><a href="about">About Us</a></li>
				</c:if>


				<c:if test="${!(sessionScope.loginuser.role eq 'admin' )}">
					<li><a href="contact">Contact</a></li>
				</c:if>
			
		 <c:choose>
            <c:when test="${not empty username}">
              <!-- If not logged in, do not display the "My Account" link -->
            </c:when>
            <c:otherwise>
              <li><a href="myAccount" class="${currentPage eq 'myAccount' ? 'current' : ''}">My Account</a></li>
            </c:otherwise>
          </c:choose>

				<!-- Only show the Admin link if the user has the "admin" role -->
            

		<c:choose>
            <c:when test="${empty username}">
                <style>
                    .dropdown {
                        display: none;
                    }
                </style>
            </c:when>
        </c:choose>

				<c:if test="${not empty username}">
                    <li class="dropdown" id="usernameDropdown">
                        <button class="dropbtn">
                            <c:out value="${username}" />
                        </button>
                        <div class="dropdown-content">
                            <a href="#">Profile</a>
                            <a href="#" onclick="logout()">Logout</a>
                        </div>
                    </li>
                </c:if>
			</ul>
		</nav>
	</div>	
	</header>	
	
<div class="hero">
	<div class="login-wrap">
		<div class="login-html">
			<form action="validateUser" method="post"
				onsubmit="return validateForm();">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
					for="tab-1" class="tab">Sign In</label> <input id="tab-2"
					type="radio" name="tab" class="sign-up"><label for="tab-2"
					class="tab">Sign Up</label>
				<div class="login-form">
					<div class="sign-in-htm">
						<div class="group">
							<label for="user" class="label" name="userName">Username</label>
							<input id="user" name="userName" type="text" class="input" required>
						</div>
						<div class="group">
							<label for="pass" class="label" name="Password">Password</label>
							<input id="pass" name="password" type="password" class="input"
								data-type="password" required>
						</div>

						<div class="group">
							<input type="submit" class="button" value="Sign In">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<label for="tab-2">New Member? Click here.</a> 
							<c:if
									test="${not empty msgLogin}">
									<script>
										showPopupAndRedirect(
												"Caravan My Account: ${msgLogin}",
												"home");
									</script>
									<c:remove var="msgLogin" />
								</c:if>
						</div>
					</div>
			</form>
			<div class="sign-up-htm">
				<form action="createUser" method="post"
					onsubmit="return validateForm();">
					<div class="group">
						<label for="user" class="label" name="userName">UserName</label> <input
							id="user" type="text" class="input" name="userName" required
							minlength="4" maxlength="20">
					</div>
					<div class="group">
						<label for="pass" class="label" name="Password">Password</label> <input
							id="pass" type="password" class="input" data-type="password"
							name="password" required minlength="4">
					</div>

					<div class="group">
						<label for="email" class="label" name="email">Email
							Address</label> <input id="email" type="email" class="input" name="email"
							required>
					</div>
					<div class="group">
						<input type="submit" class="button" value="Sign Up">
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<label for="tab-1">Already Member? Click here.</a> <c:if
								test="${not empty msgReg}">
								<script>
									function showCaravanMyAccountPopup() {
										const message = '${msgReg}';
										alert("Caravan My Account : " + message);
									}
									showCaravanMyAccountPopup();
								</script>

								<c:remove var="msgReg" />
							</c:if>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

	
	<div>
	<!-- Footer -->
	<footer>
		<p>&copy; 2023 Vacation on Wheel</p>
	</footer>
</div>
</body>
</html>
