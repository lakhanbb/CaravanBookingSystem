
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Caravans</title>
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

.CaravanTable {
	width: 95%;
	margin: 20px auto;
	border-collapse: collapse;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
	/* Add shadow to the table */
}

.CaravanTable th, .CaravanTable td {
	padding: 15px;
	text-align: left;
	border: 1px solid #333; /* Darken the border */
}

.CaravanTable th {
	background-color: #f36f6f;
	color: #fff;
}

.CaravanTable img {
	width: 150px;
	height: 150px;
}

.CaravanTable button {
	background-color: #4caf50;
	color: white;
	border: none;
	padding: 8px 12px;
	cursor: pointer;
	border-radius: 5px;
}

.CaravanTable button:hover {
	background-color: #45a049;
}

.CaravanPag {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
}

.CaravanTable tbody {
	display: table-row-group;
}

.CaravanTable tbody tr {
	display: table-row;
}

.CaravanTable tbody tr td {
	padding: 15px;
	text-align: left;
}

.CaravanTable tbody tr:hover {
	background-color: #f5f5f5;
}

/* Style every second row (even rows) in the table body */
.CaravanTable tbody tr:nth-child(even) {
	background-color: #e0e0e0; /* Dark background color */
}

/* Style every odd row in the table body */
.CaravanTable tbody tr:nth-child(odd) {
	background-color: #d0d0d0; /* Light background color */
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.9);
}

.modal-content {
	margin: 50px auto;
	display: block;
	max-width: 80%;
	max-height: 80%;
}

.close {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #f1f1f1;
	font-size: 40px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover, .close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}

#bookingModal {
	display: none;
}

#bookingModal .modal-content {
	margin: 50px auto;
	background-color: #fff;
	padding: 40px;
	border-radius: 5px;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
}

#bookingModal label {
	display: block;
	margin-bottom: 10px;
}

#bookingModal input {
	width: 100%;
	padding: 8px;
	margin-bottom: 15px;
}

#bookingModal button {
	background-color: #4caf50;
	color: white;
	border: none;
	padding: 8px 12px;
	cursor: pointer;
	border-radius: 5px;
}

#bookingModal .total-cost {
	font-size: 18px;
	margin-top: 20px;
}

#bookingModal .error-message {
	color: red;
	margin-top: 10px;
}

#confirmBookingButton {
	display: none;
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


function openImageModal(imageSrc) {
    var modal = document.getElementById('imageModal');
    var modalImg = document.getElementById('modalImage');

    modal.style.display = 'block';
    modalImg.src = imageSrc;
}

function closeImageModal() {
    document.getElementById('imageModal').style.display = 'none';
}



function bookCaravan(caravanId) {
var isLoggedIn = ${not empty username};
    
    if (!isLoggedIn) {
        // User is not logged in, show a pop-up message
        alert("You need to log in to make a booking.");
        // Redirect to the myAccount page
        window.location.href = 'myAccount';
    } else {
        // User is logged in, proceed with booking
        // Show the booking modal
        document.getElementById('bookingModal').style.display = 'block';

        // Set the caravanId in a hidden input for reference when confirming the booking
        document.getElementById('caravanIdInput').value = caravanId;
    }
}

function calculateAndShowTotal() {
    // Calculate the total cost
    const checkInDate = new Date(document.getElementById('checkIn').value);
    const checkOutDate = new Date(document.getElementById('checkOut').value);
    const pricePerDay = parseFloat(document.querySelector('.caravanPrice').innerText);

    if (checkInDate >= checkOutDate) {
        document.getElementById('errorMessage').innerText = 'Check-out date must be after check-in date.';
        return;
    }

    const numberOfDays = Math.ceil((checkOutDate - checkInDate) / (1000 * 60 * 60 * 24));
    const totalCost = pricePerDay * numberOfDays;

 // Display the total cost
    document.getElementById('totalCost').innerText = `Total Cost: $${totalCost.toFixed(2)}`;

    // Show the confirm button
    document.getElementById('confirmBookingButton').style.display = 'block';


}


function confirmBooking() {
    alert("Booking confirmed!");
    submitBookingForm();
    document.getElementById('bookingModal').style.display = 'none';
}

function submitBookingForm() {
    document.forms[0].submit();
}

function closeBookingModal() {
    document.getElementById('bookingModal').style.display = 'none';
}

</script>

