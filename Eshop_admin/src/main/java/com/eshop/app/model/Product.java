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
@Table(name = "product")
public class Product {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "slug", nullable = false)
    private String slug;

    @Lob
    @Column(name = "thumbnail", nullable = false)
    private String thumbnail;

    @Lob
    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    @Column(name = "unitPrice", nullable = false)
    private Double unitPrice;

    @Column(name = "createDate", nullable = false)
    private Instant createDate;

    @Column(name = "available", nullable = false)
    private Integer available;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "categoryId", nullable = false)
    private Category category;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "discountId")
    private Discount discount;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "productStatusId", nullable = false)
    private Productstatus productStatus;

}