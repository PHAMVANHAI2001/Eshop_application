package com.eshop.app.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "productstatus")
public class Productstatus {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "statusName", nullable = false, length = 50)
    private String statusName;

}