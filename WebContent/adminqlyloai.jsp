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
	margin-left:400px;
}

</style>

</head>

<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
   
    <ul class="nav navbar-nav">
      <li ><a href="qlyMayController">Quản lý Máy</a></li>
      <li class="active"><a href="adminqlyloaiController"> Quản lý Loại Máy</a></li>
      <li ><a href="adminqlykhController"> Quản lý Khách Hàng</a></li>
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
	   <c:if test="${sessionScope.tb!=null}">  	 
  	 <script>alert('${tb}');</script>	
  	 <c:set scope="session" var="tb" value="${null}" />	   		   		
  	 </c:if>
    </ul>
  </div>
</nav>
<table width="600" class="table table-hover" style="display: flex;">	
				
				<tr class="info">	
    			<th width="100"> Mã loại</th>
				<th width="100"> Tên loại</th>
				<th> </th>
				<th> </th>
				</tr>
				<tr class="success">
				<form method="post" action="sualoaiController">
 				
					<th width="100"> <input name="maloaithem" value=""></th>
					<th width="100"> <input name="tenloaithem" value=""> </th>
					
					<th width="100"> <button type="submit" name="butthem" class="btn btn-info">Thêm +</button>	</th>		
 					<th> </th>
				</form>
				</tr>
	<c:forEach items="${dsloai}" var="loai">
	
	<tr width="400" class="danger">
	<form method="post" action="sualoaiController">
 				<th width="100" style="display:none;"> <input name="maloaibandau" value="${loai.getMaloai()}"></th>
				<th width="100"> <input name="maloai" value="${loai.getMaloai()}"></th>
				<th width="100"> <input name="tenloai" value="${loai.getTenloai()}"> </th>
				
				<th width="100"> <button type="submit" name="butsua" class="btn btn-info">Sửa</button>	</th>
				<th width="100"> <button type="submit" name="butxoa" class="btn btn-info btn2">Xóa</button>	</th>		
 		
	</form>
	</tr>
</c:forEach>
</table>

</body>
</html>