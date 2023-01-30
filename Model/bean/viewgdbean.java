package bean;

public class viewgdbean {
	private int MaHoaDon;
	private int makh;
	private String hoten;
	private String diachi;
	private String NgayMua;
	private int hddamua;
	private int cthddamua;
	private int MaChiTietHD;
	private String MaMay;
	private Long SoLuongMua;
	private Long Gia;
	private Long ThanhTien;
	public viewgdbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public viewgdbean(int maHoaDon, int makh, String hoten, String ngayMua, int hddamua, int cthddamua,
			int maChiTietHD, String maMay, Long soLuongMua, Long gia, Long thanhTien) {
		super();
		MaHoaDon = maHoaDon;
		this.makh = makh;
		NgayMua = ngayMua;
		this.hddamua = hddamua;
		this.cthddamua = cthddamua;
		MaChiTietHD = maChiTietHD;
		MaMay = maMay;
		SoLuongMua = soLuongMua;
		Gia = gia;
		ThanhTien = thanhTien;
	}
	public int getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(int maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public int getMakh() {
		return makh;
	}
	public void setMakh(int makh) {
		this.makh = makh;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getHoTen() {
		return hoten;
	}
	public void setHoTen(String hoten) {
		this.hoten = hoten;
	}
	public String getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(String ngayMua) {
		NgayMua = ngayMua;
	}
	public int getHddamua() {
		return hddamua;
	}
	public void setHddamua(int hddamua) {
		this.hddamua = hddamua;
	}
	public int getCthddamua() {
		return cthddamua;
	}
	public void setCthddamua(int cthddamua) {
		this.cthddamua = cthddamua;
	}
	public int getMaChiTietHD() {
		return MaChiTietHD;
	}
	public void setMaChiTietHD(int maChiTietHD) {
		MaChiTietHD = maChiTietHD;
	}
	public String getMaMay() {
		return MaMay;
	}
	public void setMaMay(String maMay) {
		MaMay = maMay;
	}
	public Long getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(Long soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public Long getGia() {
		return Gia;
	}
	public void setGia(Long gia) {
		Gia = gia;
	}
	public Long getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(Long thanhTien) {
		ThanhTien = thanhTien;
	}
	
	
}
