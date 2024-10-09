package com.crimsonlogic.busbookingsystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crimsonlogic.busbookingsystem.entity.User;
import com.crimsonlogic.busbookingsystem.repository.UserRepository;

import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public User findById(String id) {
        return userRepository.findById(id).orElse(null);
    }

    public User save(User user) {
        return userRepository.save(user);
    }

    public void deleteById(String id) {
        userRepository.deleteById(id);
    }
    
    public boolean getUserByuserName(String username, String password,HttpServletRequest request) {
        User user = userRepository.findByUsername(username);
        password=Base64.getEncoder().encodeToString(password.getBytes());

        boolean flag;
        if (user != null && user.getPassword().equals(password)) {
        	request.getSession().setAttribute("user", user);
        	request.getSession().setAttribute("role", user.getRole());
        	System.out.println(user.getRole());
            flag=true;
        } else {
            flag=false;
        }
        return flag;
    }

	public User finByUserName(String username) {
		// TODO Auto-generated method stub
		return userRepository.findByUsername(username);
	}
}

