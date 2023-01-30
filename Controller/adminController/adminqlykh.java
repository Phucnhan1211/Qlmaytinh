package adminController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Loaibean;
import bean.adminbean;
import bean.khachhangbean;
import bo.khachhangbo;
import bo.loaibo;

/**
 * Servlet implementation class adminqlykhController
 */
@WebServlet("/adminqlykhController")
public class adminqlykh extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminqlykh() {
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
				khachhangbo khbo = new khachhangbo();
			    ArrayList<khachhangbean> kh = khbo.getKH();
			    request.setAttribute("kh", kh);
				RequestDispatcher rd= request.getRequestDispatcher("adminqlykh.jsp");
				rd.forward(request, response);
			}
			else response.sendRedirect("adminloginController");
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
