package com.ktds.crmai.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Properties;

import com.ktds.crmai.util.DateTool;
import com.ktds.crmai.vo.AiStaging;
import com.ktds.crmai.vo.CampaignData;

import oracle.jdbc.OracleConnection;
import sun.net.www.content.text.plain;

public class TableDAO {
	
	String jdbc_driver = "oracle.jdbc.OracleDriver";
	String db_url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String db_id = "aiadm";
	String db_pw = "aiadm1";
	Properties props = new Properties();
	
	Connection conn = null;
	
	public TableDAO() {
		try {
			Class.forName(jdbc_driver);
			props.setProperty("user", db_id);
			props.setProperty("password", db_pw);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private Connection getConn() throws SQLException, ClassNotFoundException {
		Connection conn = DriverManager.getConnection(db_url, props);
				
		if (conn != null  && conn.isValid(1)) {
		     return conn;
		}else {
			System.out.println("### 접속 실패 컨넥션을 다시 가져 온다.");
			conn = DriverManager.getConnection(db_url, props);
		}
		return conn;
	} 

	/*
	 * Name : 캠페인 학습데이터 목록 가져오기
	 * 
	 * 
	 */
	public ArrayList<CampaignData> selectCampaign(String type){
		Statement stmt = null;
		Connection conn = null;
		ArrayList<CampaignData> list = new ArrayList<>();
		StringBuilder sb = new StringBuilder();
		
		sb.append("select cam_id, adm_id, cam_itype, cam_ifilename, cam_otype, cam_ofilename, cam_rtype, cam_rfilename from ai_campaign where ");
		
		if(type.equals("cam_itype")) {
			sb.append("cam_itype in (1, 3)");
		}else if(type.equals("cam_otype")) {
			sb.append("cam_otype in (1, 3)");
		}else if(type.equals("cam_rtype")){
			sb.append("cam_rtype in (1, 3)");
		}
		
		try {
			conn = getConn();
			
			// 드라이버 연결위한 준비  conn객체 생성.
			stmt = conn.createStatement();

		   //5. sql문을 DB에 전송(실행)
		   ResultSet rs = stmt.executeQuery(sb.toString()); // 결과 테이블 반환
		   
		   
		   while(rs.next()){// memo 테이블 1번 레코드 직전에 위치해서 next가 다음 칸으로 이동(첫번째 행을 가리킴)
			   CampaignData data = new CampaignData();
			   // 메모 테이블에 컬럼 데이터를 뽑아오기
			   int    cam_id        =  rs.getInt("cam_id");           // 캠페인ID
			   String adm_id        =  rs.getString("adm_id");        // 등록자ID
			   String cam_itype     =  rs.getString("cam_itype");     // 캠페인진행현황
			   String cam_ifilename =  rs.getString("cam_ifilename"); // 캠페인 학습데이터 경로
			   String cam_otype     =  rs.getString("cam_otype");     // 캠페인진행현황
			   String cam_ofilename =  rs.getString("cam_ofilename"); // 캠페인 학습데이터 경로
			   String cam_rtype     =  rs.getString("cam_rtype");     // 캠페인진행현황
			   String cam_rfilename =  rs.getString("cam_rfilename"); // 캠페인 학습데이터 경로
			   
			   data.setCam_id(cam_id);
			   data.setAdm_id(adm_id);
			   data.setCam_itype(cam_itype);
			   data.setCam_ifilename(cam_ifilename);
			   data.setCam_otype(cam_otype);
			   data.setCam_ofilename(cam_ofilename);
			   data.setCam_rtype(cam_rtype);
			   data.setCam_rfilename(cam_rfilename);
			   
			   list.add(data);
		   }
			
		}catch (ClassNotFoundException e) {
			System.err.println("Oracle Driver not Found!");
		} catch(SQLException e) {
			System.err.println("selectCampaign SQL 오류 :: " + e.getMessage() + " :: " + sb.toString());
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
	public int updateCampaign(ArrayList<CampaignData> list, String type, int type_num, String msg){
		Statement stmt = null;
		Connection conn = null;
		StringBuilder update_campaign =  new StringBuilder();
		
		int rs = 1;
		int flag = 0;
		
		try {
			conn = getConn();
			
			// 드라이버 연결위한 준비  conn객체 생성.
			stmt = conn.createStatement();

			update_campaign.append("update ai_campaign set ");
			update_campaign.append(type + "=" + type_num);
			
			if(msg != null) {
				update_campaign.append(", cam_msg=" + msg);	
			}
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
			System.err.println("insertData_Pretreatment SQL 오류 :: " + e.getMessage() );
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(final SQLException e) {
				
			}
			return rs;
		}
	}
	

	public int updateCampaign(CampaignData data, String type, int type_num, String cam_msg) {
		Statement stmt = null;
		Connection conn = null;
		StringBuilder update_campaign =  new StringBuilder();
		
		int rs = 1;
		int flag = 0;
		
		try {
			conn = getConn();
			
			// 드라이버 연결위한 준비  conn객체 생성.
			stmt = conn.createStatement();

			update_campaign.append("update ai_campaign set ");
			update_campaign.append(type + "=" + type_num);

			if(type.equals("cam_itype")) {
				update_campaign.append(", cam_icnum=" + data.getIcnum() );
			}
			
			update_campaign.append(", cam_msg='" + cam_msg + "' ");	
			update_campaign.append(" where cam_id = " + data.getCam_id() );
			
			
			System.out.println("update_campaign :: " + update_campaign.toString());
			
		    //sql문을 DB에 전송(실행)
		    rs = stmt.executeUpdate(update_campaign.toString()); // 결과 테이블 반환
		   
			
		}catch (ClassNotFoundException e) {
			System.err.println("Oracle Driver not Found!");
		} catch(SQLException e) {
			System.err.println("insertData_Pretreatment SQL 오류 :: " + e.getMessage() );
		}finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(final SQLException e) {
				
			}
			return rs;
		}
		
	}
	
	public String insertAI_STAGING(CampaignData campaign, ArrayList<AiStaging> arrayList, String tableName, String type){
		Statement stmt = null;
		Connection conn = null;
		String msg = null;
		StringBuilder query_h = new StringBuilder();
		StringBuilder query_b = new StringBuilder();
		
		String query = null;
		AiStaging data;
		try {
			conn = getConn();
			conn.setAutoCommit(false);                        // 오토커밋을 false로 지정한다.
	
			
			//init
			{ 
				query_h.append("insert into " + tableName +"(ST_SEQ, cam_id ," + type);
				query_b.append("values(ST_SEQ_TEST.NEXTVAL, '" + campaign.getCam_id() + "', 4 ");
				
				for(int i = 1; i <= campaign.getIcnum(); i++) {
					query_h.append(",ST_C" + i + " " );
					query_b.append(",?");
				}
				
				query_h.append(") ");
				query_b.append(") ");
			}
			
			query = query_h.toString() + query_b.toString();
			
			//System.out.println("query :: " + query);
			//System.out.println("arrayList.size :: " + arrayList.size());
			
			PreparedStatement pstmt = conn.prepareStatement(query) ;

			
			// 드라이버 연결위한 준비  conn객체 생성.
			stmt = conn.createStatement();
			for(int i = 0; i < arrayList.size(); i++) {
				
				AiStaging temp = arrayList.get(i);
				
				Hashtable<String, String> column = temp.getColumn();
				
				for(int y = 1 ; y <= campaign.getIcnum(); y++) {
					
					//System.out.println(y + " :: " + column.size() + " :: " + column.get("ST_C" + y) );
					pstmt.setString(y, column.get("ST_C" + y));
				}
//				System.out.println(campaign.getIcnum() + " :: " + campaign.getIcnum() + " :: ST_C200 :: " + column.get("ST_C" + campaign.getIcnum()) );
				
                // addBatch에 담기
                pstmt.addBatch();
				
//                // OutOfMemory를 고려하여 만건 단위로 커밋
//                if( (i % 10000) == 0){
//                	
//                	System.out.println("ing_"+i+" :: " + DateTool.getTimestamp() );
//                	
//                    // Batch 실행
//                    pstmt.executeBatch() ;
//                     
//                    // Batch 초기화
//                    pstmt.clearBatch();
//                     
//                    // 커밋
//                    conn.commit() ;
//                }
			}
	        // Batch 실행
            pstmt.executeBatch() ;
             
            // Batch 초기화
            pstmt.clearBatch();
			
			// 커밋
            conn.commit();
						
		}catch (ClassNotFoundException e) {
			System.err.println("Oracle Driver not Found!");
		} catch(SQLException e) {
			System.err.println("insert tableName SQL 오류 :: " + e.getMessage() );
			
			msg = e.getMessage();
		}finally {

			
			try {
				conn.setAutoCommit(true);  // 오토 커밋을 true로 다시 변경한다.

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(final SQLException e) {
				
			}
                       
			return msg;
		}
	}
	
	public String insertAI_STAGING_Real(CampaignData campaign, ArrayList<AiStaging> arrayList){
		Connection conn = null;
		PreparedStatement pstmt = null;
		String msg = null;
		StringBuilder query = new StringBuilder();
		
		try {
			conn = getConn();
			conn.setAutoCommit(false);                        // 오토커밋을 false로 지정한다.
	
			query.append("insert into AI_STAGING_REAL(ST_SEQ, cam_id, st_c1, train_method, predict, succ_prob, fail_prob, result) ");
			query.append("values(?, ?, ?, ?, ?, ?, ?, ?)");

			System.out.println("query :: " + query);
			System.out.println("arrayList.size :: " + arrayList.size());
			
			pstmt = conn.prepareStatement(query.toString()) ;
			
			// 드라이버 연결위한 준비  conn객체 생성.
			for(int i = 0; i < arrayList.size(); i++) {
				
				AiStaging temp = arrayList.get(i);
				
				//System.out.println(i + " :: insertAI_STAGING_Real :: " + temp.toStringReal());
				
				pstmt.setInt(1, temp.getSt_seq());
				pstmt.setInt(2, temp.getCam_id());
				pstmt.setString(3, temp.getSt_c1());
				pstmt.setString(4, temp.getTrain_method());
				
				pstmt.setInt(5, temp.getPredict());
				pstmt.setInt(6, temp.getSucc_prob());
				pstmt.setInt(7, temp.getFail_prob());
				pstmt.setInt(8, temp.getResult());
				
                // addBatch에 담기
                pstmt.addBatch();
				
                // OutOfMemory를 고려하여 만건 단위로 커밋
                if( (i % 10000) == 0){
                	
                	System.out.println("ing_"+i+" :: " + DateTool.getTimestamp() );
                	
                    // Batch 실행
                    pstmt.executeBatch() ;
                     
                    // Batch 초기화
                    pstmt.clearBatch();
                     
                    // 커밋
                    conn.commit() ;
                }
			}
	        // Batch 실행
            pstmt.executeBatch() ;
             
            // Batch 초기화
            pstmt.clearBatch();
			
			// 커밋
            conn.commit();
						
		}catch (ClassNotFoundException e) {
			System.err.println("Oracle Driver not Found!");
		} catch(SQLException e) {
			System.err.println("insertAI_STAGING_Real SQL 오류 :: " + e.getMessage() );
			msg = e.getMessage();
		}catch(Exception e){
			e.printStackTrace();
			
			System.err.println("insertAI_STAGING_Real 오류 :: " + e.getMessage() );
			msg = e.getMessage();
		}finally {
			
			try {
				conn.setAutoCommit(true);  // 오토 커밋을 true로 다시 변경한다.

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			try {
				pstmt.close();
				if(conn != null) conn.close();
			}catch(final SQLException e) {
				e.printStackTrace();
			}
                       
			return msg;
		}
	}

	public void updateLastCnum(CampaignData data, String tableName, String type1) {
		Statement stmt = null;
		Connection conn = null;
		StringBuilder update_staging =  new StringBuilder();
		
		int rs = 1;
		int flag = 0;
		
		try {
			conn = getConn();
			
			// 드라이버 연결위한 준비  conn객체 생성.
			stmt = conn.createStatement();

			update_staging.append("update ( ");
			update_staging.append("select cam_id, st_seq, st_c"+data.getIcnum()+", st_c200 ");			
			update_staging.append("from "+tableName+" t ");	
			update_staging.append("where t.cam_id in ("+data.getCam_id()+") ");
			update_staging.append("and t.st_seq = t.st_seq ");
			update_staging.append(")set ");
			update_staging.append("st_c200 = st_c"+data.getIcnum());
			
			
			System.out.println("update_staging :: " + update_staging.toString());
			
		    //sql문을 DB에 전송(실행)
		    rs = stmt.executeUpdate(update_staging.toString()); // 결과 테이블 반환
		    
		    String delete_query = "update "+tableName+" set st_c" + data.getIcnum()+ " = '' where cam_id = " + data.getCam_id();
		    
		    rs = stmt.executeUpdate(delete_query); // 결과 테이블 반환
		   
			
		}catch (ClassNotFoundException e) {
			System.err.println("Oracle Driver not Found!");
		} catch(SQLException e) {
			System.err.println("insertData_Pretreatment SQL 오류 :: " + e.getMessage() );
		}finally {
			try {
				
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(final SQLException e) {
				
			}
		}
	}

	public void deleteAI_STAGING_Real(CampaignData data) {
		Statement stmt = null;
		Connection conn = null;
		StringBuilder delete_staging =  new StringBuilder();
		
		int rs = 1;
		int flag = 0;
		
		try {
			conn = getConn();
			
			// 드라이버 연결위한 준비  conn객체 생성.
			stmt = conn.createStatement();

			delete_staging.append("delete from ai_staging_real where cam_id = "+ data.getCam_id());
			System.out.println("delete_staging :: " + delete_staging.toString());
			
		    //sql문을 DB에 전송(실행)
		    rs = stmt.executeUpdate(delete_staging.toString()); // 결과 테이블 반환
			
		}catch (ClassNotFoundException e) {
			System.err.println("Oracle Driver not Found!");
		} catch(SQLException e) {
			System.err.println("insertData_Pretreatment SQL 오류 :: " + e.getMessage() );
		}finally {
			try {
				
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(final SQLException e) {
				
			}
		}
		
	}


}
