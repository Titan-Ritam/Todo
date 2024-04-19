package com.example;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
@WebServlet("/Deletenote")
public class Deletenote extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            int noteID = Integer.parseInt(req.getParameter("note_id"));
            Session session = Createfactory.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            Boolean delete = false;
            Content content = session.get(Content.class,noteID);
            session.delete(content);
            tx.commit();
            session.close();
            delete = true;
            req.setAttribute("delete",delete);
            RequestDispatcher disp =  req.getRequestDispatcher("data.jsp");
            disp.forward(req,resp);

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
