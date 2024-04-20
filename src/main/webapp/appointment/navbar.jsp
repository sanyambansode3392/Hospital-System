<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container-fluid">
    <a class="navbar-brand" href="../Hospital_index.jsp"><i class="fas fa-clinic-medical"></i> MEDI HOME</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      
	  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        
      </ul>
      
      <div class="ml-auto d-flex">
      	<a class="nav-link text-white">APPOINTMENT</a>
      	<a class="nav-link text-white">VIEW APPOINTMENT</a>
      </div>
      <form class="d-flex">
      <div class="dropdown">
      <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
              aria-expanded="false">USER</button>
      
      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
       <li><a class="dropdown-item" href="../adminLogout">Change Password</a></li>
      <li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
      </ul>
      </div>
      </form>   
    </div>
  </div>
</nav>
