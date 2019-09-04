package com.project.one.repository;

import com.project.one.domain.Note;
import com.project.one.domain.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Set;

public interface NoteRepo extends CrudRepository<Note, Long> {
    List<Note> findByAuthorOrReceiver(User author, User receiver);
    List<Note> findByReceiver(User user);
    Set<Note> findByAuthor(User user);
    List<Note> findByAuthorAndReceiver(User author, User receiver);
}
