package voting;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.DbConnect;

public class VotingDAO{
	Connection conn = null;
	ResultSet rs = null;
	
	public int write(VotingDTO votingDTO) { 
	PreparedStatement pstmt= null;
	try {
		String SQL = "INSERT INTO voting (postsID, votingYear, candidateName, candidateContent, voteCount)VALUES(NULL, ?, ?, ?, 0)";
		conn = DbConnect.getConnection();
		pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, votingDTO.getVotingYear());
		pstmt.setString(2, votingDTO.getCandidateName());
		pstmt.setString(3, votingDTO.getCandidateContent());
		return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	return -1; //데이터베이스 오류
	}
	
	public ArrayList<VotingDTO> getList(){ 
		String SQL = "SELECT * FROM voting ORDER BY postsID ASC";
		ArrayList<VotingDTO> list = new ArrayList<VotingDTO>();
		try {
			PreparedStatement pstmt= null;
			conn = DbConnect.getConnection();
			pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				VotingDTO votingDTO = new VotingDTO();
				votingDTO.setPostsID(rs.getInt(1));
				votingDTO.setCandidateName(rs.getString(2));
				votingDTO.setCandidateContent(rs.getString(3));
				votingDTO.setVotingYear(rs.getInt(4));
				list.add(votingDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public int count(String postsID) {
		String SQL1 = "UPDATE voting SET voteCount = voteCount+1 where postsID=?";
		try {
			PreparedStatement pstmt= null;
			conn = DbConnect.getConnection();
			pstmt = conn.prepareStatement(SQL1);
			pstmt = conn.prepareStatement(SQL1);
			pstmt.setString(1, postsID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int voteox(String userID) {
		String SQL = "UPDATE user SET voteox = 1 where userID=?";
		try {
			PreparedStatement pstmt= null;
			conn = DbConnect.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int delete(String postsID) {
		String SQL = "DELETE FROM voting where postsID=?";
		try {
			PreparedStatement pstmt= null;
			conn = DbConnect.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(postsID));
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}

	
	

