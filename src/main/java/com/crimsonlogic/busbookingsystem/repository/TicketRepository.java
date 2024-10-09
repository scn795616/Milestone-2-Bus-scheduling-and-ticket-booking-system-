package com.crimsonlogic.busbookingsystem.repository;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.crimsonlogic.busbookingsystem.entity.Ticket;

@Repository
public interface TicketRepository extends JpaRepository<Ticket, String> {

	List<Ticket> getByStatusAndUserId(String status, String userId);

	Ticket findByTicketTimeAndUserId(Timestamp time, String userId);
}
