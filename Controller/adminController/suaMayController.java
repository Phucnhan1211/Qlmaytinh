package adminController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.adminbean;
import bo.giohangbo;
import bo.maybo;
import dao.loaidao;

/**
 * Servlet implementation class suaMayController
 */
@WebServlet("/suaMayController")
public class suaMayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suaMayController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
		     response.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			
			adminbean admin = (adminbean) session.getAttribute("admin");
			if(admin!=null) {
			 if(request.getParameter("butsua")!=null)
			 {
				 	
					String mamay=request.getParameter("mamay");
					String mamaybandau= request.getParameter("mamaybandau");
					String tenmay=request.getParameter("tenmay");
					String manhinh=request.getParameter("manhinh");
					String ram=request.getParameter("ram");
					String cpu=request.getParameter("cpu");
					String ocung=request.getParameter("ocung");
					String gia=request.getParameter("gia");
					String soluong=request.getParameter("soluong");
					String maloai=request.getParameter("maloai");
				 maybo mbo= new maybo();
				 if(!loaidao.ktloaitontai(maloai)) session.setAttribute("tb", "Mã loại không tồn tại");
				 else if(mbo.updateMay(mamay, tenmay, manhinh,ram,cpu,ocung, Long.parseLong(gia), Long.parseLong(soluong), maloai,mamaybandau))
						 session.setAttribute("tb", "Sửa thành công máy: "+tenmay);
					 else session.setAttribute("tb", "Sửa thất bại máy: "+tenmay);
					 
			 }
			 if(request.getParameter("butxoa")!=null) {
				 String mamay=request.getParameter("mamay");
				 String tenmay=request.getParameter("tenmay");
				 maybo mbo= new maybo();
				 if(mbo.deleteMay(mamay))
					 session.setAttribute("tb", "Xóa thành công máy: "+tenmay);
				 else  session.setAttribute("tb", "Xóa thất bại");
				 
				 
			 }
			 response.sendRedirect("qlyMayController");
			}else {
				response.sendRedirect("adminloginController");
	     }
			 
			 
			
		} catch (Exception e) {
			System.out.print(e);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
