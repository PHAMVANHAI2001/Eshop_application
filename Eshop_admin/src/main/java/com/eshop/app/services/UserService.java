package com.eshop.app.services;

import com.eshop.app.entities.User;

public interface UserService {
    User findByUsername(String username);
}
