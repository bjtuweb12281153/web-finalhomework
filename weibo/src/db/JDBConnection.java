package db;

import java.sql.*;

//操作数据库公用方法
public class JDBConnection {
	
	private final String url = "jdbc:mysql://localhost:3306/weibo?characterEncoding=UTF-8";
    private final String userName = "root";
    private final String password = "root";
    private Connection con = null;
    
	//通过构造方法加载数据库驱动
    static {
        try {              
        	Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception ex) {
            System.out.println("数据库加载失败");
        }
    }
    
    //创建数据库连接
    public boolean creatConnection() {
        try {
            con = DriverManager.getConnection(url, userName, password);
            con.setAutoCommit(true);

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("creatConnectionError!");
        }
        return true;
    }
    
    //对数据库的增加、修改和删除的操作
    public boolean executeUpdate(String sql) {
         if (con == null) {
            creatConnection();
        }
        try {
            Statement stmt = con.createStatement();
            int iCount = stmt.executeUpdate(sql);
            System.out.println("操作成功，所影响的记录数为:" + String.valueOf(iCount));
		    return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
		    return false;
        }   
    }
    
    //执行查询操作
    public ResultSet executeQuery(String sql) {
        ResultSet rs;
        try {
            if (con == null) {
                creatConnection();
            }
            Statement stmt = con.createStatement();
            try {
                rs = stmt.executeQuery(sql);
            } catch (SQLException e) {
                System.out.println(e.getMessage());
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("executeQueryError!");
            return null;
        }
        return rs;
    }


    public static void main(String[] args) {
		new JDBConnection().executeQuery("select * from user;");
	}
}
