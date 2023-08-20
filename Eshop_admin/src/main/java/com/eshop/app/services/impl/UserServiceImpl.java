package com.eshop.app.services.impl;

import com.eshop.app.entities.User;
import com.eshop.app.reponsitories.UserReponsitory;
import com.eshop.app.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserReponsitory repo;
    @Override
    public User findByUsername(String username) {
        return repo.findByUsername(username);
    }
}
