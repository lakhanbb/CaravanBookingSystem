package com.caravan.Dao;

import java.util.List;

import com.caravan.entity.Booking;

public interface BookingDao {
    Long saveBooking(Booking booking);

    Booking getBookingById(Long id);

    List<Booking> getAllBookings();

    void updateBooking(Booking booking);

    void deleteBooking(Long id);
    
    void updateBookingStatus(Long id, String status);
}
