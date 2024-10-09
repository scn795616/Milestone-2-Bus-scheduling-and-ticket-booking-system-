package com.crimsonlogic.busbookingsystem.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.JoinColumn;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="Schedule")
public class Schedule {
    @Id
    @GeneratedValue(generator = "custom-prefix-generator")
    @GenericGenerator(name = "custom-prefix-generator",
    	strategy = "com.crimsonlogic.busbookingsystem.util.CustomPrefixIdentifierGenerator",
    	parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "SD-")
    )
    private String id;

    @ManyToOne
    @JoinColumn(name = "bus_id", foreignKey = @ForeignKey(name = "FK_BUS"))
    private Bus bus;

    @ManyToOne
    @JoinColumn(name = "route_id", foreignKey = @ForeignKey(name = "FK_ROUTE"))
    private Route route;
    
    @Column(name = "arrival_date", nullable = false)
    private Date arrivalDate;
    
    @Column(name = "departure_date", nullable = false)
    private Date departureDate;

    @Column(name = "departure_time", nullable = false)
    private Time departureTime;

    @Column(name = "arrival_time", nullable = false)
    private Time arrivalTime;

    @OneToMany(mappedBy = "schedule")
    private List<Booking> bookings;

   
}

