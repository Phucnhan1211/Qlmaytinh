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
//Lay ve ma sach
String mm=request.getParameter("mm");
String sl=request.getParameter("txtsl");
if(mm!=null){
	giohangbo  gh=(giohangbo)session.getAttribute("gh");
    if(request.getParameter("butxoa")!=null)
    	gh.Xoa(mm);
    if(request.getParameter("butsua")!=null)
    	gh.Them(mm, "", "","", "","", (long)0, Long.parseLong(sl));
    session.setAttribute("gh", gh);
    response.sendRedirect("htgio.jsp");
}
%>
</body>
</html>