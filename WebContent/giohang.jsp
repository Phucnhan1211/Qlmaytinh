<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
			String mamay = request.getParameter("mm");
			String tenmay = request.getParameter("tm");
			String manhinh = request.getParameter("tmh");
			String ram = request.getParameter("tr");
			String cpu = request.getParameter("tc");
			String ocung = request.getParameter("to");
			String giatam = request.getParameter("gia");
	  if(mamay!=null){
//Tao cho kh 1 giohang khi dat mua quyen sach dau tien
		  giohangbo gh=null;
		  if(session.getAttribute("gh")==null){
			  gh=new giohangbo();//cap phat vung nho
			  session.setAttribute("gh", gh);//tao ra 1 gio
		  }
		  //b1: Gan session vao bien
		  gh=(giohangbo)session.getAttribute("gh");
		  gh.Them(mamay, tenmay, manhinh,ram,cpu, ocung, Long.parseLong(giatam), (long)1);//b2
		  session.setAttribute("gh", gh);
		  response.sendRedirect("htgio.jsp");
	  }
  %>
</body>
</html>