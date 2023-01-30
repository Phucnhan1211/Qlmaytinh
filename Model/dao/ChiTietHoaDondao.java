package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.ChiTietHoaDonbean;
import bean.hoadonbean;

public class ChiTietHoaDondao {

	public static boolean insertChiTietHoaDon(String MaMay,Long SoLuongMua,String MaHoaDon,String damua) throws Exception{
		//b1: ket noi vao csdl
		DungChung dc= new DungChung();
		dc.KetNoi();
		//b2: Lay du lieu ve
		String sql="INSERT INTO ChiTietHoaDon(MaMay,SoLuongMua,MaHoaDon,damua)\r\n"
				+ "VALUES (?,?,?,?)";
		//java.time.LocalDateTime.now()
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		//b3: Truyen tham so vao cau lenh sql
		String sl=SoLuongMua.toString();
		cmd.setString(1, MaMay);
		cmd.setString(2, sl);
		cmd.setString(3, MaHoaDon);	
		cmd.setString(4, damua);
		int i= cmd.executeUpdate();
		if(i>0) {
			
			dc.cn.close();
			return true;
		}
			
		else {
			dc.cn.close();
			return false;
		}
		
	}
	public static ChiTietHoaDonbean getdsMaHoaDon(String MaHoaDon) throws Exception{
		ChiTietHoaDonbean cthd= null;
		DungChung dc= new DungChung();
		dc.KetNoi();
	    
        
		String sql="select * from ChiTietHoaDon where MaHoaDon=?";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setString(1, MaHoaDon);
        ResultSet rs = cmd.executeQuery(sql);
        
        while (rs.next()) {
        	String MaChiTietHD=rs.getString("MaChiTietHD");
        	String MaMay=rs.getString("MaMay");
        	Long SoluongMua=rs.getLong("SoLuongMua");
        	int damuaInt=rs.getInt("damua");
        	boolean damua=false;
        	if(damuaInt!=0) damua=true;
        	cthd =new ChiTietHoaDonbean(MaChiTietHD,MaMay,SoluongMua,MaHoaDon,damua);

        }
        
        dc.cn.close();
		
		
		return cthd;
	
	}
	public static boolean updateCTHD() throws Exception{
		DungChung dc= new DungChung();
		dc.KetNoi();
	    
        
		String sql="update view_gdich\r\n"
				+ "set cthddamua=1\r\n"
				+ "where hddamua=1 and cthddamua=0";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
        int rs = cmd.executeUpdate();
        if(rs>0) {
			
			dc.cn.close();
			return true;
		}
			
		else {
			dc.cn.close();
			return false;
		}
	}
}
