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

import bean.adminbean;
import bean.hoadonbean;
import bean.khachhangbean;
import bean.viewgdbean;
import bo.hoadonbo;
import bo.khachhangbo;
import bo.viewgdbo;

/**
 * Servlet implementation class adminqlyhoadonController
 */
@WebServlet("/adminqlyhoadonController")
public class adminqlyhoadonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminqlyhoadonController() {
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
			{
					
				viewgdbo viewgdbo = new viewgdbo();
				ArrayList<viewgdbean>  viewgd= viewgdbo.getdsHD();

				khachhangbo khbo = new khachhangbo();
			    ArrayList<khachhangbean> kh = khbo.getKH();
			    request.setAttribute("kh", kh);
				
				request.setAttribute("viewgd", viewgd);
				
				RequestDispatcher rd= request.getRequestDispatcher("adminqlyhoadon.jsp");
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
