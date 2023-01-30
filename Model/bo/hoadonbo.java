package bo;

import java.util.ArrayList;

import bean.hoadonbean;
import dao.giohangdao;
import dao.hoadondao;

public class hoadonbo {
	
    
    public boolean insertHoaDon(String makh,String damua,String NgayMua) throws Exception{
    	return hoadondao.insertHoaDon(makh, damua,NgayMua);
    }
    public String getMaHoaDon() throws Exception{
    	return hoadondao.getMaHoaDon();
    }
//	public ArrayList<hoadonbean> getdsMaHoaDon(String makh) throws Exception{
//		return hoadondao.getdsMaHoaDon(makh);
//	}
	public  ArrayList<hoadonbean> getdsHD() throws Exception {
		return hoadondao.getdsHD();
	}
	public boolean nhanHD(String MaHoaDon) throws Exception{
		return hoadondao.nhanHD(MaHoaDon);
	}
}
