package com.crimsonlogic.busbookingsystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.busbookingsystem.entity.Payment;
import com.crimsonlogic.busbookingsystem.repository.PaymentRepository;

import java.util.Date;
import java.util.List;

@Service
public class PaymentService {
    @Autowired
    private PaymentRepository paymentRepository;

    public List<Payment> findAll() {
        return paymentRepository.findAll();
    }

    public Payment findById(String id) {
        return paymentRepository.findById(id).orElse(null);
    }

    public Payment save(Payment payment) {
        return paymentRepository.save(payment);
    }

    public void deleteById(String id) {
        paymentRepository.deleteById(id);
    }

	public List<Payment> findByPaymentDate(Date reportDate) {
		return paymentRepository.findByPaymentDate(reportDate);
	}
}

