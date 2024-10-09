package com.crimsonlogic.busbookingsystem.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.busbookingsystem.entity.Schedule;

@Repository
public interface ScheduleRepository extends JpaRepository<Schedule, String> {

	List<Schedule> findByBusId(String busId);

	List<Schedule> findByRouteSourceAndRouteDestinationAndDepartureDate(String source, String destination,
			Date departureDate);
}
