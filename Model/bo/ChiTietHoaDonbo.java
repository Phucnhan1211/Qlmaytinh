package bo;

import bean.ChiTietHoaDonbean;
import dao.ChiTietHoaDondao;
import dao.hoadondao;

public class ChiTietHoaDonbo {
	public boolean insertChiTietHoaDon(String MaMay,Long SoLuongMua,String MaHoaDon,String damua) throws Exception{
    	return ChiTietHoaDondao.insertChiTietHoaDon(MaMay, SoLuongMua, MaHoaDon, damua);
    }
	public static ChiTietHoaDonbean getdsMaHoaDon(String MaHoaDon) throws Exception{
		return ChiTietHoaDondao.getdsMaHoaDon(MaHoaDon);
		
	}
	public boolean updateCTHD() throws Exception{
		return ChiTietHoaDondao.updateCTHD();
	}
}
