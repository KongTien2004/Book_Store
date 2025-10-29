package vn.edu.hcmuaf.fit.bookstore.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class DBConnect {
    static Connection conn;
    static String url = "jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.post() + "/" + DBProperties.dbname() + "?" + DBProperties.option();

    public static Statement getStatement() {
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, DBProperties.username(), DBProperties.password());
            }
            return conn.createStatement();

        } catch (SQLException e) {
            return null;
        } catch (ClassNotFoundException e) {
            return null;
        }
    }
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Đang kết nối CSDL với URL: " + url);
            conn = DriverManager.getConnection(url, DBProperties.username(), DBProperties.password());
        } catch (ClassNotFoundException e) {
            System.err.println("Lỗi: Không tìm thấy Driver MySQL");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Lỗi: Không thể kết nối đến cơ sở dữ liệu");
            e.printStackTrace();
        }
        return conn;
    }


    public static void main(String[] args) {
        try (Connection conn = getConnection()) {
            if (conn != null) {
                System.out.println("-> Kết nối thành công!");
            } else {
                System.out.println("-> Kết nối thất bại!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
