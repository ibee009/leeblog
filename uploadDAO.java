package upload;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DatabaseUtil;

public class uploadDAO {

	private Connection conn;
	private ResultSet rs;
	
	
	public uploadDAO() {
		try {
			String dbURL ="jdbc:mysql://localhost:3306/leeblog";
			String dbID ="root";
			String dbPassword ="root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public int mainupload(String userid ,String title,String bulletin) {
		conn = DatabaseUtil.getConnection();
		String SQL ="INSERT INTO upload(id,title,bulletin) VALUES(?,?,?)";
		
		try {
			PreparedStatement pstmt =conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			pstmt.setString(2, title);
			pstmt.setString(3, bulletin);
			return pstmt.executeUpdate();
			}catch(SQLException e){
			e.printStackTrace();
		}
		return -1;	//업로드 실패
	}
	
	public ResultSet upload() {
	    conn = DatabaseUtil.getConnection();
	    String SQL = "SELECT * FROM upload";
	    try {
	        PreparedStatement pstmt = conn.prepareStatement(SQL);
	        rs = pstmt.executeQuery();
	        return rs;
	    } catch(SQLException e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	public int delete(String id, String number) {
	    conn = DatabaseUtil.getConnection();
	    String SQL = "DELETE FROM upload where number=?";
	    try {
	        PreparedStatement pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, number);
	        return pstmt.executeUpdate();
	    } catch(SQLException e) {
	        e.printStackTrace();
	    }
	    return -1;
	}
	
	public int update(String title,String bulletin, String number) {
	    conn = DatabaseUtil.getConnection();
	    String SQL = "UPDATE upload SET title=?,bulletin =? where number=?";
	    try {
	        PreparedStatement pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, title);
	        pstmt.setString(2, bulletin);
	        pstmt.setString(3, number);
	        return pstmt.executeUpdate();
	    } catch(SQLException e) {
	        e.printStackTrace();
	    }
	    return -1;
	}
}
