package com.project.one.controller;

import com.project.one.domain.User;
import com.project.one.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class Aditional {
    @Autowired
    private UserRepo userRepo;

    @RequestMapping(value = "/findAutoComplete")
    @ResponseBody
    public List<String> findAutoComplete(@RequestParam(value = "term", required = false, defaultValue = "") String term) {
        List<String> response = new ArrayList<String>();

        List<User> users = userRepo.findByFistNameStartingWith(term);


        for (int i = 0; i < users.size(); i++) {
            System.out.println(1);
            response.add(users.get(i).getFistName());
            System.out.println(users.get(i).getFistName());
        }

        return response;
    }



    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView getPages() {

        ModelAndView model = new ModelAndView("example");
        return model;

    }


}
