package bean;

public class adminbean {
	private String TenDangNhap;
	private String MatKhau;
	private int Quyen;
	public adminbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public adminbean(String tenDangNhap, String matKhau, int quyen) {
		super();
		TenDangNhap = tenDangNhap;
		MatKhau = matKhau;
		Quyen = quyen;
	}
	public String getTenDangNhap() {
		return TenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		TenDangNhap = tenDangNhap;
	}
	public String getMatKhau() {
		return MatKhau;
	}
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}
	public int getQuyen() {
		return Quyen;
	}
	public void setQuyen(int quyen) {
		Quyen = quyen;
	}
	
}
