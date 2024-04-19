package com.example;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.sql.ordering.antlr.Factory;

public class Createfactory {
    public static SessionFactory factory;

    public static SessionFactory getFactory() {
        factory = new Configuration().configure().buildSessionFactory();
        return factory;
    }
}
