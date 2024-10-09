package com.crimsonlogic.busbookingsystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.busbookingsystem.entity.Route;
import com.crimsonlogic.busbookingsystem.entity.Schedule;
import com.crimsonlogic.busbookingsystem.repository.RouteRepository;

import java.util.List;

@Service
public class RouteService {
    @Autowired
    private RouteRepository routeRepository;

    public List<Route> findAll() {
        return routeRepository.findAll();
    }

    public Route findById(String id) {
        return routeRepository.findById(id).orElse(null);
    }

    public Route save(Route route) {
        return routeRepository.save(route);
    }

    public void deleteById(String id) {
        routeRepository.deleteById(id);
    }

	public List<Route> getRouteByRouteId(String routeId) {
		return routeRepository.findRouteById(routeId);
	}


}

