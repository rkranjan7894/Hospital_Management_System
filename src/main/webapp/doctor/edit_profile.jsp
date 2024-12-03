
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
<title>Insert title here</title>
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

	<!-- Check Doctor Logout  -->
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					
					<!-- show message -->
						<c:if test="${not empty errorMsg }">
							<p class="fs-3 text-center text-danger ">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg }">
							<div class="fs-3 text-center text-success " role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
					
					<div class="card-body">
						<form action="../doctChangePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>
							
							<div class="mb-3">
								<label>Enter old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${doctObj.id }" name="uid">
							<button class="btn btn-success col-md-12">Change Password</button>
						</form>
					</div>
				</div>
			</div>
			
			<div class="col-md-5 offset-md-2">
			<div class="card paint-card">
				<p class="text-center fs-3">Edit Profile</p>
				
				<!-- show message -->
						<c:if test="${not empty errorMsgd }">
							<p class="fs-3 text-center text-danger ">${errorMsgd}</p>
							<c:remove var="errorMsgd" scope="session" />
						</c:if>

						<c:if test="${not empty succMsgd }">
							<div class="fs-3 text-center text-success " role="alert">${succMsgd}</div>
							<c:remove var="succMsgd" scope="session" />
						</c:if>
				
			<div class="card-body">
			
			<!-- add doctor details  -->
				<form action="../doctorUpdateProfile" method="post">
					<div class="mb-3">
						<label class="form-label">Full Name</label> <input type="text"
							required name="fullname" class="form-control" value="${doctObj.fullName }">
					</div>

					<div class="mb-3">
						<label class="form-label">DOB</label> <input type="date" required
							name="dob" class="form-control "value="${doctObj.dob }" >
					</div>

					<div class="mb-3">
						<label class="form-label">Qualification</label> <input type="text"
							required name="qualification" class="form-control" value="${doctObj.qualification }">
					</div>

					<div class="mb-3">
						<label class="form-label">Specialist</label> <select name="spec"
							class="form-control">
							<option>${doctObj.specialist }</option>

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
						<label class="form-label">Email</label> <input type="text" readonly
							required name="email" class="form-control" value="${doctObj.email}">
					</div>

					<div class="mb-3">
						<label class="form-label">Mob No</label> <input type="text" 
							required name="mobno" class="form-control" value="${doctObj.mobNo }">
					</div >
					<input type="hidden" name="id" value="${doctObj.id }">

					<button type="submit" class="btn btn-primary">Update</button>

				</form>
			
			</div>
			
			</div>
			</div>
			
		</div>
	</div>
	
</body>
</html>