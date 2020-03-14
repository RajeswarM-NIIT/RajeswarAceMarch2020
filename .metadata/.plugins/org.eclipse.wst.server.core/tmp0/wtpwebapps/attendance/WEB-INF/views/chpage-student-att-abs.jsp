<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  

<%@ include file = "links.jsp" %>

<script>
	$(document).ready(
			function() {
				var searchCondition = '${searchCondition}';
				$('.table').DataTable(
						{
							"lengthMenu" : [ [ 20, 40,60, -1 ],
									[ "Twenty", "Forty", "Sixty", "All" ] ],
							"oSearch" : {"sSearch" : searchCondition
							}
						})
			});
</script>

	<style>
.table-striped>tbody>tr:nth-child(odd)>td, 
.table-striped>tbody>tr:nth-child(odd)>th {
   background-color: #72e89b;
 }
 .table-striped>tbody>tr:nth-child(even)>td, 
.table-striped>tbody>tr:nth-child(odd)>th {
   background-color: #c7fccd;
 }
</style>
</head>
<body>

<%@ include file = "navbar.jsp" %>
<div class="container" style="background-color:#c0fae6; margin-top:50px; padding-top:50px; padding-bottom:50px">
	
<form action="reqAttPresPage" method="post">
	<input type="submit" value="Get studentwise data - Present %"/>
</form>
<form action="reqAttAbsPage" method="post">
	<input type="submit" value="Get studentwise data - Absent %"/>
</form>

</div>

<div class="container" style="background-color:#c0fae6; padding-bottom:20px">
			<div class="col-sm-12">
				<table class="table table-striped fixed_headers table-hover" id="tablesortsearch">
				
					<thead>
						<tr>
							<th style="text-align:center">Student ID <br> Reg. No.</th>
							<th style="text-align:center">Student name</th>
							<th style="text-align:center">Course <br> Batch code</th>
							<th style="text-align:center">#Sessions</th>
							<th style="text-align:center">#Attended</th>	
							<th style="text-align:center">Absent %</th>														
						</tr>
					</thead>
					
					<tbody style="text-align:center; font-size:15px">
						<c:forEach items="${absentdata}" var="a">
							<tr style="font-size:20px;">								
								<td>${a.stid} <br> ${a.regid}</td>
								<td>${a.stname}</td>
								<td>${a.crsname} <br> ${a.batchid}</td>
								<td>${a.nosessions}</td>
								<td>${a.absents}</td>								
								<td style="font-size:30px; font-color:black">
									<c:if test="${((a.absents/a.nosessions)*100)>=90}">							
										<span class="label label-default" style="background-color:#fc3d3d; color:black">
											<fmt:formatNumber type="number" maxFractionDigits="2" value="${(a.absents/a.nosessions)*100}" />
											<span style='font-size:25px;'>&#37;</span>
										</span>								
									</c:if>
									<c:if test="${ ((a.absents/a.nosessions)*100)>=80  &&  ((a.absents/a.nosessions)*100)<90}">							
										<span class="label label-default" style="background-color:#ffd6eb; color:black">
											<fmt:formatNumber type="number" maxFractionDigits="2" value="${(a.absents/a.nosessions)*100}" />
											<span style='font-size:25px;'>&#37;</span>
										</span>								
									</c:if>
									<c:if test="${ ((a.absents/a.nosessions)*100)>=70  &&  ((a.absents/a.nosessions)*100)<80}">							
										<span class="label label-default" style="background-color:#ffb0fc; color:black">
											<fmt:formatNumber type="number" maxFractionDigits="2" value="${(a.absents/a.nosessions)*100}" />
											<span style='font-size:25px;'>&#37;</span>
										</span>								
									</c:if>
									<c:if test="${ ((a.absents/a.nosessions)*100)>=50  &&  ((a.absents/a.nosessions)*100)<70}">							
										<span class="label label-default" style="background-color:#71bfb7; color:black">
											<fmt:formatNumber type="number" maxFractionDigits="2" value="${(a.absents/a.nosessions)*100}" />
											<span style='font-size:25px;'>&#37;</span>
										</span>								
									</c:if>
									<c:if test="${ ((a.absents/a.nosessions)*100)>=20  &&  ((a.absents/a.nosessions)*100)<50}">							
										<span class="label label-default" style="background-color:#d9f76a; color:black">
											<fmt:formatNumber type="number" maxFractionDigits="2" value="${(a.absents/a.nosessions)*100}" />
											<span style='font-size:25px;'>&#37;</span>
										</span>								
									</c:if>		
									<c:if test="${ ((a.absents/a.nosessions)*100)<20}">							
										<span class="label label-default" style="background-color:#10b03b; color:black">
											<fmt:formatNumber type="number" maxFractionDigits="2" value="${(a.absents/a.nosessions)*100}" />
											<span style='font-size:25px;'>&#37;</span>
										</span>								
									</c:if>									
								</td>								
							</tr>
						</c:forEach>				
					</tbody>				
				</table>
			</div>
		</div>
</body>

</html>