package models;

public class CTDT {
	public int maCTDT;
	public String tenCTDT;
	public String image;
	public String url;
	
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getMaCTDT() {
		return maCTDT;
	}

	public void setMaCTDT(int maCTDT) {
		this.maCTDT = maCTDT;
	}

	public String getTenCTDT() {
		return tenCTDT;
	}

	public void setTenCTDT(String tenCTDT) {
		this.tenCTDT = tenCTDT;
	}
	

	public CTDT(int maCTDT, String tenCTDT, String image, String url) {
		super();
		this.maCTDT = maCTDT;
		this.tenCTDT = tenCTDT;
		this.image = image;
		this.url = url;
	}

	public CTDT() {
		// TODO Auto-generated constructor stub
	}

}
