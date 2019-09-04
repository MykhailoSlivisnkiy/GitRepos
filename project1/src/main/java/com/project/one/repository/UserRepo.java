package com.project.one.repository;

import com.project.one.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepo extends JpaRepository<User, Long> {

    User findByUsername(String username);
    List<User> findByFistNameStartingWith(String name);
    User findByFistName(String firstName);

    User findByActivationCode(String code);
}
