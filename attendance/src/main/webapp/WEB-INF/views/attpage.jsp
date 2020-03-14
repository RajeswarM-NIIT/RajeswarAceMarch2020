<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file = "links.jsp" %>
</head>
<body>

<%@ include file = "navbar.jsp" %>
<div class="container" style="background-color:#c0fae6; margin-top:50px">
	<div class="col-sm-12" style="color:black; font-size:30px; font-weight:bold; text-align:center">
		Attendance screen
	</div>
	<hr style="border-top: 1px solid blue">
	<div class="row" style="font-style:bold; font-size:15px">
		<strong>
			<div class="col-sm-2">Batch Code <br> Program</div>
			<div class="col-sm-2">Reg. No. <br> Student ID</div>
			<div class="col-sm-3">Student Name</div>
			<!-- <div class="col-sm-2">Program</div> -->
			<div class="col-sm-2">Session No.</div>
			<div class="col-sm-3">Att. Status</div>
		</strong>
	</div>
	<hr style="border-top: 1px solid blue">
	<spring:form modelAttribute="form"  action="reqMarkAttendance" method="post">
		<c:forEach items="${form.studentrecords}" var="st" varStatus="vs">		
		 	<spring:hidden path="studentrecords[${vs.index}].batchid"/> 
		 	<spring:hidden path="studentrecords[${vs.index}].crsid"/> 	 	
			<spring:hidden path="studentrecords[${vs.index}].crsname"/>
			<spring:hidden path="studentrecords[${vs.index}].nosessions"/>		
			<spring:hidden path="studentrecords[${vs.index}].status"/>
			<spring:hidden path="studentrecords[${vs.index}].batchschstid"/>
			<spring:hidden path="studentrecords[${vs.index}].sessionno"/>
			<spring:hidden path="studentrecords[${vs.index}].batchschedulestudentsstatus"/>
			<spring:hidden path="studentrecords[${vs.index}].regid"/>
			<spring:hidden path="studentrecords[${vs.index}].studentstatus"/>
			<spring:hidden path="studentrecords[${vs.index}].stid"/>
			<spring:hidden path="studentrecords[${vs.index}].stname"/>	
			<div class="row" style="font-size:20px">		
				<div class="col-sm-2">${st.batchid}<br>${st.crsname}</div>
				<div class="col-sm-2">${st.regid}<br>${st.stid}</div> 
				<div class="col-sm-3">${st.stname}</div>
				<%-- <div class="col-sm-2">${st.crsname}</div> --%>
				<div class="col-sm-2">${st.sessionno}</div>
				<div class="col-sm-3">
					<div class="col-sm-6">
						<spring:radiobutton path="studentrecords[${vs.index}].attst" value="Present" checked="true"/>  Present
					</div>
					<div class="col-sm-6">
						<spring:radiobutton path="studentrecords[${vs.index}].attst" value="Absent" />  Absent
					</div>
				</div>
			</div>
			<%-- <spring:checkbox path="${st.attst}" checked="true" value="Present"/> --%>		
			<hr style="border-top: 1px solid #008f2d">	
		</c:forEach>
		<div class="col-sm-12" style="text-align:right; margin-bottom:50px">
			<spring:button class="btn btn-success" style="font-size:20px; background-color:#8aa3ff; color:green">Mart Attendance</spring:button>
		</div>
</spring:form>

</div>
</body>
</html>