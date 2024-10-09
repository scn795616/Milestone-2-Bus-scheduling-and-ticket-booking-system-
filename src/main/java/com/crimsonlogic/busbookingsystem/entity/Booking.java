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

import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="Booking")
public class Booking {
    @Id
    @GeneratedValue(generator = "custom-prefix-generator")
    @GenericGenerator(name = "custom-prefix-generator",
    	strategy = "com.crimsonlogic.busbookingsystem.util.CustomPrefixIdentifierGenerator",
    	parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "BK-")
    )
    private String id;

    @ManyToOne
    @JoinColumn(name = "user_id", foreignKey = @ForeignKey(name = "FK_USER"))
    private User user;

    @ManyToOne
    @JoinColumn(name = "schedule_id", foreignKey = @ForeignKey(name = "FK_SCHEDULE"))
    private Schedule schedule;

    @Column(name = "passenger_name", nullable = false)
    private String passengerName;

    @Column(name = "seat_number", nullable = false)
    private int seatNumber;

    @Column(name = "booking_time", nullable = false)
    private Timestamp bookingTime;

    @OneToMany(mappedBy = "booking")
    private List<Payment> payments;
    
    @Column(name = "status", nullable = false)
    private String status="booked";
    
    @Column(name = "gender", nullable = false)
    private String gender;

    
}

