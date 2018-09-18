package com.ktds.crmai.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ktds.crmai.util.DateTool;
import com.ktds.crmai.vo.AiStagingTrain;
import com.ktds.crmai.vo.CampaignData;
import com.ktds.crmai.vo.TableMake_Query;

public class TableDAO {
	
	private String select_campaign = "select cam_id, adm_id, cam_itype, cam_ifilename from ai_campaign where cam_itype in (1, 3)";
	
	private Statement stmt;
	
	private Connection getConn() throws SQLException, ClassNotFoundException {
		String jdbc_driver = "oracle.jdbc.OracleDriver";
		String db_url = "jdbc:oracle:thin:@crmai.iptime.org:1521:xe";
		String db_id = "aiadm";
		String db_pw = "aiadm";

		Class.forName(jdbc_driver);
		Connection conn = DriverManager.getConnection(db_url, db_id, db_pw);
		return conn;
	} 

	public String create_table(TableMake_Query query){
		Connection conn = null;
		String msg = null;
		try {
			conn = getConn();

			// 드라이버 연결위한 준비  conn객체 생성.
			stmt = conn.createStatement();

			String sql = query.toString();
			ResultSet rs = stmt.executeQuery(sql);
			
		}catch (ClassNotFoundException e) {
			System.err.println("Oracle Driver not Found!");
		} catch(SQLException e) {
			System.err.println("create_table SQL 오류 :: " + e.getMessage() + " :: " + query);
			
			msg = e.getMessage();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(final SQLException e) {
				
			}
			return msg;
		}
	}
	
	
	public String insertData_Pretreatment(ArrayList<String> list){
		Connection conn = null;
		String query = null;
		String msg = null;
		try {
			conn = getConn();
			
			// 드라이버 연결위한 준비  conn객체 생성.
			stmt = conn.createStatement();

			for(int i = 0; i < list.size(); i++) {
				
				query = list.get(i);
				
				stmt.executeUpdate(query);
				
			}
			
			
		}catch (ClassNotFoundException e) {
			System.err.println("Oracle Driver not Found!");
		} catch(SQLException e) {
			System.err.println("insertData_Pretreatment SQL 오류 :: " + e.getMessage() + " :: " + query);
			
			msg = e.getMessage();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(final SQLException e) {
				
			}
			return msg;
		}
	}
	
	

