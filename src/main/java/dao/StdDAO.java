package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;




import javax.sql.DataSource;

import dto.StdDTO;

public class StdDAO {
private static StdDAO instance = null;
	
	public synchronized static StdDAO getInstance() {	// 싱글턴 패턴
		if(instance == null) {
			instance = new StdDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
		
		return ds.getConnection();
	}
	
	public int insert(StdDTO dto) throws Exception {
		String sql = "insert into student values(student_seq.nextval, ?, ?, ?, ?, default)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, dto.getName());
			pstat.setInt(2, dto.getKor());
			pstat.setInt(3, dto.getEng());
			pstat.setInt(4, dto.getMath());

			int result = pstat.executeUpdate();

			con.commit();

			return result;
		}
	}
	
	public int delete(int sid) throws Exception {
		String sql = "delete from student where sid=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setInt(1, sid);

			int result = pstat.executeUpdate();

			con.commit();

			return result;
		}
	}
	
	public int update(StdDTO dto) throws Exception {
		String sql = "update student set name=?, kor=?, eng=?, math=?, where sid=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, dto.getName());
			pstat.setInt(2, dto.getKor());
			pstat.setInt(3, dto.getEng());
			pstat.setInt(4, dto.getMath());
			pstat.setInt(5, dto.getSid());

			int result = pstat.executeUpdate();

			con.commit();

			return result;
		}
	}
	
	public List<StdDTO> selectAll() throws Exception {
		String sql = "select rank() over(order by kor+eng+math desc) rank, sid,name,kor,eng,math from student";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			try (ResultSet rs = pstat.executeQuery();) {
				List<StdDTO> list = new ArrayList();

				while (rs.next()) {
					int rank = rs.getInt("rank");
					int sid = rs.getInt("sid");
					String name = rs.getString("name");
					int kor = rs.getInt("kor");
					int eng = rs.getInt("eng");
					int math = rs.getInt("math");
					

					StdDTO dto = new StdDTO(rank, sid, name, kor, eng, math, null);
					list.add(dto);
				}
				return list;
			}
		}
	}
	public List<StdDTO> search(String name) throws Exception{
		
		String sql = "select rank() over(order by kor+eng+math desc) rank, sid,name,kor,eng,math from student where name=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, name);
			try(ResultSet rs = pstat.executeQuery()){
				List<StdDTO> list = new ArrayList<>();
				while(rs.next()) {
					StdDTO dto = new StdDTO();
					dto.setRank(rs.getInt("rank"));
					dto.setSid(rs.getInt("sid"));
					dto.setName(rs.getString("name"));
					dto.setKor(rs.getInt("kor"));
					dto.setEng(rs.getInt("eng"));
					dto.setMath(rs.getInt("math"));
					
					list.add(dto);
				}
				return list;
			}
		}
	}
}
