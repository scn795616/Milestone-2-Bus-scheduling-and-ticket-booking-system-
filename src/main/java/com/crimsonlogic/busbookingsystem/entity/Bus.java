package com.crimsonlogic.busbookingsystem.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="Bus")
public class Bus {
    @Id
    @GeneratedValue(generator = "custom-prefix-generator")
    @GenericGenerator(name = "custom-prefix-generator",
    	strategy = "com.crimsonlogic.busbookingsystem.util.CustomPrefixIdentifierGenerator",
    	parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "BUS-")
    )
    private String id;

    @Column(name = "bus_number", unique = true, nullable = false)
    private String busNumber;

    @Column(nullable = false)
    private int capacity;

    @Column(nullable = false)
    private String type;
    
    @Column(nullable = false)
    private int seat_available;

    @OneToMany(mappedBy = "bus")
    private List<Schedule> schedules;

    
}

