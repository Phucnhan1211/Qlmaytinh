package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.hoadonbean;
import bean.khachhangbean;
import bean.maybean;

public class hoadondao {

	public static boolean insertHoaDon(String makh,String damua,String NgayMua) throws Exception{
		//b1: ket noi vao csdl
		DungChung dc= new DungChung();
		dc.KetNoi();
		//b2: Lay du lieu ve
		String sql="INSERT INTO hoadon(makh,NgayMua,damua)\r\n"
				+ "VALUES (?,?,?)";
		//java.time.LocalDateTime.now()
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		//b3: Truyen tham so vao cau lenh sql
		//java.time.LocalDateTime.now()
		cmd.setString(1, makh);
		cmd.setString(2, NgayMua);
		cmd.setString(3, damua);	
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
	public static String getMaHoaDon() throws Exception{
		String MaHoaDon=null;
		DungChung dc= new DungChung();
		dc.KetNoi();
	    Statement stmt = null;
	    stmt = dc.cn.createStatement();
        
		String sql="select MAX(MaHoaDon)as MaHoaDon from hoadon";
        ResultSet rs = stmt.executeQuery(sql);
        Long MaHoaDon1=(long) 0;
        while (rs.next()) {
        	MaHoaDon1=rs.getLong(1);           
        }
        MaHoaDon= MaHoaDon1.toString();
        dc.cn.close();
		
		
		return MaHoaDon;
		
	}

	public static ArrayList<hoadonbean> getdsHD() throws Exception {
		ArrayList<hoadonbean> hdbean= new ArrayList<hoadonbean>();
		DungChung dc= new DungChung();
		dc.KetNoi();       
		
		Statement stmt = null;
	    stmt = dc.cn.createStatement();
        
	    String sql="select * from hoadon";
		
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
        	int maHoaDon=rs.getInt("MaHoaDon");
        	int makh=rs.getInt("makh");
        	String NgayMua=rs.getDate("NgayMua").toString();
        	int damua=rs.getInt("damua");
        	hdbean.add(new hoadonbean(String.valueOf(maHoaDon),String.valueOf(makh),NgayMua,damua));
        }
        dc.cn.close();
        return hdbean;
	}
	public static boolean nhanHD(String MaHoaDon) throws Exception{
		DungChung dc= new DungChung();
		dc.KetNoi();
	    
	    String sql="UPDATE hoadon\r\n"
	    		+ "set damua = '1'"
	    		+ "where MaHoaDon =? and damua ='0'";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setString(1, MaHoaDon);	
	    int rs = cmd.executeUpdate();
	    if(rs>0) {
	    	dc.cn.close();
			return true;
		}
	    else 
	    {
	    	dc.cn.close();
	    	return false;
	    }
	}
}
