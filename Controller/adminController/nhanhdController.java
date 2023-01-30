package adminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.adminbean;
import bo.ChiTietHoaDonbo;
import bo.hoadonbo;

/**
 * Servlet implementation class nhanhdController
 */
@WebServlet("/nhanhdController")
public class nhanhdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nhanhdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			String MaHoaDon = request.getParameter("MaHoaDon");
			adminbean admin = (adminbean) session.getAttribute("admin");
			if(admin!=null) {
				hoadonbo hdbo = new hoadonbo();
				ChiTietHoaDonbo cbo= new ChiTietHoaDonbo();
				if(hdbo.nhanHD(MaHoaDon)) {
					cbo.updateCTHD();
					session.setAttribute("tb", "Đã nhận hóa đơn" + MaHoaDon);
				}
				else session.setAttribute("tb", "Nhận hóa đơn không thành công");
				
			}
			response.sendRedirect("adminqlyhoadonController");
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
