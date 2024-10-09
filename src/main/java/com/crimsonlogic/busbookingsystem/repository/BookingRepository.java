package com.crimsonlogic.busbookingsystem.repository;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.busbookingsystem.entity.Booking;

@Repository
public interface BookingRepository extends JpaRepository<Booking, String> {

	List<Booking> findByScheduleIdAndStatus(String scheduleId,String status);

	List<Booking> findByBookingTimeAndUserId(Timestamp bookingTime, String userId);
}

