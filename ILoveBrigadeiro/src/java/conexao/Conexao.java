package conexao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
    private final static String url = "jdbc:mysql://localhost:3306/iloveBrigadeiro?useSSL=false";
    private final static String user = "root";
    private final static String password = "";
    private static final String driver = "com.mysql.cj.jdbc.Driver";

    public static Connection conectar() {
        Connection con = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, user, password);
            return con;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
