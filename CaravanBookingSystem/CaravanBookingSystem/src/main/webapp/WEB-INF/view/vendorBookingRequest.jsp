<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Caravan Home</title>
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

.hero {
	background-image:
		url(https://github.com/lakhanbb/caravan-img/raw/main/caravan-img.jpg);
	background-size: cover;
	width: 100%; /* Adjust the width as needed */
	height: 650px;
	background-position: center;
	text-align: center;
	padding: 100px 0;
	color: #fff;
}

.hero h2 {
	font-size: 36px;
	margin-bottom: 20px;
}

.hero p {
	font-size: 18px;
	margin-bottom: 40px;
}

.btn {
	display: inline-block;
	padding: 10px 20px;
	background-color: #f36f6f;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.btn:hover {
	background-color: #e14545;
}

.about-us {
	background-color: #fff;
	max-width: 100%;
	margin: 0 auto;
	padding: 40px;
	text-align: left;
	margin-top: 2px;
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
	max-width: 103px;
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

table {
	width: 95%;
	margin: 20px auto;
	border-collapse: collapse;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 15px;
	text-align: left;
	border: 1px solid #333; /* Darken the border */
}

th {
	background-color: #f36f6f;
	color: #fff;
}

img {
	width: 300px;
	height: 200px;
}

/* Style every odd row in the table body */
tbody tr:nth-child(odd) {
	background-color: #d0d0d0; /* Light background color */
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
			<c:set var="currentPage" value="vendorBookingRequest" />
			<ul class="nav-links">
				<li><a href="home" >Home</a></li>
				<li><a href="caravan">Caravans</a></li>

				<!-- ... (previous code) ... -->

				<c:choose>
					<c:when
						test="${empty username or sessionScope.loginuser.role eq 'admin' or sessionScope.loginuser.role eq 'vendor'}">
						<!-- No action or content here when the condition is true -->
					</c:when>
					<c:otherwise>
						<li><a href="yourBooking">Your Bookings</a></li>
					</c:otherwise>
				</c:choose>

				<c:if
					test="${not empty username && sessionScope.loginuser.role eq 'vendor'}">
					<li><a href="vendor">Add New Caravan</a></li>
					<li><a href="vendorAddedCaravan">Your Added Caravan</a></li>
					<li><a href="vendorBookingRequest"  class="${currentPage eq 'vendorBookingRequest' ? 'current' : ''}">Booking Request</a></li>
				</c:if>

				<c:choose>
					<c:when test="${not empty username}">
						<!-- If not logged in, do not display the "My Account" link -->
					</c:when>
					<c:otherwise>
						<li><a href="myAccount">My Account</a></li>
					</c:otherwise>
				</c:choose>

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


	<h2 style="text-align: left;;margin-top:20px;" >Your Bookings</h2>

	<table border="1">
		<thead>
			<tr>
				<th>Caravan ID</th>
				<th>Caravan Title</th>
				<th>Caravan Image</th>
				<th>Booking ID</th>
				<th>Requesting User Info</th>
				<th>Phone</th>
				<th>Check-In Date</th>
				<th>Check-Out Date</th>
				<th>Status</th>
				 <th>Accept</th>
				 <th>Cancel</th>
				 <th>Cancel</th>
				 
			</tr>
		</thead>
		<tbody>
			<c:forEach var="booking" items="${allBookings}">
				<c:if
					test="${fn:contains(booking.caravanVendor, sessionScope.loginuser.userName) and fn:contains(booking.caravanVendor, sessionScope.loginuser.email)}">
					<tr>
						<td>${booking.caravanId}</td>
						<c:forEach var="caravan" items="${caravanList}">
							<c:if test="${caravan.id eq booking.caravanId}">
								<td>${caravan.title}</td>
								<td><img
									src="<c:url value='/resources/img/${caravan.image1}' />"
									alt="Caravan Image"></td>
							</c:if>
						</c:forEach>
						<td>${booking.id}</td>
						<td>${booking.bookingUserDetails}</td>
						<td>${booking.phone}</td>
						<td>${booking.checkIn}</td>
						<td>${booking.checkOut}</td>
						<td>${booking.status}</td>
						<td>
            			<form action="acceptRide/${booking.id}" method="post">
               				 <button type="submit">Accept</button>
           				 </form></td>
        				<td>
            			<form action="cancelRide/${booking.id}" method="post">
                			<button type="submit">Cancel</button>
            			</form></td>
       					<td>
            			<form action="endRide/${booking.id}" method="post">
                			<button type="submit">End Ride</button>
           			   </form></td>
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