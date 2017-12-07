package models;

public class HocVien {
	public String id;
	public String tenHV;
	public String email;
	public String sdt;
	public String ngayDangKy;
	public String ngayKhaiGiang;
	
	public HocVien(String id, String tenHV, String email, String sdt, String ngayDangKy, String ngayKhaiGiang) {
		super();
		this.id = id;
		this.tenHV = tenHV;
		this.email = email;
		this.sdt = sdt;
		this.ngayDangKy = ngayDangKy;
		this.ngayKhaiGiang = ngayKhaiGiang;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTenHV() {
		return tenHV;
	}

	public void setTenHV(String tenHV) {
		this.tenHV = tenHV;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getNgayDangKy() {
		return ngayDangKy;
	}

	public void setNgayDangKy(String ngayDangKy) {
		this.ngayDangKy = ngayDangKy;
	}

	public String getNgayKhaiGiang() {
		return ngayKhaiGiang;
	}

	public void setNgayKhaiGiang(String ngayKhaiGiang) {
		this.ngayKhaiGiang = ngayKhaiGiang;
	}

	public HocVien() {
		// TODO Auto-generated constructor stub
	}

}
