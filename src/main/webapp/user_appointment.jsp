<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("data:image/jpeg;base64,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");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJn7h4zNSvU73nq2u3vbJ3HP_MmSjyygJdGA&usqp=CAU" width="450px" height="500px">
			</div>

			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form class="row g-3" action="appAppointment" method="post">

							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									required type="text" class="form-control" name="fullname">
							</div>

							<div class="col-md-6">
								<label>Gender</label> <select class="form-control" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									required type="number" class="form-control" name="age">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment
									Date</label> <input type="date" class="form-control" required
									name="appoint_date">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Phone No</label> <input
									maxlength="10" required type="number" class="form-control"
									name="phno">
							</div>


							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									required type="text" class="form-control" name="diseases">
							</div>

							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Doctor</label> <select
									required class="form-control" name="doct">
									<option value="">Select option..</option>
									<option value="">Shiva Agnihotri</option>
									<option value="">Amit Sharma</option>
									<option value="">Lalit Kumar</option>
									<option value="">Narendra Singh</option>

									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)
									</option>
									<%
									}
									%>




								</select>
							</div>

							<div class="col-md-12">
								<label>Full Address</label>
								<textarea required name="address" class="form-control" rows="3"
									cols=""></textarea>
							</div>

							<c:if test="${empty userObj }">
								<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>

							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="component/footer.jsp"%>

</body>
</html>