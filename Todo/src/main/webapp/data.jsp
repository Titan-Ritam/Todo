<%@ page import="org.hibernate.sql.ordering.antlr.Factory" %>
<%@ page import="com.example.Createfactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Content" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="pack/js_css.jsp"%>
</head>
<body>
<%   Boolean delete = (Boolean) request.getAttribute("delete");
    if (Objects.nonNull(delete) && delete) {
%>
<div  class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Deleted</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" style="color: #f12323">
                Note Deleted Successfully....
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>
<button  id="modal-button" type="button" style="display: none;" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Launch
</button>

<script>
   document.getElementById("modal-button").click();
</script>


<%
    }
%>
<div class="container">
<%@include file="pack/navbar.jsp"%>
    <h1 class="text-center">All Notes</h1>

    <%

        Session session1 = Createfactory.getFactory().openSession();
        String q ="from Content";
        Query query = session1.createQuery(q);
        List<Content> results = query.list();
        for (Content content:results) {
           %>
    <div class="card mt-3" >
<%--        <img src="..." class="card-img-top" alt="...">--%>
        <div class="card-body ">
            <h5 class="card-title"><%=content.getTitle()%></h5>
            <p class="card-text"><%=content.getData()%></p>
            <a href="Deletenote?note_id=<%=content.getId()%>"  class="btn btn-danger ">Close</a>
            <a href="update.jsp?note_id=<%=content.getId()%>&title=<%=content.getTitle()%>&data=<%=content.getData()%>"  class="btn btn-primary ">update</a>
        </div>
    </div>

    <%
        }
        session1.close();
    %>
</div>

    
</body>
</html>