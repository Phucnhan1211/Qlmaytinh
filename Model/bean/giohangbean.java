package bean;

public class giohangbean {
	private String mamay;
    private String tenmay;
    private String manhinh;
    private String ram;
    private String cpu;
    private String ocung;
    private Long gia;
    private Long slmua;
    private Long thanhtien;
	public giohangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public giohangbean(String mamay, String tenmay, String manhinh, String ram, String cpu, String ocung, Long gia, Long slmua) {
		super();
		this.mamay = mamay;
		this.tenmay = tenmay;
		this.manhinh = manhinh;
		this.ram = ram;
		this.cpu = cpu;
		this.ocung = ocung;
		this.gia = gia;
		this.slmua = slmua;
	}
	public String getMamay() {
		return mamay;
	}
	public void setMamay(String mamay) {
		this.mamay = mamay;
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
	public String getOcung() {
		return ocung;
	}
	public void setOcung(String ocung) {
		this.ocung = ocung;
	}
	public Long getGia() {
		return gia;
	}
	public void setGia(Long gia) {
		this.gia = gia;
	}
	public Long getSlmua() {
		return slmua;
	}
	public void setSlmua(Long slmua) {
		this.slmua = slmua;
	}
	public Long getThanhtien() {
		return slmua*gia;
	}
	public void setThanhtien(Long thanhtien) {
		this.thanhtien = thanhtien;
	}
}
