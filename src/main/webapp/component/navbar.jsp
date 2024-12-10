<%@page import="com.entity.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#"><i class="fa-sharp fa-solid fa-phone"></i> PhoneBook</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"> <i class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="addContact.jsp"><i class="fa-solid fa-address-book"></i> AddContact</a>
      </li>
     
      <li class="nav-item active">
        <a class="nav-link" href="viewContact.jsp"><i class="fa-sharp-duotone fa-regular fa-eye"></i> View Contact</a>
      </li>
    </ul>
    
    <% User user=(User)session.getAttribute("user");
    if(user==null){
    %>
    <form class="form-inline my-2 my-lg-0">
     <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-user"></i> Login</a>
     <a href="register.jsp" class="btn btn-danger ml-2"><i class="fa-regular fa-user"></i> Register</a>
    </form>
    <%
    }else{
    %>
    
     <form class="form-inline my-2 my-lg-0">
     <button class="btn btn-success"><%= user.getName() %></button>
     <a data-toggle="modal" data-target="#exampleModalCenter"  class="btn btn-danger ml-2 text-white">Logout</a>
    </form>
    
    <%} %>
    <!-- Logout Section -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Logout</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
       <h6> Do You Want Logout...</h6>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        <a href="logout" type="button" class="btn btn-success">OK</a>
      </div>
    </div>
  </div>
</div>
    <!-- End Section -->
  </div>
</nav>



