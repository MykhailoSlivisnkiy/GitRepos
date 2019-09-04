package com.project.one.service;

import com.project.one.domain.Role;
import com.project.one.domain.User;
import com.project.one.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    UserRepo userRepo;

    @Autowired
    private MailSender mailSender;


    public boolean addUser(User user){
        User user_beta = userRepo.findByUsername(user.getUsername());

        if(user_beta != null){
           return false;
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());

        userRepo.save(user);

        if(!StringUtils.isEmpty(user.getEmail())){
            if(!StringUtils.isEmpty(user.getEmail())){
                String message = String.format(
                        "Привіт, %s! \n" +
                                "Вітаю вас, ви майже зареєструвалися. Будь-ласка, відвідайте наступну силку link: http://localhost:8080/activate/%s",
                        user.getUsername(),
                        user.getActivationCode()
                );

                mailSender.send(user.getEmail(), "Activation code", message);
            }
        }

        return true;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }

    public void subscribe(User user1, User user) {
        user.getSubscribers().add(user1);

        userRepo.save(user);
    }

    public void addMess(User user, User receiver) {
        user.getMess().add(receiver);

        userRepo.save(user);
    }

    public boolean activateUser(String code) {
        User user = userRepo.findByActivationCode(code);

        if(user == null){
            return false;
        }

        user.setActivationCode(null);

        userRepo.save(user);

        return true;
    }

}
