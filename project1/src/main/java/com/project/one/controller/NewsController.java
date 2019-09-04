package com.project.one.controller;

import com.project.one.domain.Message;
import com.project.one.domain.User;
import com.project.one.repository.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
public class NewsController {
    @Autowired
    private MessageRepo messageRepo;

    @GetMapping("/news")
    public String newsView(@AuthenticationPrincipal User user, Model model){
        Iterable<Message> messages = messageRepo.findAll();

        List<Message> newMessages = new ArrayList<>();

        for(Message o : messages){
            newMessages.add(o);
        }

        List<Message> newNewMessage = new ArrayList<>();

        for (int i = newMessages.size()-1; i > 0; i--){
            newNewMessage.add(newMessages.get(i));
        }

        model.addAttribute("user", user);
        model.addAttribute("messages", newNewMessage);

        return "news_page";
    }



}


