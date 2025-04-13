package com.caravan.Dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.caravan.entity.Booking;

import java.util.List;

@Repository
@Transactional
public class BookingDaoImpl implements BookingDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public Long saveBooking(Booking booking) {
        return (Long) hibernateTemplate.save(booking);
    }

    @Override
    public Booking getBookingById(Long id) {
        return hibernateTemplate.get(Booking.class, id);
    }

    @Override
    public List<Booking> getAllBookings() {
        String hql = "FROM Booking";
        return (List<Booking>) hibernateTemplate.find(hql);
    }

    @Transactional
    @Override
    public void updateBooking(Booking booking) {
        hibernateTemplate.update(booking);
    }

    @Override
    public void deleteBooking(Long id) {
        Booking booking = hibernateTemplate.load(Booking.class, id);
        if (booking != null) {
            hibernateTemplate.delete(booking);
        }
    }
    
    @Transactional
    @Override
    public void updateBookingStatus(Long id, String status) {
        try {
            Booking booking = hibernateTemplate.get(Booking.class, id);
            if (booking != null) {
                switch (status) {
                    case "rideAccepted":
                        booking.setStatus("ride accepted");
                        break;
                    case "cancelled":
                        booking.setStatus("cancelled");
                        break;
                    case "rideEnded":
                        booking.setStatus("ride ended");
                        break;
                    default:
                        System.out.println("Invalid status value: " + status);
                        break;
                }
                hibernateTemplate.update(booking);
            } else {
                System.out.println("Booking not found for id: " + id);
            }
        } catch (Exception e) {
            System.out.println("Error updating status: " + e.getMessage());
            e.printStackTrace();
        }
    }

    
}