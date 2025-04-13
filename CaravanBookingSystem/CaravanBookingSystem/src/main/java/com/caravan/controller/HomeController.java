package com.caravan.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.caravan.Dao.BookingDao;
import com.caravan.Dao.CaravanDao;
import com.caravan.Dao.UserDao;
import com.caravan.entity.Booking;
import com.caravan.entity.Caravan;
import com.caravan.entity.User;

@Controller
public class HomeController {

	@Autowired
	private UserDao userDao;

	@Autowired
	private CaravanDao caravanDao;
	
	@Autowired
    private BookingDao bookingDao;

	@RequestMapping(path = "/home")
	public String home(HttpServletResponse response) {
		setNoCacheHeaders(response);
		return "home";
	}

	
	
	@RequestMapping(path = "/myAccount")
	public String myAccount(HttpServletResponse response,HttpSession session) {
		setNoCacheHeaders(response);
		
		if (session.getAttribute("loginuser") != null) {
	        // If the user is logged in, redirect to the home page or another appropriate page
	        return "redirect:/home";
	    }
		
		return "myAccount";
	}
	
	
	
	@RequestMapping(path = "/about")
	public String about(HttpServletResponse response) {
		setNoCacheHeaders(response);
		return "about";
	}
	
	@RequestMapping(path = "/contact")
	public String contact(HttpServletResponse response) {
		setNoCacheHeaders(response);
		return "contact";
	}

	
	
	@RequestMapping(path = "/admin")
	public String admin(HttpServletResponse response, Model m, HttpServletRequest request) {
	    setNoCacheHeaders(response);

	    HttpSession session = request.getSession(false);

	    if (session == null || session.getAttribute("loginuser") == null) {
	        // If the session is null or the loginuser attribute is not set, redirect to the login page
	        return "redirect:/myAccount";
	    }

	    User loginUser = (User) session.getAttribute("loginuser");

	    // Check if the logged-in user has the role "admin"
	    if (!"admin".equals(loginUser.getRole())) {
	        // If the role is not "admin", redirect to the home page or another appropriate page
	        return "redirect:/home";
	    }

	    // Retrieve the list of users
	    List<User> userList = userDao.getAllUser();

	    // Add the user list to the model
	    m.addAttribute("userList", userList);

	    // Retrieve the list of caravans
	    List<Caravan> caravanList = caravanDao.getAllCaravans();

	    // Add the caravan list to the model
	    m.addAttribute("caravanList", caravanList);

	    return "admin";
	}
	
	
	
	
	@RequestMapping(path = "/adminCustomer")
	public String adminCustomer(HttpServletResponse response, Model m, HttpServletRequest request){
		
		setNoCacheHeaders(response);
		
		HttpSession session = request.getSession(false);

	    if (session == null || session.getAttribute("loginuser") == null) {
	        // If the session is null or the loginuser attribute is not set, redirect to the login page
	        return "redirect:/myAccount";
	    }

	    User loginUser = (User) session.getAttribute("loginuser");

	    // Check if the logged-in user has the role "admin"
	    if (!"admin".equals(loginUser.getRole())) {
	        // If the role is not "admin", redirect to the home page or another appropriate page
	        return "redirect:/home";
	    }
		
		// Retrieve the list of users
	    List<User> userList = userDao.getAllUser();

	    // Add the user list to the model
	    m.addAttribute("userList", userList);
		
		return "adminCustomer";
	}
	
	
	
	
	@RequestMapping(path = "/adminVendor")
	public String adminVendor(HttpServletResponse response, Model m, HttpServletRequest request){
		
		setNoCacheHeaders(response);
		
		HttpSession session = request.getSession(false);

	    if (session == null || session.getAttribute("loginuser") == null) {
	        // If the session is null or the loginuser attribute is not set, redirect to the login page
	        return "redirect:/myAccount";
	    }

	    User loginUser = (User) session.getAttribute("loginuser");

	    // Check if the logged-in user has the role "admin"
	    if (!"admin".equals(loginUser.getRole())) {
	        // If the role is not "admin", redirect to the home page or another appropriate page
	        return "redirect:/home";
	    }
		
		// Retrieve the list of users
	    List<User> userList = userDao.getAllUser();

	    // Add the user list to the model
	    m.addAttribute("userList", userList);
		
		return "adminVendor";
	}
	
	
	@RequestMapping(path = "/adminBooking")
	public String adminBooking(HttpServletResponse response, Model model, HttpServletRequest request){
		
		setNoCacheHeaders(response);
		
		HttpSession session = request.getSession(false);

	    if (session == null || session.getAttribute("loginuser") == null) {
	        // If the session is null or the loginuser attribute is not set, redirect to the login page
	        return "redirect:/myAccount";
	    }

	    User loginUser = (User) session.getAttribute("loginuser");

	    // Check if the logged-in user has the role "admin"
	    if (!"admin".equals(loginUser.getRole())) {
	        // If the role is not "admin", redirect to the home page or another appropriate page
	        return "redirect:/home";
	    }

	    
	    List<Booking> allBookings = bookingDao.getAllBookings();

	    
	    model.addAttribute("allBookings", allBookings);
	    
	    List<Caravan> caravanList = caravanDao.getAllCaravans();

	    
	    model.addAttribute("caravanList", caravanList);

		
		return "adminBooking";
	}
	


	
	

