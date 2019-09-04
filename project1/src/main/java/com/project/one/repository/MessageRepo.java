package com.project.one.repository;

import com.project.one.domain.Message;
import com.project.one.domain.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Long> {
    List<Message> findByAuthor(User user);
}
