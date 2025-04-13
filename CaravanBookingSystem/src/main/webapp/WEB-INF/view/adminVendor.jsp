
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Caravan Admin</title>
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
	min-height: 100vh;
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

footer {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 10px 0;
	margin-top: auto; /* Push the footer to the bottom */
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
	border-radius: 5px;
	display: none;
	position: absolute;
	background-color: #fff;
	min-width: 103px;
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

/* Styles for the Customer Table */
.customer {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
}

.cusH {
	font-size: 24px;
	margin-bottom: 10px;
}

.cusHead th, .cusBody td {
	padding: 10px;
	text-align: left;
}

.cusHead th {
	background-color: #f0f0f0;
}

.cusBody td {
	background-color: #ffffff;
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


/* Styles for the Customer Table */
.customer {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
}

.cusH {
	font-size: 24px;
	margin-bottom: 10px;
}

.cusHead th, .cusBody td {
	padding: 10px;
	text-align: left;
}

.cusHead th {
	background-color: #f0f0f0;
}

.cusBody td {
	background-color: #ffffff;
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
        credentials: 'same-origin'
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Logout failed.');
        }
        // Show a popup for successful logout
        alert('Logout successful.');
        // Redirect to the myAccount page
        document.getElementById('usernameDropdown').style.display = 'none';
        
        window.location.href = 'myAccount';
        
    })
    .catch(error => {
        console.error('Logout failed:', error);
        // Handle the error as needed
        alert('Logout failed.');
    });
}



	
</script>



</head>



<body>

	<header>
		<nav>
			<div class="logo">
				<h1>Vacation on Wheel</h1>
			</div>
			<c:set var="currentPage" value="adminVendor" />
			<ul class="nav-links">
				<li><a href="home">Home</a></li>
				<li><a href="caravan">Caravans</a></li>

				<c:choose>
					<c:when test="${not empty username}">
						<!-- If not logged in, do not display the "My Account" link -->
					</c:when>
					<c:otherwise>
						<li><a href="myAccount">My Account</a></li>
					</c:otherwise>
				</c:choose>


				<!-- Only show the Admin link if the user has the "admin" role -->
				<c:if
					test="${not empty username && sessionScope.loginuser.role eq 'admin'}">
					<li><a href="adminCustomer">Customer details</a></li>
					<li><a href="adminVendor" class="${currentPage eq 'adminVendor' ? 'current' : ''}">vendor Details</a></li>
					<li><a href="admin">All Caravan</a></li>
					<li><a href="adminBooking">All Bookings</a></li>
				</c:if>

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
							<a href="#" onclick="logout()">Logout</a>
						</div>
					</li>
				</c:if>
			</ul>
		</nav>
	</header>

	<h2 class=cusH style="text-align: left;;margin-top:20px;">Vendor Table</h2>
	<table border="1" class="customer">
		<thead class="cusHead">
			<tr>
				<th>User ID</th>
				<th>User Name</th>
				<th>Email</th>
				
				<!-- Add other user attributes as needed -->
			</tr>
		</thead>
		<tbody class="cusBody">
			<c:forEach var="user" items="${userList}">
				<c:if test="${user.role eq 'vendor'}">
					<tr>
						<td>${user.id}</td>
						<td>${user.userName}</td>
						<td>${user.email}</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>

	<footer>
		<p>&copy; 2023 Vacation on Wheel</p>
	</footer>
</body>
</html>