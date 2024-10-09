package com.crimsonlogic.busbookingsystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.busbookingsystem.entity.Booking;
import com.crimsonlogic.busbookingsystem.entity.Schedule;
import com.crimsonlogic.busbookingsystem.repository.BookingRepository;
import com.crimsonlogic.busbookingsystem.repository.ScheduleRepository;

import java.util.Date;
import java.util.List;

@Service
public class ScheduleService {
    @Autowired
    private ScheduleRepository scheduleRepository;
    
    @Autowired
    private BookingRepository bookingRepository;

    public List<Schedule> findAll() {
        return scheduleRepository.findAll();
    }

    public Schedule findById(String id) {
        return scheduleRepository.findById(id).orElse(null);
    }

    public Schedule save(Schedule schedule) {
        return scheduleRepository.save(schedule);
    }

    public void deleteById(String id) {
        scheduleRepository.deleteById(id);
    }

	public List<Schedule> getSchedulesByBusId(String busId) {
		 return scheduleRepository.findByBusId(busId);
	}

	public List<Schedule> getByRouteSourceAndRouteDestinationAndDepartureDate(String source, String destination,
			Date journeyDate) {
		
		return scheduleRepository.findByRouteSourceAndRouteDestinationAndDepartureDate(source,destination,journeyDate);
	}

	public List<Booking> getBookingsByScheduleIdAndStatus(String scheduleId,String status) {
		return bookingRepository.findByScheduleIdAndStatus(scheduleId,status);
	}
}

