package Controller;

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
import bean.maybean;
import bo.giohangbo;
import bo.loaibo;
import bo.maybo;

/**
 * Servlet implementation class HtGioHangController
 */
@WebServlet("/HtGioHangController")
public class HtGioHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HtGioHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			loaibo loai= new loaibo();
		     maybo mbo=new maybo();
		      ArrayList<maybean> dsmay=mbo.getmay();
		     ArrayList<Loaibean> dsloai=loai.getloai();
		     String ml=request.getParameter("ml");
		     String key=request.getParameter("search");
		     if(ml!=null)
		    	 dsmay=mbo.TimMaloai(ml);
		     else
		    	 if(key!=null)
		    		 dsmay=mbo.Tim(key);
		     
		     request.setAttribute("dsloai", dsloai);
		     request.setAttribute("dsmay", dsmay);
		     HttpSession session = request.getSession();
		     giohangbo gh=(giohangbo) session.getAttribute("gh");
			if(gh==null) {
				 response.sendRedirect("HtMayTinhController");
			}
			else
			{
				RequestDispatcher rd= request.getRequestDispatcher("htgio.jsp");
				rd.forward(request, response);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
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
