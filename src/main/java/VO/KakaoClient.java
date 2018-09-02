package VO;

public class KakaoClient {
	private Long cliNo;
	private String cliName;

	public KakaoClient() { 
		
	}
	public KakaoClient(String cli_name) {      
		this.cliName = cli_name;    
	}
	public KakaoClient(Long cli_no, String cli_name) {
		this.cliNo = cli_no;
		this.cliName = cli_name;
	}
	public Long getCliNo() {      
		return cliNo;   
	}
	public void setCliNo(Long cli_no) {
		this.cliNo = cli_no;
	}
	public String getCliName() {
		return cliName;
	}
	public void setCliName(String cli_name) {
		this.cliName = cli_name;
	}
	public String toString() {   
		return "[cliNo=" + cliNo +",cliName=" + cliName + "]";   
	}
}
