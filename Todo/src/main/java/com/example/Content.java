package com.example;

import org.hibernate.boot.registry.selector.StrategyRegistration;

import javax.persistence.*;

@Entity
public class Content {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id;
    private String title;
    @Column(length = 150)
    private String data;

    public Content( String title, String data) {
        this.title = title;
        this.data = data;
    }

    public Content() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
