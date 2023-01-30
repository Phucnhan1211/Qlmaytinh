package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.hoadonbean;
import bean.khachhangbean;
import bo.ChiTietHoaDonbo;
import bo.giohangbo;
import bo.hoadonbo;

/**
 * Servlet implementation class muasachController
 */
@WebServlet("/muamayController")
public class muamayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public muamayController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session= request.getSession();
			if(session.getAttribute("kh")==null)
			{
				session.setAttribute("tbthanhtoan", "Vui lòng đăng nhập");
			}
			else {
				
				giohangbo gh1=(giohangbo) session.getAttribute("gh");
				//dua vao csdl
				khachhangbean kh= (khachhangbean)session.getAttribute("kh");
				hoadonbo hdbo= new hoadonbo();
				ChiTietHoaDonbo c = new ChiTietHoaDonbo();
				String NgayMua= java.time.LocalDate.now().toString();
				
				if(gh1.muahang(kh))
				{
					session.setAttribute("tbthanhtoan","Mua hàng thành công");
					gh1=null;
					session.setAttribute("gh", gh1);
				}
				else
				{
					session.setAttribute("tbthanhtoan", "Thanh toán thất bại");
				}	
				
				
				
				
			}
			RequestDispatcher rd= request.getRequestDispatcher("thanhtoanController");
			 rd.forward(request, response);//Chuyen tiep request va response ve trang Thanh Toan
			
			
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
