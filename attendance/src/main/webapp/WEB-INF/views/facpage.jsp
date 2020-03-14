<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file = "links.jsp" %>
</head>
<body>

<%@ include file = "navbar.jsp" %>
<div class="container" style="background-color:#c0fae6; margin-top:50px; padding-top:50px; padding-bottom:50px">
	
<form action="reqGetAttendancePage" method="post">
	Select batch 
	<select name="batchid">
		<c:forEach items="${batches}" var="b">
			<option value="${b.batchid}">${b.batchid}  -  ${b.crsname}</option>
		</c:forEach>	
	</select>
	<input type="submit" value="Get Batch for Attendance"/>
</form>
</div>
</body>
</html>