package com.crimsonlogic.busbookingsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crimsonlogic.busbookingsystem.entity.Payment;
import com.crimsonlogic.busbookingsystem.service.PaymentService;

import java.util.List;

@Controller
@RequestMapping("/paymentcontroller")
public class PaymentController {
    @Autowired
    private PaymentService paymentService;

    @GetMapping("/payments")
    public String listPayments(Model model) {
        List<Payment> payments = paymentService.findAll();
        model.addAttribute("payments", payments);
        return "paymentList";
    }

    @GetMapping("/payments/{id}")
    public String getPayment(@PathVariable String id, Model model) {
        Payment payment = paymentService.findById(id);
        model.addAttribute("payment", payment);
        return "paymentDetail";
    }

    @PostMapping("/payments")
    public String createPayment(@RequestBody Payment payment) {
        paymentService.save(payment);
        return "redirect:/payments";
    }
}

