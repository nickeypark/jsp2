package common;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConTest {
	public static void main(String[] args) {
		String url = "jdbc:mysql://localhost:3306/jsp_study";
		String id = "root";
		String pwd = "0lrjsahfmrpTwl";
		Connection con;
		Statement st;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(url,id,pwd);
			System.out.println("연결성공");
			st = con.createStatement();
			ResultSet rs= st.executeQuery("select * from user");
			while(rs.next()) {
				String user_no = rs.getString("user_no");
				String user_id = rs.getString("id");
				String name = rs.getString("name");
				System.out.println("번호 : "+ user_no +" 아이디 : "+ user_id +" 이름 : "+name );
			}
		} catch (ClassNotFoundException e){
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
