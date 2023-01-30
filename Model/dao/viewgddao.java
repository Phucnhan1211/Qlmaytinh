package dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.hoadonbean;
import bean.viewgdbean;

public class viewgddao {
	public static ArrayList<viewgdbean> getdsGD() throws Exception {
		ArrayList<viewgdbean> viewgd = new ArrayList<viewgdbean>();
		DungChung dc= new DungChung();
		dc.KetNoi();       
		
		Statement stmt = null;
	    stmt = dc.cn.createStatement();
        
	    String sql="select* from view_gdich";
		
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
        	int MaHoaDon= rs.getInt("MaHoaDon");
        	int makh= rs.getInt("makh");
        	String hoten = rs.getString("hoten").toString();
        	String diachi = rs.getString("diachi").toString();
        	String NgayMua= rs.getDate("NgayMua").toString();
        	int hddamua= rs.getInt("hddamua");
        	int cthddamua= rs.getInt("cthddamua");
        	int MaChiTietHD= rs.getInt("MaChiTietHD");
        	String MaMay= rs.getNString("MaMay");
        	Long SoLuongMua =rs.getLong("SoLuongMua");
        	Long Gia=rs.getLong("Gia");
        	Long ThanhTien= rs.getLong("ThanhTien");
        	viewgd.add(new viewgdbean(MaHoaDon, makh,hoten, NgayMua, hddamua, cthddamua, MaChiTietHD, MaMay, SoLuongMua, Gia, ThanhTien));
        }
        dc.cn.close();
        return viewgd;
	}
}
