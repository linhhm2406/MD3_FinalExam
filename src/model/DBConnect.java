package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    public static Connection getConnection() {
        Connection conn = null;

        String url= "jdbc:mysql://localhost:3306/finalexammod3?&useSSL=false";
        String username = "root";
        String password = "sysadmin1234$";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);

            System.out.println("Connected successfully");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Error connection " + ex);
        }
        return conn;
    }

    public static void main(String[] args) {
        DBConnect.getConnection();
    }
}
