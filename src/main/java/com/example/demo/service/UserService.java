package com.example.demo.service;

import com.example.demo.entity.User;
import com.example.demo.exception.ResourceNotFoundException;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {
    private final UserRepository repository;

    @Autowired
    public UserService(UserRepository repository) {
        this.repository = repository;
    }

    public User findUser(int id) throws ResourceNotFoundException {
        Optional<User> optionalUser = repository.findById(id);
        if (!optionalUser.isPresent())
            throw new ResourceNotFoundException("User not found");
        System.out.println("Hello Bac");
        return optionalUser.get();
    }

    public void deleteUser(int id) {
        repository.deleteById(id);
    }

}
