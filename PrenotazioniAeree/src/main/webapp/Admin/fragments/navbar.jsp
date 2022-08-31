<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#white{
	color: #ffffff;
}

.navbar-brand {
	font-size: 24px;
	color: white;
}
</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="<c:url value='/Admin/home.jsp'/>">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a id="white" class="nav-link" href="<c:url value='/viewVoliAdmin'/>">Lista Voli</a>
        </li>
        <li class="nav-item">
          <a id="white" class="nav-link" href="<c:url value='/viewCompagnieAereoportiAdmin'/>">Lista Aereoporti - Compagnie</a>
        </li>
      </ul>
      <div class="d-flex">
      	<a id="white" class="nav-link ps-0" href="<c:url value='/logout'/>">Logout</a>
      </div>
    </div>
  </div>
</nav>