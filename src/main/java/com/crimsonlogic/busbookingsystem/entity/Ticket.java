package com.crimsonlogic.busbookingsystem.entity;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="Ticket")
public class Ticket {
    @Id
    @GeneratedValue(generator = "custom-prefix-generator")
    @GenericGenerator(name = "custom-prefix-generator",
    	strategy = "com.crimsonlogic.busbookingsystem.util.CustomPrefixIdentifierGenerator",
    	parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "IV-")
    )
    private String id;

    @ManyToOne
    @JoinColumn(name = "user_id", foreignKey = @ForeignKey(name = "FK_USER"))
    private User user;
    
    @Column(name = "total_passengerr", nullable = false)
    private int totalPassenger;
    
    @Column(name = "total_seats", nullable = false)
    private int totalSeats;
    
    @Column(name = "ticket_time", nullable = false)
    private Timestamp ticketTime;
    
    @Column(name = "status", nullable = false)
    private String status="booked";
}
