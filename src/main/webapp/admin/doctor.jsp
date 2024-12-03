<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.Specalist"%>
<%@page import="com.entity.Doctor"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Page</title>
<%@include file="../component/allcss.jsp"%>
<!-- Card Shadow -->
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3)
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<!-- Doctor Add -->
	<div class="container-fluid p-3">
	<div class="row">

	<div class="col-md-5 offset-md-4">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Add Doctor</p>
				<!-- show message -->
				<c:if test="${not empty errorMsg }">
					<p class="fs-3 text-center text-danger ">${errorMsg}</p>
					<c:remove var="errorMsg" scope="session" />
				</c:if>

				<c:if test="${not empty succMsg }">
					<div class="fs-3 text-center text-success " role="alert">${succMsg}</div>
					<c:remove var="succMsg" scope="session" />
				</c:if>
				<!-- add doctor details  -->
				<form action="../addDoctor" method="post">
					<div class="mb-3">
						<label class="form-label">Full Name</label> <input type="text"
							required name="fullname" class="form-control">
					</div>

					<div class="mb-3">
						<label class="form-label">DOB</label> <input type="date" required
							name="dob" class="form-control">
					</div>

					<div class="mb-3">
						<label class="form-label">Qualification</label> <input type="text"
							required name="qualification" class="form-control">
					</div>

					<div class="mb-3">
						<label class="form-label">Specialist</label> <select name="spec"
							class="form-control">
							<option>--select--</option>

							<!-- Show Dynamic add Specialist -->
							<%
							SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
							List<Specalist> list = dao.getAllSpecialist();
							for (Specalist s : list) {
							%>
							<option><%=s.getSpecialistName()%></option>
							<%
							}
							%>


						</select>
					</div>

					<div class="mb-3">
						<label class="form-label">Email</label> <input type="text"
							required name="email" class="form-control">
					</div>

					<div class="mb-3">
						<label class="form-label">Mob No</label> <input type="text"
							required name="mobno" class="form-control">
					</div>

					<div class="mb-3">
						<label class="form-label">Password</label> <input type="password"
							required name="password" class="form-control">
					</div>

					<button type="submit" class="btn btn-primary">Submit</button>

				</form>

			</div>

		</div>

	</div>
</div>
</div>
	


</body>
</html>