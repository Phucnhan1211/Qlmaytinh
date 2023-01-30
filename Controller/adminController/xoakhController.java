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
import bo.khachhangbo;

/**
 * Servlet implementation class xoakhController
 */
@WebServlet("/xoakhController")
public class xoakhController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xoakhController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			HttpSession session = request.getSession();
					
			adminbean admin = (adminbean) session.getAttribute("admin");
			if(admin!=null) 
				if(request.getParameter("butxoa")!=null) {
					khachhangbo khbo= new khachhangbo();
					String makh=request.getParameter("makh");
					if(khbo.deleteKH(makh))
						 session.setAttribute("tb", "Xóa thành công khách hàng: "+makh);
					else session.setAttribute("tb", "Xóa thất bại");
				}
				else session.setAttribute("tb", "Vui lòng đăng nhập");
			response.sendRedirect("adminqlykhController");
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
