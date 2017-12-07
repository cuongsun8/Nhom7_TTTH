package models;

public class ThongTinLopHoc {
	public String maLop;
	public String thoiGian;
	public String diaDiem;
	public String ngayKhaiGiang;
	public String tenMH;
	public String maLichHoc;
	
	public String getMaLichHoc() {
		return maLichHoc;
	}
	public void setMaLichHoc(String maLichHoc) {
		this.maLichHoc = maLichHoc;
	}
	public String getTenMH() {
		return tenMH;
	}
	public void setTenMH(String tenMH) {
		this.tenMH = tenMH;
	}
	public ThongTinLopHoc(String maLop, String thoiGian, String diaDiem, String ngayKhaiGiang, String tenMH, String maLichHoc) {
		super();
		this.maLop = maLop;
		this.thoiGian = thoiGian;
		this.diaDiem = diaDiem;
		this.ngayKhaiGiang = ngayKhaiGiang;
		this.tenMH = tenMH;
		this.maLichHoc = maLichHoc;
	}
	public String getMaLop() {
		return maLop;
	}
	public void setMaLop(String maLop) {
		this.maLop = maLop;
	}
	public String getThoiGian() {
		return thoiGian;
	}
	public void setThoiGian(String thoiGian) {
		this.thoiGian = thoiGian;
	}
	public String getDiaDiem() {
		return diaDiem;
	}
	public void setDiaDiem(String diaDiem) {
		this.diaDiem = diaDiem;
	}
	public String getNgayKhaiGiang() {
		return ngayKhaiGiang;
	}
	public void setNgayKhaiGiang(String ngayKhaiGiang) {
		this.ngayKhaiGiang = ngayKhaiGiang;
	}
	
	
}
