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
@Table(name="Route")
public class Route {
    @Id
    @GeneratedValue(generator = "custom-prefix-generator")
    @GenericGenerator(name = "custom-prefix-generator",
    	strategy = "com.crimsonlogic.busbookingsystem.util.CustomPrefixIdentifierGenerator",
    	parameters = @org.hibernate.annotations.Parameter(name = "prefix", value = "RT-")
    )
    private String id;

    @Column(nullable = false)
    private String source;

    @Column(nullable = false)
    private String destination;

    @Column(nullable = false)
    private int distance;

    @Column(nullable = false)
    private double price;
    
    @Column(nullable = false)
    private double duration;

    @OneToMany(mappedBy = "route")
    private List<Schedule> schedules;

   
}

