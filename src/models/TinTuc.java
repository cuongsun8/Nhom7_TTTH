package models;

public class TinTuc {
	String chude;
	String tieude;
	String url;
	String image;
	String content;
	public TinTuc(String chude, String tieude, String url, String image, String content) {
		super();
		this.chude = chude;
		this.tieude = tieude;
		this.url = url;
		this.image = image;
		this.content = content;
	}
	public TinTuc() {
		
	}
	
	public String getChude() {
		return chude;
	}
	public void setChude(String chude) {
		this.chude = chude;
	}
	public String getTieude() {
		return tieude;
	}
	public void setTieude(String tieude) {
		this.tieude = tieude;
	}
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
