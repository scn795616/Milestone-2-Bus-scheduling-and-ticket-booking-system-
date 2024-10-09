package com.crimsonlogic.busbookingsystem.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.JoinColumn;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="Payment")
public class Payment {
    @Id
    @GeneratedValue(generator = "custom-prefix-generator")
    @GenericGenerator(name = "custom-prefix-generator",
    	strategy = "com.crimsonlogic.busbookingsystem.util.CustomPrefixIdentifierGenerator",
    	parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "TX-")
    )
    private String id;

    @ManyToOne
    @JoinColumn(name = "booking_id", foreignKey = @ForeignKey(name = "FK_BOOKING"))
    private Booking booking;

    @Column(nullable = false)
    private double amount;

    @Column(name = "payment_date", nullable = false)
    private Date paymentDate;

    @Column(name = "payment_method", nullable = false)
    private String paymentMethod;

    @Column(nullable = false)
    private String status="Complete";

    
}

