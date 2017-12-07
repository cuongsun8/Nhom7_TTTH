package models;

public class ThemLop {
	
	
	private int maMonHoc;
	private String tenMonHoc;
	public String getTenMonHoc() {
		return tenMonHoc;
	}
	public void setTenMonHoc(String tenMonHoc) {
		this.tenMonHoc = tenMonHoc;
	}

	public ThemLop(int MaMonHoc,String tenMonHoc)
	{
		this.maMonHoc = MaMonHoc;
		this.tenMonHoc = tenMonHoc;
		
		
	}
	public int getMaMonHoc() {
		return maMonHoc;
	}
	public void setMaMonHoc(int maMonHoc) {
		this.maMonHoc = maMonHoc;
	}
	
	
	
}