	@RequestMapping(path = "/vendor")
	public String vendor(HttpServletResponse response, Model m, HttpServletRequest request) {
	    setNoCacheHeaders(response);

	    HttpSession session = request.getSession(false);

	    if (session == null || session.getAttribute("loginuser") == null) {
	        // If the session is null or the loginuser attribute is not set, redirect to the login page
	        return "redirect:/myAccount";
	    }

	    User loginUser = (User) session.getAttribute("loginuser");

	    // Check if the logged-in user has the role "vendor"
	    if (!"vendor".equals(loginUser.getRole())) {
	        // If the role is not "vendor", redirect to the home page or another appropriate page
	        return "redirect:/home";
	    }

	    List<User> userList = userDao.getAllUser();

	    // Add the user list to the model
	    m.addAttribute("userList", userList);

	    // Retrieve the list of caravans
	    List<Caravan> caravanList = caravanDao.getAllCaravans();

	    // Add the caravan list to the model
	    m.addAttribute("caravanList", caravanList);

	    return "vendor";
	}


	@RequestMapping(path = "/caravan")
	public String caravan(HttpServletResponse response, Model m) {
		setNoCacheHeaders(response);
		
		
		// Retrieve the list of users
	    List<User> userList = userDao.getAllUser();

	    // Add the user list to the model
	    m.addAttribute("userList", userList);

	    // Retrieve the list of caravans
	    List<Caravan> caravanList = caravanDao.getAllCaravans();

	    // Add the caravan list to the model
	    m.addAttribute("caravanList", caravanList);

		return "caravan";
	}
	
	
	
	@RequestMapping(path = "/vendorAddedCaravan")
	public String vendorAddedCaravan(HttpServletResponse response, Model m,HttpServletRequest request) {
		setNoCacheHeaders(response);

	    HttpSession session = request.getSession(false);

	    if (session == null || session.getAttribute("loginuser") == null) {
	        // If the session is null or the loginuser attribute is not set, redirect to the login page
	        return "redirect:/myAccount";
	    }

	    User loginUser = (User) session.getAttribute("loginuser");

	    // Check if the logged-in user has the role "vendor"
	    if (!"vendor".equals(loginUser.getRole())) {
	        // If the role is not "vendor", redirect to the home page or another appropriate page
	        return "redirect:/home";
	    }

	    List<User> userList = userDao.getAllUser();

	    // Add the user list to the model
	    m.addAttribute("userList", userList);

	    // Retrieve the list of caravans
	    List<Caravan> caravanList = caravanDao.getAllCaravans();

	    // Add the caravan list to the model
	    m.addAttribute("caravanList", caravanList);

	    return "vendorAddedCaravan";
	}
	
	

