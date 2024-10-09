package com.crimsonlogic.busbookingsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crimsonlogic.busbookingsystem.entity.Bus;
import com.crimsonlogic.busbookingsystem.entity.Route;
import com.crimsonlogic.busbookingsystem.entity.Schedule;
import com.crimsonlogic.busbookingsystem.service.BusService;
import com.crimsonlogic.busbookingsystem.service.RouteService;
import com.crimsonlogic.busbookingsystem.service.ScheduleService;

import java.util.List;

@Controller
@RequestMapping("/routecontroller")
public class RouteController {
    @Autowired
    private RouteService routeService;
    
    @Autowired
    private BusService busService;
    
    @Autowired
    private ScheduleService scheduleService;

    @GetMapping("/routes")
    public String listRoutes(Model model) {
        List<Route> routes = routeService.findAll();
        model.addAttribute("routeList", routes);
        return "viewRoute";
    }

    @GetMapping("/routes/{id}")
    public String getRoute(@PathVariable String id, Model model) {
        Route route = routeService.findById(id);
        model.addAttribute("routeList", route);
        return "viewRoute";
    }
    
    @GetMapping("/routebybus")
    public String getSchedulesByBusId(@RequestParam("routeId") String routeId, Model model) {
        List<Route> routes = routeService.getRouteByRouteId(routeId);
        model.addAttribute("routeList", routes);
        return "viewRoute"; // This should be the name of your view to display the schedules
    }


    @PostMapping("/routes")
    public String createRoute(@ModelAttribute("addingRoute") Route route) {
        routeService.save(route);
        return "redirect:/routecontroller/routes";
    }
    
    @GetMapping("/addroute")
    public String addRouteForm(Model model) {
        model.addAttribute("addingRoute", new Route());
        return "addRoute";
    }
    
    @GetMapping("/update")
    public String updateRouteForm(@RequestParam("id") String routeId, Model model) {
    	Route route=routeService.findById(routeId);
    	model.addAttribute("id", routeId);
    	model.addAttribute("source", route.getSource());
    	model.addAttribute("destination", route.getDestination());
    	model.addAttribute("distance", route.getDistance());
    	model.addAttribute("price", route.getPrice());
    	model.addAttribute("duration", route.getDuration());
        return "updateRoute";
    }
    
    @PostMapping("/update")
    public String updateRoute(@RequestParam("id") String routeId, @RequestParam("source") String source,
    		@RequestParam("distance") String distance,@RequestParam("destination") String destination,@RequestParam("price") String price,@RequestParam("duration") String duration,Model model) {
    	Route route=routeService.findById(routeId);
    	route.setDestination(destination);
    	route.setDistance(Integer.parseInt(distance));
    	route.setSource(source);
    	route.setPrice(Double.parseDouble(price));
    	route.setDuration(Double.parseDouble(duration));
    	
    	routeService.save(route);
    	
        return "redirect:/routecontroller/routes";
    }
}

