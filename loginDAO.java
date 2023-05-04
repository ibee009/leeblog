package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DatabaseUtil;

public class loginDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	
	
	public void UserDAO() {
		try {

			String dbURL = "jdbc:mysql://localhost:3306/leeblog";
			String dbID = "root";
			String dbPassword = "root1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int sign(String userid , String userpw) {
		conn = DatabaseUtil.getConnection();
		String SQL = "SELECT pw from user where id=?";
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userpw))
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 틀림
			}return -1; // 아이디 없음
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	
	
	
	public int signup(loginDTO user) {
		conn = DatabaseUtil.getConnection();
		String SQL = "INSERT INTO USER(name,id,pw) VALUES (?, ?, ?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getUserid());
			pstmt.setString(3, user.getUserpw());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; // 회원가입 실패
	}
	
	
	
	
	public int deleteAccount(String userpw ,String userid) {
		conn = DatabaseUtil.getConnection();
		
		String SQL ="DELETE FROM USER WHERE pw = ? AND id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userpw);
			pstmt.setString(2, userid);
			pstmt.executeUpdate();
			return 1;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return -1; //비밀번호가 틀렸을 경우
	}
	
	
	
	
	public ResultSet findid(String username) {
	    conn = DatabaseUtil.getConnection();
	    String SQL = "SELECT id FROM user where name = ?";
	    try {
	        PreparedStatement pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, username);
	        rs = pstmt.executeQuery();
	        return rs;
	    } catch(SQLException e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	
	
	
	public ResultSet findpw(String username ,String userid) {
	    conn = DatabaseUtil.getConnection();
	    String SQL = "SELECT pw FROM user where name = ? AND id=?";
	    try {
	        PreparedStatement pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, username);
	        pstmt.setString(2, userid);
	        rs = pstmt.executeQuery();
	        return rs;
	    } catch(SQLException e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
}