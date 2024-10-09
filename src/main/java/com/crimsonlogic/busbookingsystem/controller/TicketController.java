package com.crimsonlogic.busbookingsystem.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.crimsonlogic.busbookingsystem.entity.Ticket;
import com.crimsonlogic.busbookingsystem.entity.User;
import com.crimsonlogic.busbookingsystem.service.TicketService;

@Controller
@RequestMapping("/ticketcontroller")
public class TicketController {

    @Autowired
    private TicketService ticketService;

    @GetMapping("/ticket")
    public String getAllTickets(Model model,HttpServletRequest request) {
    	User user=(User)request.getSession().getAttribute("user");
    	if(user==null){
    		return "redirect:/usercontroller/login";
    	}
    	List<Ticket> tickets= ticketService.getByStatusAndUserId("booked",user.getId());
    	model.addAttribute("ticketList", tickets);
        return "viewTickets";
    }

    @GetMapping("/{id}")
    public ResponseEntity<Ticket> getTicketById(@PathVariable String id) {
        Ticket ticket = ticketService.getTicketById(id);
        if (ticket != null) {
            return ResponseEntity.ok(ticket);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    public Ticket createTicket(@RequestBody Ticket ticket) {
        return ticketService.save(ticket);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Ticket> updateTicket(@PathVariable String id, @RequestBody Ticket ticket) {
        Ticket updatedTicket = ticketService.updateTicket(id, ticket);
        if (updatedTicket != null) {
            return ResponseEntity.ok(updatedTicket);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTicket(@PathVariable String id) {
        ticketService.deleteTicket(id);
        return ResponseEntity.noContent().build();
    }
}