</head>
<body>

	<header>
		<nav>
			<div class="logo">
				<h1>Vacation on Wheel</h1>
			</div>
			<c:set var="currentPage" value="caravan" />
			<ul class="nav-links">
				<li><a href="home">Home</a></li>
				<li><a href="caravan" class="${currentPage eq 'caravan' ? 'current' : ''}">Caravan</a></li>

				<c:choose>
					<c:when
						test="${empty username or sessionScope.loginuser.role eq 'admin' or sessionScope.loginuser.role eq 'vendor'}">
						<!-- No action or content here when the condition is true -->
					</c:when>
					<c:otherwise>
						<li><a href="yourBooking">Your Bookings</a></li>
					</c:otherwise>
				</c:choose>


				<c:choose>
					<c:when
						test="${sessionScope.loginuser.role eq 'admin' or sessionScope.loginuser.role eq 'vendor'}">
						<!-- No action or content here when the condition is true -->
					</c:when>
					<c:otherwise>
						<li><a href="about">About Us</a></li>
						<li><a href="contact">Contact</a></li>
					</c:otherwise>
				</c:choose>
	

				<c:if
					test="${not empty username && sessionScope.loginuser.role eq 'vendor'}">
					<li><a href="vendor">Add New Caravan</a></li>
					<li><a href="vendorAddedCaravan">Your Added Caravan</a></li>
					<li><a href="vendorBookingRequest">Booking Request</a></li>
				</c:if>


				<c:choose>
					<c:when test="${not empty username}">
					</c:when>
					<c:otherwise>
						<li><a href="myAccount">My Account</a></li>
					</c:otherwise>
				</c:choose>


				<c:if
					test="${not empty username && sessionScope.loginuser.role eq 'admin'}">
					<li><a href="adminCustomer">Customer details</a></li>
					<li><a href="adminVendor">vendor Details</a></li>
					<li><a href="admin">All Caravan</a></li>
					<li><a href="adminBooking">All Booking</a></li>
				</c:if>


				<c:if test="${not empty username}">
					<li class="dropdown">
						<button class="dropbtn" id="usernameDropdown">
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

	<table class="CaravanTable">
		<thead>
			<tr>
				<th>Title</th>
				<th>Description</th>
				<th>Price Per Day</th>
				<th>Image 1</th>
				<th>Image 2</th>
				<th>Image 3</th>
				<th>Image 4</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody class="CaravanPag">
			<c:forEach var="caravan" items="${caravanList}">
				<tr>
					<td>${caravan.title}</td>
					<td>${caravan.description}</td>
					<td class="caravanPrice">${caravan.price}</td>
					<td><img class="enlarge-image"
						src="<c:url value='/resources/img/${caravan.image1}'/>"
						width="200" height="200" alt="Image 1"
						onclick="openImageModal('<c:url value='/resources/img/${caravan.image1}'/>')">
					</td>
					<td><img class="enlarge-image"
						src="<c:url value='/resources/img/${caravan.image2}'/>"
						width="200" height="200" alt="Image 2"
						onclick="openImageModal('<c:url value='/resources/img/${caravan.image2}'/>')">
					</td>
					<td><img class="enlarge-image"
						src="<c:url value='/resources/img/${caravan.image3}'/>"
						width="200" height="200" alt="Image 3"
						onclick="openImageModal('<c:url value='/resources/img/${caravan.image3}'/>')">
					</td>
					<td><img class="enlarge-image"
						src="<c:url value='/resources/img/${caravan.image4}'/>"
						width="200" height="200" alt="Image 4"
						onclick="openImageModal('<c:url value='/resources/img/${caravan.image4}'/>')">
					</td>
					<td><c:if
							test="${empty username or sessionScope.loginuser.role ne 'admin' and sessionScope.loginuser.role ne 'vendor'}">
							<button onclick="bookCaravan(${caravan.id})">Book Now</button>
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<footer>
		<p>&copy; 2023 Vacation on Wheel</p>
	</footer>

	<div id="imageModal" class="modal">
		<span class="close" onclick="closeImageModal()">&times;</span> <img
			class="modal-content" id="modalImage">
	</div>

	<div id="bookingModal" class="modal">
		<div class="modal-content" style="width: 400px;">
			<span class="close" onclick="closeBookingModal()">&times;</span>
			<h2>Booking Information</h2>
			<form action="confirmBooking" method="post"
				onsubmit="event.preventDefault(); calculateAndShowTotal();">


				<label for="phone">Phone:</label> <input type="tel" id="phone"
					name="phone" required><br> <label for="checkIn">Check-In
					Date:</label> <input type="date" id="checkIn" name="checkIn" required
					onchange="calculateTotalCost()"><br> <label
					for="checkOut">Check-Out Date:</label> <input type="date"
					id="checkOut" name="checkOut" required
					onchange="calculateTotalCost()"><br>

				<!-- Hidden input to store the caravanId -->
				<input type="hidden" id="caravanIdInput" name="caravanId">


				<div class="total-cost" id="totalCost"></div>
				<div class="error-message" id="errorMessage"></div>

				<!-- Submit button -->
				<button type="submit" style="margin-bottom: 15px;">Submit</button>

				<!-- Confirm booking button (initially hidden) -->
				<button type="button" id="confirmBookingButton"
					onclick="confirmBooking()">Confirm Booking</button>
			</form>
		</div>
	</div>


</body>

<%
session.removeAttribute("msgWelcome");
%>

</html>