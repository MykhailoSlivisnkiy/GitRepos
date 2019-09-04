package com.project.one.controller;


import com.project.one.domain.Message;
import com.project.one.domain.User;
import com.project.one.repository.MessageRepo;
import com.project.one.repository.NoteRepo;
import com.project.one.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
public class MainController {
    @Autowired
    UserRepo userRepo;

    @Autowired
    private NoteRepo noteRepo;

    @Autowired
    private MessageRepo messageRepo;

    @Value("${upload.path}")
    private String uploadPath;



    @GetMapping("/user")
    public String userControl(@AuthenticationPrincipal User user, Model model){
        Iterable<Message> messages = messageRepo.findByAuthor(user);

        model.addAttribute("user", user);
        model.addAttribute("messages", messages);
        model.addAttribute("user1", user);

        return "user_page";
    }

    @PostMapping("/formPost")
    public String post(@RequestParam String text,
                       @AuthenticationPrincipal User user,
                       @RequestParam("file") MultipartFile file) throws IOException {
        Message message = new Message(text, user);

        saveFile(file, message);

        messageRepo.save(message);

        return "redirect:/user";
    }

    @GetMapping("/green")
    public String mainView11(Map<String, Object> model){

        return "green";
    }

    @GetMapping("/find")
    public String findFriends(Model model,
                              @AuthenticationPrincipal User user1,
                              @RequestParam String finder){
        Iterable<Message> messages = messageRepo.findByAuthor(user1);
        User user = userRepo.findByFistName(finder);

        model.addAttribute("user", user);
        model.addAttribute("messages", messages);
        model.addAttribute("user1", user1);
        return "user_page";
    }


    @GetMapping("/main")
    public String mainView(Map<String, Object> model){
        Iterable<User> users = userRepo.findAll();

        model.put("users", users);

        return "main";
    }

    @GetMapping("/messages")
    public String messageView(Model model,
                              @AuthenticationPrincipal User user){
        Set<User> notes = user.getMess();
        Set<User> notes2 = user.getMess_receiver();

        Set<User> newUser = Stream.concat(notes.stream(), notes2.stream())
                .collect(Collectors.toSet());


        System.out.println(user.getMess());

        model.addAttribute("user", user);
        model.addAttribute("messages", newUser);

        return "messages_page";
    }

    public void saveFile(MultipartFile file, Message message) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            message.setFilename(resultFilename);
        }
    }
}





//@AuthenticiationPrincipal (User user) - полуть того юзера який увійшов в систему