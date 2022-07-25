package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	Connection conn = null;
	ResultSet rs= null;
	public int login(String userID, String userPassword) {
		
		PreparedStatement pstmt = null;
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			conn = DbConnect.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1; //로그인 성공
				else
					return 0; //비밀번호 불일치
			}
			return -1; //아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	public int managerlogin(String managerID, String managerPassword) {
		PreparedStatement pstmt = null;
		String SQL = "SELECT managerPassword FROM manager WHERE managerID = ?";
		try {
			conn = DbConnect.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, managerID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(managerPassword))
					return 1; //로그인 성공
				else
					return 0; //비밀번호 불일치
			}
			return -1; //아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	public int voteox(String userID) {
		String SQL = "select voteox from user where userID=?";
		try {
			PreparedStatement pstmt= null;
			ResultSet rs = null;
			conn = DbConnect.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
