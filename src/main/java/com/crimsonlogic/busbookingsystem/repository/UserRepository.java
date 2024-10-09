package com.crimsonlogic.busbookingsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crimsonlogic.busbookingsystem.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
	 User findByUsername(String username);
}

