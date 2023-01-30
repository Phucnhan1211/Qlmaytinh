package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Loaibean;
import bean.maybean;


public class loaidao {
	
	
	public ArrayList<Loaibean> getloai() throws Exception{
		ArrayList<Loaibean> ds = new ArrayList<Loaibean>();
		
		DungChung dc= new DungChung();
		dc.KetNoi();
	    Statement stmt = null;
	    stmt = dc.cn.createStatement();
	    // get data from table 'loai'
	    ResultSet rs = stmt.executeQuery("select maloai,tenloai from loai");
	    while (rs.next()) {
	        String maloai=rs.getNString("maloai");
	        String tenloai=rs.getNString("tenloai");
	        	       	
	        ds.add(new Loaibean(maloai,tenloai));
	        	
	    }
	    dc.cn.close();
			
		
		return ds;
	}
	public static boolean insertLoai(String maloai,String tenloai)throws Exception {
		DungChung dc= new DungChung();
		dc.KetNoi();
	    
	    String sql="INSERT INTO loai(maloai,tenloai)\r\n"
	    		+ "values (?,?)";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		cmd.setString(2, tenloai);
	    int rs = cmd.executeUpdate();
	    if(rs>0) {
			return true;
		}
	    else return false;
	    
	}
	public static boolean ktloaitontai(String maloai) throws Exception{
		DungChung dc= new DungChung();
		dc.KetNoi();
		String sql="select* from loai where maloai=?";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		ResultSet rs = cmd.executeQuery();
		
		if(rs.next()) {
			rs.close();
			dc.cn.close();
			return true;
		}
		else 
		{
			rs.close();
			dc.cn.close();
			return false;
		}
	}
	public static boolean updateLoai(String maloai,String tenloai,String maloaibandau) throws Exception{
		DungChung dc= new DungChung();
		dc.KetNoi();
		String sql="UPDATE loai\r\n"
				+ "set maloai =?,tenloai =?\r\n"
				+ "where maloai= ?";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		cmd.setString(2, tenloai);
		cmd.setString(3, maloaibandau);
		int rs = cmd.executeUpdate();
		if (rs>0)
		{
			dc.cn.close();
			return true;
		}
		else {
			dc.cn.close();
			return false;
		}
				
	}
	public static boolean deleteLoai(String maloai) throws Exception{
		DungChung dc= new DungChung();
		dc.KetNoi();
		String sql="DELETE FROM loai where maloai =?";
		PreparedStatement cmd=dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		int rs = cmd.executeUpdate();
		if (rs>0)
		{
			dc.cn.close();
			return true;
		}
		else {
			dc.cn.close();
			return false;
		}
	}
	
	
	
}
