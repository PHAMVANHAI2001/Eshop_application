package com.eshop.app.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "user")
public class User {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "username", nullable = false, length = 50)
    private String username;

    @Column(name = "password", nullable = false, length = 128)
    private String password;

    @Column(name = "fullname", nullable = false, length = 128)
    private String fullname;

    @Column(name = "email", nullable = false, length = 128)
    private String email;

    @Column(name = "address")
    private String address;

    @Column(name = "phoneNumber", length = 10)
    private String phoneNumber;

    @Column(name = "avatar", length = 128)
    private String avatar;

    @Column(name = "createDate", nullable = false)
    private Instant createDate;

    @Column(name = "active", nullable = false)
    private Boolean active = false;

}