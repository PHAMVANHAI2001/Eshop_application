package com.eshop.app.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
    private Timestamp createDate;

    @Column(name = "active", nullable = false)
    private Boolean active = false;

}