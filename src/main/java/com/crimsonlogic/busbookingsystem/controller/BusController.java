package com.crimsonlogic.busbookingsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crimsonlogic.busbookingsystem.entity.Bus;
import com.crimsonlogic.busbookingsystem.entity.User;
import com.crimsonlogic.busbookingsystem.service.BusService;
import com.crimsonlogic.busbookingsystem.service.RouteService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/buscontroller")
public class BusController {
    @Autowired
    private BusService busService;
    
    @Autowired
    private RouteService routeService;

    @GetMapping("/buses")
    public String listBuses(Model model) {
        List<Bus> buses = busService.findAll();
        model.addAttribute("busList", buses);
        return "viewBus";
    }

    @GetMapping("/buses/{id}")
    public String getBus(@PathVariable String id, Model model) {
        Bus bus = busService.findById(id);
        model.addAttribute("bus", bus);
        return "busDetail";
    }

    @PostMapping("/buses")
    public String createBus(@ModelAttribute("addingBus") Bus bus,HttpServletRequest request) {
        busService.save(bus);
        request.getSession().setAttribute("bus", bus);
        return "redirect:/buscontroller/buses";
    }
    
    @GetMapping("/addbus")
    public String addBusForm(Model model) {
        model.addAttribute("addingBus", new Bus());
        return "addBus";
    }
    
    @GetMapping("/searchbuses")
    public String searchBus(Model model) {
    	 model.addAttribute("routes", routeService.findAll());
        model.addAttribute("bus", new Bus());
        return "searchBus";
    }
    
    @GetMapping("/update")
    public String updateBusForm(@RequestParam("busId") String busId, Model model) {
    	Bus bus=busService.findById(busId);
    	model.addAttribute("id", busId);
    	model.addAttribute("busNumber", bus.getBusNumber());
    	model.addAttribute("capacity", bus.getCapacity());
    	model.addAttribute("type", bus.getType());
    	model.addAttribute("seat", bus.getSeat_available());
    	
        return "updateBus";
    }
    
    @PostMapping("/update")
    public String updateBus(@RequestParam("id") String busId,@RequestParam("type") String type, Model model) {
    	Bus bus=busService.findById(busId);
    	bus.setType(type);
    	
    	busService.save(bus);
    	
        return "redirect:/buscontroller/buses";
    }
}

