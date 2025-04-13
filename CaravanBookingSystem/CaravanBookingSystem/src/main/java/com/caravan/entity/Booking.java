package com.caravan.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@javax.persistence.Entity
@Table(name = "booking_details")
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String phone;

    @NotBlank
    private String checkIn;

    @NotBlank
    private String checkOut;

    private int caravanId;
    
    private String caravanVendor; 
    
    private String status = "pending";
    
    public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCaravanVendor() {
        return caravanVendor;
    }

    public void setCaravanVendor(String caravanVendor) {
        this.caravanVendor = caravanVendor;
    }

	@NotBlank
    private String bookingUserDetails;

	public String getBookingUserDetails() {
		return bookingUserDetails;
	}

	public void setBookingUserDetails(String bookingUserDetails) {
		 this.bookingUserDetails = bookingUserDetails;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public int getCaravanId() {
		return caravanId;
	}

	public void setCaravanId(int caravanId) {
		this.caravanId = caravanId;
	}

}