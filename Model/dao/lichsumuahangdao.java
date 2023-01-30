package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.Loaibean;
import bean.khachhangbean;
import bean.lichsumuahangbean;

public class lichsumuahangdao {
	public static  ArrayList<lichsumuahangbean> getlichsumuahang(String makh)throws Exception{
		ArrayList<lichsumuahangbean> lsmh = new ArrayList<lichsumuahangbean>();
		DungChung dc= new DungChung();
		dc.KetNoi();
	    
	    String sql="SELECT *, hd.damua as khdamua\r\n"
	    		+ "FROM KhachHang as kh\r\n"
	    		+ "LEFT JOIN hoadon as hd on kh.makh = hd.makh\r\n"
	    		+ "LEFT JOIN ChiTietHoaDon as c on hd.MaHoaDon = c.MaHoaDon\r\n"
	    		+ "LEFT JOIN may as s on c.MaMay = s.mamay\r\n"
	    		+ "where kh.makh=? and (hd.damua=1 or hd.damua=0)";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setString(1, makh);
		
	    ResultSet rs = cmd.executeQuery();
	    while (rs.next()) {
	        
	        String anh=rs.getNString("anh");
	    	Long SoLuongMua=rs.getLong("SoLuongMua");
	    	String tenmay=rs.getNString("tenmay");
	    	java.sql.Date NgayMua1=rs.getDate("NgayMua");
	    	String manhinh=rs.getNString("manhinh");
	    	String ram=rs.getNString("ram");
	    	String cpu=rs.getNString("cpu");
	    	String NgayMua= NgayMua1.toString();
	    	Long gia=rs.getLong("gia");
	    	String MaMay= rs.getNString("MaMay");
	    	int damua=rs.getInt("khdamua");
	        lsmh.add(new lichsumuahangbean(anh, SoLuongMua, tenmay,cpu,manhinh,ram, NgayMua, gia,MaMay,damua));
	        	
	    }
	    dc.cn.close();
		
		
		return lsmh;
		
	}

}
