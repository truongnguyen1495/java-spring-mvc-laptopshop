package com.nhattruong.laptopshop.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

import jakarta.persistence.Table;

@Entity
@Table(name = "order_details")
public class OrderDetail { // chi tiet don hang
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private int quantity;// so luong mua
    private double price; // gia ban tai thoi diem mua

    // order_id long
    // orderdetail - many to one - order
    @ManyToOne
    @JoinColumn(name = "order_id") // foreign key column in order_details table
    private Order order;

    // product_id long
    // orderdetail - many to one - product
    @ManyToOne
    @JoinColumn(name = "product_id") // foreign key column in order_details table
    private Product product;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
