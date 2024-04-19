package com.example;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.io.IOException;
@WebServlet("/updatenote")
public class Updatenote extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            int noteId = Integer.parseInt(req.getParameter("note_id"));
            String title = req.getParameter("title");
            String data = req.getParameter("data");
            Session session = Createfactory.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            Query query = session.createQuery("update Content set title = :title ,data = :data where id = :noteId");
            query.setParameter("title",title);
            query.setParameter("data",data);
            query.setParameter("noteId",noteId);
            query.executeUpdate();
            tx.commit();
            session.close();
            resp.sendRedirect("data.jsp");

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
