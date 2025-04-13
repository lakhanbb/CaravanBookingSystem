
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Caravan Vendor</title>
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
	margin-bottom: 20px;
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
	margin-top: 20px;
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

     form {
        max-width: 650px; /* Increase the maximum width of the form */
        width: 95%; /* Set the width to 80% of the parent container */
        margin: 0 auto; /* Center the form horizontally on the page */
        padding: 20px 20px; /* Add padding for spacing */
        background-color: #f5f5f5; /* Background color for the form */
        border: 1px solid #ddd; /* Add a border */
        border-radius: 5px; /* Add rounded corners */
        margin-bottom: 50px;
        
    }

    /* Add a heading for the form */
    form h2 {
        text-align: center; /* Center the heading */
        margin-bottom: 20px; /* Add some spacing below the heading */
    }

    /* Style for labels */
    label {
        display: block; /* Display labels in a block format */
        margin-bottom: 5px; /* Add some space between labels and inputs */
    }

    /* Style for text inputs and textareas */
    input[type="text"],
    input[type="number"],
    textarea {
        width: 98%; /* Take the full width of the container */
        padding: 10px; /* Add padding for input elements */
        margin-bottom: 10px; /* Add spacing between input elements */
        border: 1px solid #ddd; /* Add a border */
        border-radius: 5px; /* Add rounded corners */
    }

    /* Style for the file input */
    input[type="file"] {
        width: 98%;;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #fff; /* Background color for file input */
    }

    /* Style for the submit button */
    input[type="submit"] {
        background-color: #f36f6f; /* Background color for the button */
        color: #fff; /* Text color for the button */
        border: none;
        padding: 15px 20px;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #e14545; /* Change background color on hover */
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

.close:hover,
.close:focus {
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


const msgWelcome = "${sessionScope.msgWelcomeVen}";
if (msgWelcome && msgWelcome.toLowerCase().includes('vendor')) {
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
				<h1>Vacation on Wheel</h1>
			</div>
			<c:set var="currentPage" value="vendor" />
			<ul class="nav-links">
				<li><a href="home">Home</a></li>
				<li><a href="caravan">Caravans</a></li>
				

            
            <c:if test="${not empty username && sessionScope.loginuser.role eq 'vendor'}">
            	<li><a href="vendor" class="${currentPage eq 'vendor' ? 'current' : ''}">Add New Caravan</a></li>
                <li><a href="vendorAddedCaravan" class="${currentPage eq 'vendorAddedCaravan' ? 'current' : ''}">Your Added Caravan</a></li>
                <li><a href="vendorBookingRequest">Booking Request</a></li>
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
<h2 style="text-align: left;;margin-top:20px;" >Add new Caravans :-</h2>
<form action="addCaravan" method="post" enctype="multipart/form-data" >
    <label for="title" >Title:</label>
    <input type="text" name="title" required><br>
    
    <label for="description" >Description:</label>
    <textarea name="description" required></textarea><br>
    
    <label for="price" >Price per day:</label>
    <input type="number" name="price" required><br>
    
    <label >Upload Images:</label>
    <input type="file" name="image1" required ><br>
    <input type="file" name="image2" required ><br>
    <input type="file" name="image3" required ><br>
    <input type="file" name="image4" required ><br>
    
    
    <input type="submit" value="Add Caravan">
</form>


	<footer class="footer">
		<p>&copy; 2023 Vacation on Wheel</p>
	</footer>
	
<div id="imageModal" class="modal">
    <span class="close" onclick="closeImageModal()">&times;</span>
    <img class="modal-content" id="modalImage">
</div>
</body>

<% session.removeAttribute("msgWelcomeVen"); %>

</html>