<%@ page import="org.hibernate.Session" %>
<%@ page import="com.example.Createfactory" %><%--
  Created by IntelliJ IDEA.
  User: Ritam
  Date: 22-12-2023
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="pack/js_css.jsp"%>
    <title>Title</title>
</head>
<body>
<%
    int noteId = Integer.parseInt(request.getParameter("note_id"));
    String title = request.getParameter("title");
    String data = request.getParameter("data");
%>

<div class="container">
    <%@ include file="pack/navbar.jsp"%>
    <h1 class="text-center">Update</h1>
    <form action="updatenote" method="get">
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Title</label>
            <input required name="title" type="text" class="form-control" id="exampleFormControlInput1" value=<%=title%> >
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Content</label>
            <textarea required  name="data" class="form-control" id="exampleFormControlTextarea1" rows="3" ><%=data%></textarea>
            <div class="col-auto mt-3 text-center" >
                <button type="submit" class="btn btn-primary mb-3">Update</button>
            </div>
            <input name="note_id" style="display: none" value=<%=noteId%>  >
        </div>
    </form>
</div>

</body>
</html>
