package com.crimsonlogic.busbookingsystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.busbookingsystem.entity.Route;
import com.crimsonlogic.busbookingsystem.entity.Schedule;

@Repository
public interface RouteRepository extends JpaRepository<Route, String> {

	List<Route> findRouteById(String routeId);

}

