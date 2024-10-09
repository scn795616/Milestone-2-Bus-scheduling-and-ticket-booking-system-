package com.crimsonlogic.busbookingsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.crimsonlogic.busbookingsystem.entity.Booking;
import com.crimsonlogic.busbookingsystem.entity.Schedule;
import com.crimsonlogic.busbookingsystem.entity.User;
import com.crimsonlogic.busbookingsystem.service.ScheduleService;
import com.crimsonlogic.busbookingsystem.service.UserService;

import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * 
 */
@Controller
@RequestMapping("/usercontroller")
public class UserController {
    @Autowired
    private UserService userService;
    
    @Autowired
    private ScheduleService scheduleService;

    //to fetch all the users
    @GetMapping("/users")
    public String listUsers(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        return "userList";
    }
    
    
    @GetMapping("/contact")
    public String showContact(Model model) {
        return "contact";
    }
    
//    @GetMapping("/users")
//    public List<User> listUsers() {
//        List<User> users = userService.findAll();
//        model.addAttribute("users", users);
//        return userService.findAll();
//    }

    @GetMapping("/users/{id}")
    public String getUser(@PathVariable String id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "userDetail";
    }

    //To register the user if not exist
    @PostMapping("/users")
    public String createUser(@ModelAttribute("registerForm") User registerForm,Model model) {
        registerForm.setPassword(Base64.getEncoder().encodeToString(registerForm.getPassword().getBytes()));
    	User user=userService.finByUserName(registerForm.getUsername());
        if(user!=null) {
        	model.addAttribute("error", "user already exist");
        	return "register";
        }
        userService.save(registerForm);
        model.addAttribute("message", "added successfully");
//        return "redirect:/users";
        return "home";
    }
    
    //move to the login form
    @GetMapping("/login")
    public String showLoginForm(HttpServletRequest request, Model model) {
        model.addAttribute("loginForm", new User());
        return "login";
    }
    
    @GetMapping("/register")
    public String showRegisterForm(HttpServletRequest request, Model model) {
        model.addAttribute("registerForm", new User());
        return "register";
    }
    
    //to validate the username and password
    @PostMapping("/login")
    public String login(@ModelAttribute("loginForm") User loginForm, Model model,HttpServletRequest request) {
    	
       boolean flag = userService.getUserByuserName(loginForm.getUsername(), loginForm.getPassword(),request);
        if (flag) {
            return "home";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "login";
        }
    }
    
    
    
    @GetMapping("/home")
    public String showHome(Model model,HttpServletRequest request) {
    	System.out.println(request.getSession().getAttribute("role"));
        return "home";
    }
    
    @GetMapping("/profile")   
    public String showProfile(Model model) {
        return "profile";
    }
    
    //to update the user data
    @PostMapping("/update")   
    public String updateProfile(@RequestParam("firstName") String firstName,@RequestParam("lastName") String lastName,
    		@RequestParam("email") String email,@RequestParam("mobileNumber") String number,@RequestParam("username") String username,HttpServletRequest request) {
    	
    	User user=(User)request.getSession().getAttribute("user");
    	user.setEmail(email);
    	user.setFirstName(firstName);
    	user.setLastName(lastName);
    	user.setUsername(username);
    	user.setMobileNumber(number);
    	
    	userService.save(user);
        return "profile";
    }
    
    
    
    @GetMapping("/about")   
    public String showAbout(Model model,HttpServletRequest request) {
    	System.out.println(request.getSession().getAttribute("role"));
        return "about";
    }
    
    //to search the bus from the home page
    @GetMapping("/searchBuses")
    public String showAvailabilityOfBuses(@RequestParam("destination") String destination,
            @RequestParam("date") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date journeyDate,
            Model model) {
    	
    	List<Schedule> schedules = scheduleService.getByRouteSourceAndRouteDestinationAndDepartureDate("Bangalore", destination, journeyDate);
    	Map<String, List<Booking>> bookingsMap = schedules.stream()
                .collect(Collectors.toMap(
                        Schedule::getId,
                        schedule -> scheduleService.getBookingsByScheduleIdAndStatus(schedule.getId(),"booked")
                ));
    	model.addAttribute("schedules", schedules);
    	model.addAttribute("bookingsMap", bookingsMap);
    	
		
        return "busAvailability";
    } 
    
    
    @GetMapping("/logout")
    public String showLogoutForm(HttpServletRequest request, Model model) {
    	HttpSession session = request.getSession(false);
		 if (session != null) {
		 session.invalidate();
		 }
        return "logout";
    }
    
}

