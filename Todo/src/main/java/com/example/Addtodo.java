package com.example;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.io.IOException;

@WebServlet("/addnote")
public class Addtodo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String data = req.getParameter("data");
        Content content = new Content(title,data);
        boolean success = false;
        Session session = Createfactory.getFactory().openSession();
        Transaction tx = session.beginTransaction();

        session.save(content);
        tx.commit();
        success = true;
        req.setAttribute("result",success);
        RequestDispatcher dispatcher= req.getRequestDispatcher("index.jsp");
        dispatcher.forward(req,resp);
        session.close();




    }
}