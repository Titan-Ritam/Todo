<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<%@ include file="pack/js_css.jsp"%>
</head>
<body>
<%
Boolean success = (Boolean) request.getAttribute("result");
if (Objects.nonNull(success) && success) {
%>
<!-- Display your success modal here -->
<div  class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Success</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" style="color: green">
                Note Added Successfully....
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

<!-- Your JavaScript to display the modal -->
<script>
    // Your JavaScript code to show the modal
    document.getElementById("modal-button").click();
</script>
<%
    }
%>

<div class="container">
    <%@ include file="pack/navbar.jsp"%>

<form action="addnote" method="get">
    <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">Title</label>
        <input required name="title" type="text" class="form-control" id="exampleFormControlInput1" placeholder="Enter Title here...">
      </div>
      <div class="mb-3">
        <label for="exampleFormControlTextarea1" class="form-label">Content</label>
        <textarea required name="data" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
        <div class="col-auto mt-3 text-center" >
            <button type="submit" class="btn btn-primary mb-3">Add</button>
          </div>
      </div>
    </form>
    </div>



</body>
</html>
