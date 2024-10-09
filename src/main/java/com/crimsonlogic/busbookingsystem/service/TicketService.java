package com.crimsonlogic.busbookingsystem.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.crimsonlogic.busbookingsystem.entity.Ticket;
import com.crimsonlogic.busbookingsystem.repository.TicketRepository;
import com.crimsonlogic.busbookingsystem.service.TicketService;

@Service
public class TicketService {

    @Autowired
    private TicketRepository ticketRepository;

    
    public List<Ticket> getAllTickets() {
        return ticketRepository.findAll();
    }

    
    public Ticket getTicketById(String id) {
        Optional<Ticket> ticket = ticketRepository.findById(id);
        return ticket.orElse(null);
    }

    public Ticket save(Ticket ticket) {
        return ticketRepository.save(ticket);
    }

    
    public Ticket updateTicket(String id, Ticket ticket) {
        if (ticketRepository.existsById(id)) {
            ticket.setId(id);
            return ticketRepository.save(ticket);
        }
        return null;
    }

    public void deleteTicket(String id) {
        ticketRepository.deleteById(id);
    }


	public List<Ticket> getByStatusAndUserId(String status, String userId) {
		// TODO Auto-generated method stub
		return ticketRepository.getByStatusAndUserId(status,userId);
	}
}
