package com.crimsonlogic.busbookingsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crimsonlogic.busbookingsystem.entity.Booking;
import com.crimsonlogic.busbookingsystem.entity.Payment;
import com.crimsonlogic.busbookingsystem.entity.Route;
import com.crimsonlogic.busbookingsystem.entity.Schedule;
import com.crimsonlogic.busbookingsystem.service.BookingService;
import com.crimsonlogic.busbookingsystem.service.BusService;
import com.crimsonlogic.busbookingsystem.service.PaymentService;
import com.crimsonlogic.busbookingsystem.service.RouteService;
import com.crimsonlogic.busbookingsystem.service.ScheduleService;
import com.fasterxml.jackson.databind.deser.std.DateDeserializers.SqlDateDeserializer;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/schedulecontroller")
public class ScheduleController {
    @Autowired
    private ScheduleService scheduleService;
    
    @Autowired
    private RouteService routeService;
    
    @Autowired
    private BusService busService;
    
    @Autowired
    private PaymentService paymentService;
    
    @Autowired
    private BookingService bookingService;

    //to list all the schedules for the admin
    @GetMapping("/schedules")
    public String listSchedules(Model model) {
        List<Schedule> schedules = scheduleService.findAll();
        model.addAttribute("scheduleList", schedules);
        return "viewSchedule";
    }

    @GetMapping("/schedules/{id}")
    public String getSchedule(@PathVariable String id, Model model) {
        Schedule schedule = scheduleService.findById(id);
        model.addAttribute("schedule", schedule);
        return "scheduleDetail";
    }
     
    //to list the schedule by bus for the admin
    @GetMapping("/schedulebybus")
    public String getSchedulesByBusId(@RequestParam("busId") String busId, Model model) {
        List<Schedule> schedules = scheduleService.getSchedulesByBusId(busId);
        model.addAttribute("scheduleList", schedules);
        return "viewSchedule"; // This should be the name of your view to display the schedules
    }

    @PostMapping("/schedules")
    public String createSchedule(@ModelAttribute("addingSchedule") Schedule schedule) {
    	
    	scheduleService.save(schedule);
        return "redirect:/schedulecontroller/schedules";
    } 
    
    @GetMapping("/addschedule")
    public String addScheduleForm(Model model) {
        model.addAttribute("addingSchedule", new Route());
        model.addAttribute("buses", busService.findAll());
        model.addAttribute("routes", routeService.findAll());
        return "addSchedule";
    }
    
    //list the schedule of the bus for the user based on the date,source and destination
    @GetMapping("/availability")
    public String showAvailability(@RequestParam("source") String source,
            @RequestParam("destination") String destination,
            @RequestParam("journeyDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date journeyDate,
            Model model) {
    	
    	List<Schedule> schedules = scheduleService.getByRouteSourceAndRouteDestinationAndDepartureDate(source, destination, journeyDate);
    	Map<String, List<Booking>> bookingsMap = schedules.stream()
                .collect(Collectors.toMap(
                        Schedule::getId,
                        schedule -> scheduleService.getBookingsByScheduleIdAndStatus(schedule.getId(),"booked")
                ));
    	model.addAttribute("schedules", schedules);
    	model.addAttribute("bookingsMap", bookingsMap);
    	
		
        return "busAvailability";
    }   
    
    
    //to move to the booking form
    @PostMapping("/book")
    public String bookSeats(@RequestParam("price") String price, @RequestParam("scheduleId") String scheduleId,
                            @RequestParam("selectedSeats") String selectedSeats,
                            Model model) {
        model.addAttribute("scheduleId", scheduleId);
        model.addAttribute("price", price);
        model.addAttribute("selectedSeats", selectedSeats);
        return "bookingForm";
    }
    
    
    @GetMapping("/update")
    public String updateScheduleForm(@RequestParam("id") String schdeuleId, Model model) {
    	Schedule schedule=scheduleService.findById(schdeuleId);
    	model.addAttribute("id", schdeuleId);
    	model.addAttribute("arrivalTime", schedule.getArrivalTime());
    	model.addAttribute("departureTime", schedule.getDepartureTime());
    	model.addAttribute("arrivalDate", schedule.getArrivalDate());
    	model.addAttribute("departureDate", schedule.getDepartureDate());
    	model.addAttribute("routeId", schedule.getRoute().getId());
    	model.addAttribute("busId", schedule.getBus().getId());
        return "updateSchedule";
    }
    
   @PostMapping("/update")
    public String updateSchedule(@RequestParam("id") String id,@RequestParam("busId") String busId, @RequestParam("routeId") String routeId,
    		@RequestParam("arrivalTime") Time arrivalTime,@RequestParam("departureTime") Time departureTime,@RequestParam("arrivalDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date arrivalDate,@RequestParam("departureDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date departureDate,Model model) {
    	List<Schedule> schedule=scheduleService.getSchedulesByBusId(busId);
    	for(Schedule schd:schedule) {
    		schd.setArrivalTime(arrivalTime);
    		schd.setArrivalDate(new java.sql.Date(arrivalDate.getTime()));
    		schd.setDepartureDate(new java.sql.Date(departureDate.getTime()));
    		schd.setDepartureTime(departureTime);
        	
        	scheduleService.save(schd);
    	}
    	
    	
        return "redirect:/schedulecontroller/schedules";
    }
    
//    @PostMapping("/updateSchedule")
//    public String updateSchedule(@ModelAttribute("schedule") Schedule schedule) {
//        scheduleService.save(schedule);
//        return "redirect:/schedulecontroller/schedules";
//    }
    
    @PostMapping("/updateSchedule")
    public String updateSchedule(@RequestParam("id") String id, @ModelAttribute("updatingSchedule") Schedule schedule) {
        Schedule existingSchedule = scheduleService.findById(id);
        	System.out.println(id);
            existingSchedule.setBus(schedule.getBus());
            existingSchedule.setRoute(schedule.getRoute());
            existingSchedule.setArrivalDate(schedule.getArrivalDate());
            existingSchedule.setDepartureDate(schedule.getDepartureDate());
            existingSchedule.setArrivalTime(schedule.getArrivalTime());
            existingSchedule.setDepartureTime(schedule.getDepartureTime());
            scheduleService.save(existingSchedule);
        
        return "redirect:/schedulecontroller/schedules";
    }
    
    @GetMapping("/generate")
    public String generateReport(@RequestParam("reportDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date reportDate, Model model) {
        List<Payment> schedules = paymentService.findByPaymentDate(reportDate);
        model.addAttribute("schedules", schedules);
        model.addAttribute("reportDate", reportDate);
        return "reportResult";
    }
 

}

