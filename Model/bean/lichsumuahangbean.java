package bean;

public class lichsumuahangbean {
	private String anh;
	private Long SoLuongMua;
	private String tenmay;
	private String manhinh;
	private String ram;
	private String cpu;
	private String NgayMua;
	private Long gia;
	private String MaMay;
	private int damua;
	public lichsumuahangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public lichsumuahangbean(String anh, Long soLuongMua, String tenmay, String manhinh, String ram, String cpu,
			String ngayMua, Long gia, String maMay, int damua) {
		super();
		this.anh = anh;
		SoLuongMua = soLuongMua;
		this.tenmay = tenmay;
		this.manhinh = manhinh;
		this.ram = ram;
		this.cpu = cpu;
		NgayMua = ngayMua;
		this.gia = gia;
		MaMay = maMay;
		this.damua = damua;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public Long getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(Long soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public String getTenmay() {
		return tenmay;
	}
	public void setTenmay(String tenmay) {
		this.tenmay = tenmay;
	}
	public String getManhinh() {
		return manhinh;
	}
	public void setManhinh(String manhinh) {
		this.manhinh = manhinh;
	}
	public String getRam() {
		return ram;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	public String getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(String ngayMua) {
		NgayMua = ngayMua;
	}
	public Long getGia() {
		return gia;
	}
	public void setGia(Long gia) {
		this.gia = gia;
	}
	public String getMaMay() {
		return MaMay;
	}
	public void setMaMay(String maMay) {
		MaMay = maMay;
	}
	public int getDamua() {
		return damua;
	}
	public void setDamua(int damua) {
		this.damua = damua;
	}
	public Long getTongGia() {
		return this.gia*this.SoLuongMua;
	}
}
