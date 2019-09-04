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
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private NoteRepo noteRepo;

    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private UserService userService;


    User receivered;

    @GetMapping("/message/{receiver}")
    public String message(Model model,
                          @AuthenticationPrincipal User user,
                          @PathVariable User receiver){
        model.addAttribute("user", user);

        receivered = receiver;

        List<Note> notes = noteRepo.findByAuthorAndReceiver(user, receiver);

        List<Note> notes2 = noteRepo.findByAuthorAndReceiver(receivered, user);

        List<Note> newNote = Stream.concat(notes.stream(), notes2.stream())
                .collect(Collectors.toList());


        if(newNote.size() == 0){
            userService.addMess(user, receiver);
        }

        model.addAttribute("receivers", newNote);


        return "message_page";
    }

    @GetMapping("{user}")
    public String friends(Model model,
                          @PathVariable User user,
                          @AuthenticationPrincipal User user1){
        Iterable<Message> messages = messageRepo.findByAuthor(user);

        model.addAttribute("user", user);
        model.addAttribute("messages", messages);
        model.addAttribute("user1", user1);

        return "user_page";
    }


    @PostMapping("/message/formMessage")
    public String messageView(Model model,
                              @AuthenticationPrincipal User user,
                              @RequestParam String text){



        model.addAttribute("user", user);

        Note note = new Note(text, user, receivered);

        noteRepo.save(note);

        List<Note> notes = noteRepo.findByAuthorAndReceiver(user, receivered);

        List<Note> notes2 = noteRepo.findByAuthorAndReceiver(receivered, user);

        List<Note> newNote = Stream.concat(notes.stream(), notes2.stream())
                .collect(Collectors.toList());


        model.addAttribute("receivers", newNote);

        return "message_page";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if(isActivated){
            model.addAttribute("Enter", "User successfully activated");
        }else {
            model.addAttribute("Enter", "Activation code is not found");
        }

        return "login";
    }
}



