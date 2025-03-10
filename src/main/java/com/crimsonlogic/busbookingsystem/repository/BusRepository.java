package com.crimsonlogic.busbookingsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.busbookingsystem.entity.Bus;

@Repository
public interface BusRepository extends JpaRepository<Bus, String> {
}

