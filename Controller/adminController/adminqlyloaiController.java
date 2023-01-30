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
import bo.loaibo;

/**
 * Servlet implementation class adminqlyloaiController
 */
@WebServlet("/adminqlyloaiController")
public class adminqlyloaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminqlyloaiController() {
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
				loaibo lbo = new loaibo();
				ArrayList<Loaibean> dsloai=lbo.getloai();
			    request.setAttribute("dsloai", dsloai);		     			
				RequestDispatcher rd= request.getRequestDispatcher("adminqlyloai.jsp");
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
