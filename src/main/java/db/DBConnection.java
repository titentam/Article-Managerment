package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection conn;

    public static Connection getConn() {

        try {

            //step:1 for connection - load the driver class
            Class.forName("com.mysql.cj.jdbc.Driver");

            //step:2- create a connection

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/article_manager","root","duy432003");
            //conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/articlemanagement","root","");
            //  a ti ne

        } catch (Exception e) {
            e.printStackTrace();
            // TODO: handle exception
        }

        return conn;
    }
}
