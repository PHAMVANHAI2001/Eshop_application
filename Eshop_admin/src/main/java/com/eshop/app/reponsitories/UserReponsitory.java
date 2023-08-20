package com.eshop.app.reponsitories;

import com.eshop.app.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserReponsitory extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
