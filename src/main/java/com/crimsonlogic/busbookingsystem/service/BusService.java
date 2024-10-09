package com.crimsonlogic.busbookingsystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.busbookingsystem.entity.Bus;
import com.crimsonlogic.busbookingsystem.repository.BusRepository;

import java.util.List;

@Service
public class BusService {
    @Autowired
    private BusRepository busRepository;

    public List<Bus> findAll() {
        return busRepository.findAll();
    }

    public Bus findById(String id) {
        return busRepository.findById(id).orElse(null);
    }

    public Bus save(Bus bus) {
        return busRepository.save(bus);
    }

    public void deleteById(String id) {
        busRepository.deleteById(id);
    }
}

