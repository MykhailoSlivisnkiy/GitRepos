package com.project.one.controller;

import com.project.one.domain.User;
import com.project.one.repository.UserRepo;
import org.hibernate.validator.constraints.pl.REGON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.jws.WebParam;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class SettingController {
    @Autowired
    UserRepo userRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/setting")
    public String settingView(@AuthenticationPrincipal User user, Model model){
        model.addAttribute("user", user);

        return "setting_page";
    }

    @PostMapping("/setting")
    public String settingS(@RequestParam String first_name,
                           @RequestParam String last_name,
                           @RequestParam String quote,
                           @RequestParam String city,
                           @RequestParam String data,
                           @RequestParam String info,
                           @AuthenticationPrincipal User user,
                           @RequestParam("file") MultipartFile file,
                           Model model) throws IOException {

        user.setAll(first_name, last_name, quote, city, data, info);

        userRepo.save(user);

        model.addAttribute("user", user);
        model.addAttribute("user1", user);

        saveFileTwo(file, user);

        userRepo.save(user);

        return "user_page";
    }


    public void saveFileTwo(MultipartFile file, User user) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            user.setFilename(resultFilename);
        }
    }
}
