package com.crimsonlogic.busbookingsystem.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.busbookingsystem.entity.Payment;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, String> {

	List<Payment> findByPaymentDate(Date reportDate);
}

