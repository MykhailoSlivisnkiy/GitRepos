package com.project.one.controller;

import com.project.one.domain.Message;
import com.project.one.domain.Note;
import com.project.one.domain.User;
import com.project.one.repository.MessageRepo;
import com.project.one.repository.NoteRepo;
import com.project.one.repository.UserRepo;
import com.project.one.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Set;

@Controller
public class FriendsController {
    @Autowired
    UserRepo userRepo;

    @Autowired
    NoteRepo noteRepo;

    @Autowired
    MessageRepo messageRepo;

    @Autowired
    UserService userService;

    @GetMapping("/friends")
    public String friendsView(@AuthenticationPrincipal User user,
                              Model model){
        Set<User> users = user.getSubscriptions();

        model.addAttribute("users", users);
        model.addAttribute("user", user);

        return "friends_page";
    }

    @GetMapping("/user/friends/{user}")
    public String friends_add(Model model,
                              @PathVariable User user,
                              @AuthenticationPrincipal User user1){
        Iterable<Message> messages = messageRepo.findByAuthor(user);

        userService.subscribe(user1, user);

        model.addAttribute("user", user);
        model.addAttribute("messages", messages);
        model.addAttribute("user1", user1);

        return "user_page";
    }





}