	private void setNoCacheHeaders(HttpServletResponse response) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	}

	@RequestMapping(path = "/createUser", method = RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute User user, BindingResult bindingResult, HttpSession session) {
		if (bindingResult.hasErrors()) {
			return "your_error_view"; 
		}

		int saveResult = userDao.saveUser(user);

		if (saveResult == -1) {
			session.setAttribute("msgReg",
					"Registration failed. Username already exists. Please choose a different username.");
			
			return "redirect:/myAccount";

		} else if (saveResult == -2) {
			session.setAttribute("msgReg",
					"Registration failed. Email is already in use. Please use a different email.");
			
			return "redirect:/myAccount";

		} else if (saveResult == -3) {
			session.setAttribute("msgReg",
					"Registration failed. This password is not allowed. Please choose a different password.");
			
			return "redirect:/myAccount";

		} else {
			session.setAttribute("msgReg", "Register Successfully");
			
			return "redirect:/myAccount";

		}
	}

	@RequestMapping(path = "/validateUser", method = RequestMethod.POST)
	public String UserLogin(@RequestParam("userName") String em, @RequestParam("password") String pwd,
			HttpSession session) {
		User user = userDao.loginUser(em, pwd);

		if (user != null) {
			String username = user.getUserName();
			session.setAttribute("loginuser", user);
			session.setAttribute("username", username);
			session.setAttribute("msgLogin", "Login successful");

			if ("admin".equals(user.getRole())) {
				// Show a welcome pop-up for admin
				session.setAttribute("msgWelcome", "Welcome, Admin!");

				// Redirect to the admin page
				return "redirect:/admin";
			} else if ("vendor".equals(user.getRole())) {

				session.setAttribute("msgWelcomeVen", "Welcome, Caravan Vendor!");

				// Redirect to the vendor page for vendor role
				return "redirect:/vendor";
			}else {
				session.setAttribute("msgWelcome", "Welcome, " + username + "!");
				return "redirect:/myAccount";
			}
		} else {
			session.setAttribute("msgLogin", "Invalid username and password");
			return "redirect:/myAccount";
		}
	}
	

	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public ResponseEntity<String> logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		if (session == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Session is already invalidated.");
		}

		session.removeAttribute("username");
		session.invalidate();
		return ResponseEntity.ok("success");
	}

	
	@RequestMapping("/deleteUser/{id}")
	public String deleteUser(@PathVariable int id, HttpSession session) {
		userDao.deleteUser(id);
		session.setAttribute("msg", "delete successfully");
		return "redirect:/admin";
	}
	
	

	@RequestMapping(value = "/addCaravan", method = RequestMethod.POST)
	public String addCaravan(@ModelAttribute("caravan") Caravan caravan, BindingResult bindingResult,
			@RequestParam("image1") CommonsMultipartFile image1, @RequestParam("image2") CommonsMultipartFile image2,
			@RequestParam("image3") CommonsMultipartFile image3, @RequestParam("image4") CommonsMultipartFile image4,
			HttpServletRequest req, HttpSession session) {

		List<CommonsMultipartFile> images = Arrays.asList(image1, image2, image3, image4);

		List<String> imageNames = new ArrayList<>();

		for (int i = 0; i < images.size(); i++) {
			CommonsMultipartFile currentImage = images.get(i);
			byte[] bytes = currentImage.getBytes();

			String fileName = "image" + (i + 1) + "_" + System.currentTimeMillis() + ".jpg";
			String directoryPath = req.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources"
					+ File.separator + "img" + File.separator;

			String filePath = directoryPath + fileName;
			Path path = Paths.get(filePath);

			// Create the directory if it doesn't exist
			File directory = new File(directoryPath);
			if (!directory.exists()) {
				directory.mkdirs();
			}

			// Use try-with-resources to automatically close the FileOutputStream
			try (FileOutputStream fos = new FileOutputStream(path.toFile())) {
				fos.write(bytes);
				System.out.println("File " + fileName + " uploaded successfully to: " + filePath);

				// Add the image name to the list
				imageNames.add(fileName);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		User loggedInUser = (User) session.getAttribute("loginuser");

	    // Set vendor details in the Caravan entity
	    String vendorDetails = "Vendor Name: " + loggedInUser.getUserName() + ", Email: " + loggedInUser.getEmail();
	    caravan.setVendorDetails(vendorDetails);
	    
	    
	    caravan.setImage1(imageNames.get(0));
	    caravan.setImage2(imageNames.get(1));
	    caravan.setImage3(imageNames.get(2));
	    caravan.setImage4(imageNames.get(3));


		

		// Save the Caravan entity in the database
		Long caravanId = caravanDao.saveCaravan(caravan);

		System.out.println("All files uploaded successfully");

		return "redirect:/caravan";
	}
	
	
	
	
	@RequestMapping(value = "/confirmBooking", method = RequestMethod.POST)
	public String confirmBooking(@RequestParam String phone, @RequestParam String checkIn,
	                             @RequestParam String checkOut, @RequestParam int caravanId,
	                             Model model, HttpSession session,
	                             HttpServletResponse response) {

	    setNoCacheHeaders(response);

	    User loggedInUser = (User) session.getAttribute("loginuser");

	    if (loggedInUser == null) {
	        // User is not logged in, show a message and redirect to myAccount page
	        model.addAttribute("errorMessage", "You need to log in to make a booking.");
	        return "myAccount"; // Replace with your actual myAccount page
	    }

	    // Create a Booking object with the received data
	    Booking booking = new Booking();
	    booking.setPhone(phone);
	    booking.setCheckIn(checkIn);
	    booking.setCheckOut(checkOut);
	    booking.setCaravanId(caravanId);

	    // Fetch the Caravan entity from the database using caravanId
	    Caravan associatedCaravan = caravanDao.getCaravanById((long) caravanId);

	    // Set vendor details in the Caravan entity
	    String bookerDetails = "User Name: " + loggedInUser.getUserName() + ", Email: " + loggedInUser.getEmail();
	    booking.setBookingUserDetails(bookerDetails);

	    // Set caravanVendor in Booking entity with vendor details from Caravan
	    if (associatedCaravan != null) {
	        booking.setCaravanVendor(associatedCaravan.getVendorDetails());
	    } else {
	        // Handle the case where no caravan is found for the given caravanId
	        model.addAttribute("errorMessage", "Caravan not found for the provided caravanId.");
	        return "errorPage"; // Replace with your actual error page
	    }

	    // Save the booking
	    Long bookingId = bookingDao.saveBooking(booking);

	    // Check if the booking was saved successfully
	    if (bookingId != null) {
	        // Booking saved successfully, add booking details to the model
	        model.addAttribute("bookingId", bookingId);
	        model.addAttribute("phone", phone);
	        model.addAttribute("checkIn", checkIn);
	        model.addAttribute("checkOut", checkOut);
	        model.addAttribute("caravanId", caravanId);

	        return "home"; // Replace with your actual confirmation page
	    } else {
	        model.addAttribute("errorMessage", "Failed to save booking.");
	        return "errorPage"; // Replace with your actual error page
	    }
	}

	
	
	@RequestMapping(path = "/yourBooking")
	public String yourBooking(HttpServletResponse response, HttpSession session, Model model) {
	    setNoCacheHeaders(response);

	    // Check if the user is not logged in or has the role "vendor" or "admin"
	    User loggedInUser = (User) session.getAttribute("loginuser");
	    if (loggedInUser == null || "vendor".equals(loggedInUser.getRole()) || "admin".equals(loggedInUser.getRole())) {
	        return "redirect:/home";
	    }

	    // Fetch all bookings
	    List<Booking> allBookings = bookingDao.getAllBookings();

	    // Add the list of bookings to the model
	    model.addAttribute("allBookings", allBookings);
	    
	    List<Caravan> caravanList = caravanDao.getAllCaravans();

	    // Add the caravan list to the model
	    model.addAttribute("caravanList", caravanList);

	    return "yourBooking";
	}
	
	
	@RequestMapping(path = "/vendorBookingRequest")
	public String vendorBookingRequest(HttpServletResponse response, HttpSession session, Model model) {
	    setNoCacheHeaders(response);

	    User loggedInUser = (User) session.getAttribute("loginuser");
	    if (loggedInUser == null || "admin".equals(loggedInUser.getRole())) {
	        return "redirect:/home";
	    }

	    // Fetch all bookings
	    List<Booking> allBookings = bookingDao.getAllBookings();

	    // Add the list of bookings to the model
	    model.addAttribute("allBookings", allBookings);
	    
	    List<Caravan> caravanList = caravanDao.getAllCaravans();

	    // Add the caravan list to the model
	    model.addAttribute("caravanList", caravanList);

	    return "vendorBookingRequest";
	}
	
	
	@RequestMapping(value = "/acceptRide/{id}", method = RequestMethod.POST)
	public String acceptRide(@PathVariable Long id, Model model) {
	    // Update the status to "ride accepted"
	    bookingDao.updateBookingStatus(id, "rideAccepted");

	    // Add any other necessary logic or attributes to the model

	    return "redirect:/vendorBookingRequest"; // Redirect to the booking page
	}

	@RequestMapping(value = "/cancelRide/{id}", method = RequestMethod.POST)
	public String cancelRide(@PathVariable Long id, Model model) {
	    // Update the status to "cancelled"
	    bookingDao.updateBookingStatus(id, "cancelled");

	    // Add any other necessary logic or attributes to the model

	    return "redirect:/vendorBookingRequest"; // Redirect to the booking page
	}

	@RequestMapping(value = "/endRide/{id}", method = RequestMethod.POST)
	public String endRide(@PathVariable Long id, Model model) {
	    // Update the status to "ride ended"
	    bookingDao.updateBookingStatus(id, "rideEnded");

	    // Add any other necessary logic or attributes to the model

	    return "redirect:/vendorBookingRequest"; // Redirect to the booking page
	}	

}
