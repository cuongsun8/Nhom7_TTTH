package models;

public class DichVuPhanMem {
	public int STT;
	public String KhachHang;
	public String SanPham;
	
	public DichVuPhanMem(int sTT, String khachHang, String sanPham) {
		super();
		STT = sTT;
		KhachHang = khachHang;
		SanPham = sanPham;
	}
	
	public int getSTT() {
		return STT;
	}
	public void setSTT(int sTT) {
		STT = sTT;
	}
	public String getKhachHang() {
		return KhachHang;
	}
	public void setKhachHang(String khachHang) {
		KhachHang = khachHang;
	}
	public String getSanPham() {
		return SanPham;
	}
	public void setSanPham(String sanPham) {
		SanPham = sanPham;
	}
	
}
