package com.eshop.app.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@Entity
@Table(name = "discount")
public class Discount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false, length = 50)
    private String name;

    @Column(name = "saleOff", nullable = false)
    private Integer saleOff;

    @Column(name = "startDate", nullable = false)
    private Timestamp startDate;

    @Column(name = "endDate", nullable = false)
    private Timestamp endDate;

    @Column(name = "active", nullable = false)
    private Boolean active = false;

    @Column(name = "createDate", nullable = false)
    private Timestamp createDate;

}