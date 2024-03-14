package file;

import java.sql.Connection;
import java.sql.DriverManager;

public class FileDAO {

    private Connection conn;

    public FileDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/file";
            String dbID = "root";
            String dbPassword = "12345";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
