package file;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;

public class FileDAO {

    private Connection conn;

    public FileDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/file";
            String dbID = "webdb";
            String dbPassword = "1234";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int upload(String fileName , String fileRealName) {
        PreparedStatement pstmt = null;
        String SQL = "INSERT INTO file values(? , ?, 0)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, fileName);
            pstmt.setString(2, fileRealName);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int hit(String fileRealName) {
        String SQL = "UPDATE file SET downloadCount = downloadCount + 1 " +
                "WHERE fileRealName = ?";
        PreparedStatement pstmt = null;

        try {
            pstmt= conn.prepareStatement(SQL);
            pstmt.setString(1,fileRealName);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public ArrayList<FileDTO> getList() {
        String SQL = "SELECT fileName , fileRealName , downloadCount FROM file";
        ArrayList<FileDTO> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                FileDTO file = new FileDTO(rs.getString(1),rs.getString(2),rs.getInt(3));
                list.add(file);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
