package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dto.Board;
import dto.Page;

public class BoardDAO {
	
	public List<Board> selectBoardList(Connection con, Map<String, String> pHm,Page p) throws SQLException{
		List<Board> boardList = new ArrayList<Board>();
		String sql = "select b.*,u.name from board as b, user as u" + 
				" where b.writer=u.user_no";
		if(pHm.get("content")!=null) {
			sql += " and b.content like concat('%',?,'%')";
		}
		PreparedStatement ps = con.prepareStatement(sql);
		if(pHm.get("content")!=null) {
			ps.setString(1, pHm.get("content"));
		}
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setbNum(rs.getInt("b_num"));
			b.setTitle(rs.getString("title"));
			b.setWriter(rs.getInt("writer"));
			b.setContent(rs.getString("content"));
			b.setRegDate(rs.getString("reg_Date"));
			b.setUserName(rs.getString("name"));
			boardList.add(b);
		}
		return boardList;
	}
	
}