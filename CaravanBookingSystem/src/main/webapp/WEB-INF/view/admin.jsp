
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
	width: 97%;
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



   
	const msgWelcome = "${sessionScope.msgWelcome}";
    if (msgWelcome && msgWelcome.toLowerCase().includes('admin')) {
        alert(msgWelcome);
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
    

</script>


</head>
<body>

	<header>
		<nav>
			<div class="logo">
				<h1 >Vacation on Wheel</h1>
			</div>
			<c:set var="currentPage" value="admin" />
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
					<li><a href="adminVendor">vendor Details</a></li>
					<li><a href="admin" class="${currentPage eq 'admin' ? 'current' : ''}">All Caravan</a></li>
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


	<h2 style="text-align: left;;margin-top:20px;" class="cusH">Caravan Table</h2>
	<table border="1" class="customer">
		<thead class="cusHead">
			<tr>
				<th>Caravan ID</th>
				<th>Title</th>
				<th>Description</th>
				<th>Price</th>
				<th>Image 1</th>
				<th>Image 2</th>
				<th>Image 3</th>
				<th>Image 4</th>
				<th>Vendor Details</th>
				<!-- Add other caravan attributes as needed -->
			</tr>
		</thead>
		<tbody class="cusBody">
			<c:forEach var="caravan" items="${caravanList}">
				<tr>
					<td>${caravan.id}</td>
					<td>${caravan.title}</td>
					<td>${caravan.description}</td>
					<td>${caravan.price}</td>
					<td><img class="enlarge-image"
						src="<c:url value='/resources/img/${caravan.image1}'/>"
						width="150" height="150" alt="Image 1"
						onclick="openImageModal('<c:url value='/resources/img/${caravan.image1}'/>')">
					</td>
					<td><img class="enlarge-image"
						src="<c:url value='/resources/img/${caravan.image2}'/>"
						width="150" height="150" alt="Image 2"
						onclick="openImageModal('<c:url value='/resources/img/${caravan.image2}'/>')">
					</td>
					<td><img class="enlarge-image"
						src="<c:url value='/resources/img/${caravan.image3}'/>"
						width="150" height="150" alt="Image 3"
						onclick="openImageModal('<c:url value='/resources/img/${caravan.image3}'/>')">
					</td>
					<td><img class="enlarge-image"
						src="<c:url value='/resources/img/${caravan.image4}'/>"
						width="150" height="150" alt="Image 4"
						onclick="openImageModal('<c:url value='/resources/img/${caravan.image4}'/>')">
					</td>
					<td>${caravan.vendorDetails}</td>
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
</body>

<%
session.removeAttribute("msgWelcome");
%>

</html>