package com.crimsonlogic.busbookingsystem.controller;

import com.crimsonlogic.busbookingsystem.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/invoicecontroller")
public class InvoiceController {

    @Autowired
    private BookingService bookingService;

    @GetMapping("/downloadInvoice")
    public ResponseEntity<FileSystemResource> downloadInvoice(@RequestParam("userId") String userId, @RequestParam("ticketTime") Timestamp ticketTime,@RequestParam("ticketId") String ticketId,HttpServletRequest request) throws IOException {
        File pdfBytes = bookingService.generateInvoicePdf(userId, ticketTime,ticketId,request);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=invoice_" + userId + "_" + ticketTime + ".pdf");

        return new ResponseEntity<>(new FileSystemResource(pdfBytes), headers, HttpStatus.OK);    
}
}
