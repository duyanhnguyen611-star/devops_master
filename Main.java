import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) {
        try {
            System.out.println("1. Ung dung Java dang khoi dong...");
            // Ngu cho 15 giay de chac chan chiec hop MySQL da khoi dong xong hoan toan
            Thread.sleep(15000); 

            // Goi dung ten 'he_thong_db' trong mang noi bo cua Docker
            String url = "jdbc:mysql://he_thong_db:3306/du_lieu_khach_hang?useSSL=false&allowPublicKeyRetrieval=true";
            String user = "root";
            String password = "matkhau_sieu_bao_mat";

            System.out.println("2. Dang go cua Database...");
            Connection conn = DriverManager.getConnection(url, user, password);
            
            System.out.println("3. Ket noi thanh cong! Dang viet du lieu...");
            Statement stmt = conn.createStatement();
            
            // Tao bang neu chua co
            stmt.executeUpdate("CREATE TABLE IF NOT EXISTS khach_hang (id INT AUTO_INCREMENT PRIMARY KEY, ten VARCHAR(255))");
            
            // Them mot dong du lieu
            stmt.executeUpdate("INSERT INTO khach_hang (ten) VALUES ('Khach hang VIP tu he thong Java Dockerized!')");
            
            System.out.println("4. Hoan thanh! Hay kiem tra tren Adminer.");
        } catch (Exception e) {
            System.out.println("Loi ket noi: " + e.getMessage());
        }
    }
}