	/*
	 * Name : 캠페인 학습데이터 목록 가져오기
	 * 
	 * 
	 */
	public ArrayList<CampaignData> selectCampaign(){
		Connection conn = null;
		ArrayList<CampaignData> list = new ArrayList<>();
		
		try {
			conn = getConn();
			
			// 드라이버 연결위한 준비  conn객체 생성.
			stmt = conn.createStatement();

		   //5. sql문을 DB에 전송(실행)
		   ResultSet rs = stmt.executeQuery(select_campaign); // 결과 테이블 반환
		   
		   
		   while(rs.next()){// memo 테이블 1번 레코드 직전에 위치해서 next가 다음 칸으로 이동(첫번째 행을 가리킴)
			   CampaignData data = new CampaignData();
			   // 메모 테이블에 컬럼 데이터를 뽑아오기
			   int    cam_id        =  rs.getInt("cam_id");           // 캠페인ID
			   String adm_id        =  rs.getString("adm_id");        // 등록자ID
			   String cam_itype     =  rs.getString("cam_itype");     // 캠페인진행현황
			   String cam_ifilename =  rs.getString("cam_ifilename"); // 캠페인 학습데이터 경로
			   
			   data.setCam_id(cam_id);
			   data.setAdm_id(adm_id);
			   data.setCam_itype(cam_itype);
			   data.setCam_ifilename(cam_ifilename);
			   
			   list.add(data);
		   }
			
		}catch (ClassNotFoundException e) {
			System.err.println("Oracle Driver not Found!");
		} catch(SQLException e) {
			System.err.println("insertData_Pretreatment SQL 오류 :: " + e.getMessage() + " :: " + select_campaign);
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(final SQLException e) {
				
			}
			return list;
		}
	}
	
	
	/*
	 * Name : 캠페인 학습데이터 목록 가져오기
	 * 
	 * 
	 */
	public int updateCampaign(ArrayList<CampaignData> list, int cam_itype){
		Connection conn = null;
		StringBuilder update_campaign =  new StringBuilder();
		
		int rs = 1;
		int flag = 0;
		
		try {
			conn = getConn();
			
			// 드라이버 연결위한 준비  conn객체 생성.
			stmt = conn.createStatement();

			update_campaign.append("update ai_campaign set cam_itype = ");
			update_campaign.append(cam_itype);
			update_campaign.append(" where cam_id in ");
			
			update_campaign.append("(");
			for(CampaignData data : list) {
				
				if(flag == 1) {
					update_campaign.append("," + data.getCam_id());	
				}else {
					update_campaign.append(data.getCam_id());
					flag = 1;
				}
				
			}
			update_campaign.append(")");
			
			System.out.println("update_campaign :: " + update_campaign.toString());
			
		    //sql문을 DB에 전송(실행)
		    rs = stmt.executeUpdate(update_campaign.toString()); // 결과 테이블 반환
		   
			
		}catch (ClassNotFoundException e) {
			System.err.println("Oracle Driver not Found!");
		} catch(SQLException e) {
			System.err.println("insertData_Pretreatment SQL 오류 :: " + e.getMessage() + " :: " + select_campaign);
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(final SQLException e) {
				
			}
			return rs;
		}
	}
	
	
	/*
	 * Name : 캠페인 학습데이터 목록 가져오기
	 * 
	 * 
	 */
	public int updateCampaign_end(CampaignData campaign, int cam_itype){
		Connection conn = null;
		StringBuilder update_campaign =  new StringBuilder();
		
		int rs = 1;
		int flag = 0;
		
		try {
			conn = getConn();
			
			// 드라이버 연결위한 준비  conn객체 생성.
			stmt = conn.createStatement();

			update_campaign.append("update ai_campaign set ");
			update_campaign.append("cam_itype = " + cam_itype);
			update_campaign.append(", cam_icnum = " + campaign.getIcnum());
			update_campaign.append(" where cam_id in ");
			
			update_campaign.append("(");
			update_campaign.append(campaign.getCam_id());
			update_campaign.append(")");
			
			System.out.println("update_campaign :: " + update_campaign.toString());
			
		    //sql문을 DB에 전송(실행)
		    rs = stmt.executeUpdate(update_campaign.toString()); // 결과 테이블 반환
		   
			
		}catch (ClassNotFoundException e) {
			System.err.println("Oracle Driver not Found!");
		} catch(SQLException e) {
			System.err.println("insertData_Pretreatment SQL 오류 :: " + e.getMessage() + " :: " + select_campaign);
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(final SQLException e) {
				
			}
			return rs;
		}
	}
	
	public String insertAI_STAGING_TRAIN(ArrayList<AiStagingTrain> arrayList){
		Connection conn = null;
		String msg = null;
		AiStagingTrain query = null;
		try {
			conn = getConn();
			
			// 드라이버 연결위한 준비  conn객체 생성.
			stmt = conn.createStatement();
			for(int i = 0; i < arrayList.size(); i++) {
				
				query = arrayList.get(i);
				
				stmt.executeUpdate(query.toQuery());
				
				if(i % 1000 == 0) {
					System.out.println(query.getCam_id() + " ing"+i+" :: " + DateTool.getTimestamp());
				}
				
			}
						
		}catch (ClassNotFoundException e) {
			System.err.println("Oracle Driver not Found!");
		} catch(SQLException e) {
			System.err.println("insertData_Pretreatment SQL 오류 :: " + e.getMessage() + " :: " + query.toQuery());
			
			msg = e.getMessage();
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(final SQLException e) {
				
			}
			return msg;
		}
	}

}
