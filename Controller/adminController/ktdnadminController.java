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
import bo.adminbo;

/**
 * Servlet implementation class ktdnadminController
 */
@WebServlet("/ktdnadminController")
public class ktdnadminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ktdnadminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 try {
			 HttpSession session = request.getSession();
			 String TenDangNhap =request.getParameter("TenDangNhap");
			 String MatKhau = request.getParameter("MatKhau");
			 adminbo adminbo= new adminbo();
			 adminbean admin=adminbo.ktadmin(TenDangNhap, MatKhau);
			 
			 if(admin!=null){
		    	 session.setAttribute("admin", admin);
		    	 RequestDispatcher rd= request.getRequestDispatcher("qlyMayController");
				 rd.forward(request, response);
		     }
		     else {
		    	 session.setAttribute("tb", "Đăng Nhập Sai");
		    	 RequestDispatcher rd= request.getRequestDispatcher("adminloginController");
				 rd.forward(request, response);
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
