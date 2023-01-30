<%@page import="bean.Loaibean"%>
<%@page import="bean.maybean"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="bean.adminbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin NSTORE</title>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
 
.table-hover tr{
 border-style: solid;
}
.table-hover{
	margin-left:250px;
}
  </style>
</head>

<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
   
    <ul class="nav navbar-nav" style="font-size: 15px;">
      <li ><a href="qlyMayController">Quản lý Máy</a></li>
      <li ><a href="adminqlyloaiController"> Quản lý Loại Máy</a></li>
      <li class="active"><a href="adminqlykhController"> Quản lý Khách Hàng</a></li>
      <li><a href="adminqlyhoadonController">Quản Lý Hóa đơn</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
     
      
      
      <li style="display:flex;">
      
	   <c:if test="${sessionScope.admin!=null}"> 
	   <a>Xin Chào: ${admin.getTenDangNhap() } </a>
	   <a href=adminlogoutController>Đăng Xuất</a>
	   </c:if>
	   <c:if test="${sessionScope.admin==null}">
	   <a href="adminloginController"type="button"  ><span class="glyphicon glyphicon-log-in"></span> 	Đăng nhập</a>
	   </c:if>
	   </li>
	   <c:if test="${not empty sessionScope.tb}">  	 
  	 <script>alert('${tb}');</script>	
  	 <c:set scope="session" var="tb" value="${null}" />	   		   		
  	 </c:if>
    </ul>
  </div>
</nav>
<body>
<table class="table table-hover"width="1000" style="display: flex;" >	
				<tr class="danger">	
    			<th width="70"> Mã KH</th>
				<th width="200"> Họ Tên </th>
				<th width="50">Địa Chỉ</th>
				<th width="100">Số đt</th>
				<th width="200">Email</th>
				<th width="200">Tên đăng nhập</th>			
				<th width="50">Mật khẩu</th>
				<th> </th>
				</tr>
		<c:forEach items="${kh}" var="khbean">
	<tr class="success">
	<form method="post" action="xoakhController?makh=${khbean.getMakh()}">
 				<th width="70"> ${khbean.getMakh()}</th>
				<th width="200"> ${khbean.getHoten()}</th>
				<th width="50">${khbean.getDiachi()}</th>
				<th width="100">${khbean.getSodt()}</th>
				<th width="200">${khbean.getEmail()}</th>
				<th width="200">${khbean.getTendn()}</th>			
				<th width="50">${khbean.getMatkhau()}</th>	
				
				<th> <button type="submit" name="butxoa" class="btn btn-info btn2">Xóa</button>	</th>		
 		
	</form>
	</tr>
</c:forEach>
</table>




</body>
</html>