package com.crimsonlogic.busbookingsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crimsonlogic.busbookingsystem.entity.Booking;
import com.crimsonlogic.busbookingsystem.entity.Bus;
import com.crimsonlogic.busbookingsystem.entity.Payment;
import com.crimsonlogic.busbookingsystem.entity.Schedule;
import com.crimsonlogic.busbookingsystem.entity.Ticket;
import com.crimsonlogic.busbookingsystem.entity.User;
import com.crimsonlogic.busbookingsystem.service.BookingService;
import com.crimsonlogic.busbookingsystem.service.BusService;
import com.crimsonlogic.busbookingsystem.service.PaymentService;
import com.crimsonlogic.busbookingsystem.service.ScheduleService;
import com.crimsonlogic.busbookingsystem.service.TicketService;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/bookingcontroller")
public class BookingController {
    @Autowired
    private BookingService bookingService;
    
    @Autowired
    private ScheduleService scheduleService;
    
    @Autowired
    private PaymentService paymentService;
    
    @Autowired
    private BusService busService;
    
    @Autowired
    private TicketService ticketService;

    @GetMapping("/bookings")
    public String listBookings(Model model) {
        List<Booking> bookings = bookingService.findAll();
        model.addAttribute("bookingsList", bookings);
        return "viewBookings";
    }

    @GetMapping("/bookings/{id}")
    public String getBooking(@PathVariable String id, Model model) {
        Booking booking = bookingService.findById(id);
        model.addAttribute("booking", booking);
        return "bookingDetail";
    }

    @PostMapping("/bookings")
    public String createBooking(@RequestBody Booking booking) {
        bookingService.save(booking);
        return "redirect:/bookings";
    }
    
    @PostMapping("/submitBooking")
    public String submitBooking(@RequestParam("scheduleId") String scheduleId,@RequestParam("price") String price,@RequestParam("paymentMethod") String paymentMethod,
                                @RequestParam("passengerNames") List<String> passengerNames,
                                @RequestParam("seats") List<Integer> seats,@RequestParam("gender") List<String> gender, HttpServletRequest request,Model model) {
    	User user = (User) request.getSession().getAttribute("user"); 
    	bookingService.processBooking(scheduleId, price, paymentMethod, passengerNames, seats, user,request,gender);

         LocalDate time = LocalDate.now();
         model.addAttribute("pdate", Date.valueOf(time));
         model.addAttribute("pamount", Double.parseDouble(price));
         model.addAttribute("method", paymentMethod);
         model.addAttribute("num", scheduleService.findById(scheduleId).getBus().getBusNumber());
        
        return "paymentSuccess";
    }
    
    @GetMapping("/report") 
    public String getReport(Model model) {
        return "viewReport";
    }
    
    @GetMapping("/cancel") 
    public String cancelBooking(@RequestParam("userId") String userId,@RequestParam("ticketTime") Timestamp time, Model model) {
    	
    	bookingService.cancelBooking(userId,time);
        return "redirect: /BusBookingSystem/ticketcontroller/ticket";
    }
    
    
}

