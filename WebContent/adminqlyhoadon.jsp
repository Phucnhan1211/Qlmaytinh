<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.Loaibean"%>
<%@page import="bean.maybean"%>
<%@page import="bean.khachhangbean"%>
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
 .table-hover{
	padding-top:20px;
 margin-left: 100px;
 }
 .table-hover tr th{
  border-style: solid;
  }
  .table-hover tr{
  border-style: solid;
  }
  .hddn{
  color: lightgrey;
  border-style: solid;
  border-color: black;
  }
 
 </style>
</head>

<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
   
    <ul class="nav navbar-nav" style="font-size: 15px;">
      <li ><a href="qlyMayController">Quản lý Máy</a></li>
      <li ><a href="adminqlyloaiController"> Quản lý Loại Máy</a></li>
      <li ><a href="adminqlykhController"> Quản lý Khách Hàng</a></li>
      <li class="active"><a href="adminqlyhoadonController">Quản Lý Hóa Đơn</a></li>
      
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
<table  class="table table-hover" width="900px" style="display:flex;">	
				
				<tr class="success">	
    			<th width="50"> Mã HĐ</th>
				<th width="80"> Mã KH </th>	
				<th width="150"> Họ tên KH </th>
				<th width="100"> Địa chỉ </th>			
				<th width="100">Ngày Mua</th>
				<th width="100">Đã mua</th>
				<th width="100">Mã CTHD</th>
				<th width="100">Mã Máy</th>
				<th width="100">Số Lượng Mua</th>
				<th width="100">Giá</th>
				<th width="100">Thành Tiền</th>
				<th width="100">Nhận HĐ</th>
				
				</tr>
	<c:set var = "f" scope = "page" value = "${DecimalFormat('###,###,###')}"/>
				
	<c:forEach items="${viewgd}" var="gd">
	<tr class="danger">
	<form method="post" action="nhanhdController?MaHoaDon=${gd.getMaHoaDon()}">
 		
				<th width="50"> ${gd.getMaHoaDon()}</th>
				<th width="80"> ${gd.getMakh()} </th>
				<c:forEach items="${kh}" var="khbean">
				<c:if test="${khbean.getMakh()==gd.getMakh()}"><th width="100">${khbean.getHoten()}</th></c:if>
				</c:forEach>
				<c:forEach items="${kh}" var="khbean">
				<c:if test="${khbean.getMakh()==gd.getMakh()}"><th width="100">${khbean.getDiachi()}</th></c:if>
				</c:forEach> 		
				<th width="100">${gd.getNgayMua()}</th>
				<th width="100">${gd.getHddamua()}</th>
				<th width="100">${gd.getMaChiTietHD()}</th>
				<th width="100">${gd.getMaMay()}</th>
				<th width="100">${gd.getSoLuongMua()}</th>
				<th width="100">₫${f.format(gd.getGia())}</th>
				<th width="100">₫${f.format(gd.getThanhTien())}</th>
				<c:if test="${gd.getHddamua()==0}"> 
				<th> <button type="submit" name="butxoa" class="btn btn-info"> Nhận hóa đơn</button></th>
				</c:if>	
				<c:if test="${gd.getHddamua()!=0}"> 
				<th class="hddn">đã nhận</th>
				</c:if>	
 		
	</form>
	</tr>
	</c:forEach>			

</table>

</body>
</html>