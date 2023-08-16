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
@Table(name = "discount")
public class Discount {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false, length = 50)
    private String name;

    @Column(name = "saleOff", nullable = false)
    private Integer saleOff;

    @Column(name = "startDate", nullable = false)
    private Instant startDate;

    @Column(name = "endDate", nullable = false)
    private Instant endDate;

    @Column(name = "active", nullable = false)
    private Boolean active = false;

    @Column(name = "createDate", nullable = false)
    private Instant createDate;

}