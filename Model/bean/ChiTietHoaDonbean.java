package bean;

public class ChiTietHoaDonbean {
	private String MaChiTietHD;
	private String MaMay;
	private Long SoluongMua;
	private String MaHoaDon;
	private boolean damua;
	public ChiTietHoaDonbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChiTietHoaDonbean(String maChiTietHD, String maMay, Long soluongMua, String maHoaDon, boolean damua) {
		super();
		MaChiTietHD = maChiTietHD;
		MaMay = maMay;
		SoluongMua = soluongMua;
		MaHoaDon = maHoaDon;
		this.damua = damua;
	}
	public String getMaChiTietHD() {
		return MaChiTietHD;
	}
	public void setMaChiTietHD(String maChiTietHD) {
		MaChiTietHD = maChiTietHD;
	}
	public String getMaMay() {
		return MaMay;
	}
	public void setMaMay(String maMay) {
		MaMay = maMay;
	}
	public Long getSoluongMua() {
		return SoluongMua;
	}
	public void setSoluongMua(Long soluongMua) {
		SoluongMua = soluongMua;
	}
	public String getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(String maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
}
