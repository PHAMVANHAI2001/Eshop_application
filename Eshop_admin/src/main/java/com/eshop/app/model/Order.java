package com.eshop.app.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "`order`")
public class Order {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "orderCode", nullable = false, length = 11)
    private String orderCode;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "userId", nullable = false)
    private User user;

    @Column(name = "createDate", nullable = false)
    private Instant createDate;

    @Column(name = "status", nullable = false)
    private Integer status;

    @Column(name = "fullname", nullable = false, length = 128)
    private String fullname;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(name = "email", nullable = false, length = 128)
    private String email;

    @Column(name = "phoneNumber", nullable = false, length = 10)
    private String phoneNumber;

    @Column(name = "totalUnitPrice", nullable = false)
    private Double totalUnitPrice;

}