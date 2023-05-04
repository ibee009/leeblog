package upload;

public class uploadDTO {

	private String bulltin;
	private String userid;
	
	public String getBulltin() {
		return bulltin;
	}
	public void setBulltin(String bulltin) {
		this.bulltin = bulltin;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public uploadDTO(String userid ,String bulltin) {
		super();
		this.bulltin = bulltin;
		this.userid = userid;
	}

}
