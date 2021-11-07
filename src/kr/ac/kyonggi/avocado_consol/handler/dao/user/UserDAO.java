package kr.ac.kyonggi.avocado_consol.handler.dao.user;

import kr.ac.kyonggi.avocado_consol.common.sql.Config;
import kr.ac.kyonggi.avocado_consol.handler.dao.TestDAO;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.Connection;
import java.sql.SQLException;

public class UserDAO {
    public static UserDAO it;

    public static UserDAO getInstance(){
        if(it==null)
            it = new UserDAO();
        return it;
    }
    public String addUser(String data) {
        String [] arr = data.split("-/-/-"); // 받아온 한 줄짜리 데이터를 배열로 쪼개기
        String id = arr[0];
        String pw = arr[1];
        String name = arr[2];
        String Birthday = arr[3];
        String gender = arr[4];
        String email = arr[5];
        String phone = arr[6];
        String type = arr[7];
        String image = arr[8];
        String home = arr[9];
        String time = arr[10];
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.update(conn,
                    "INSERT INTO `user`(id, password, name, birthday, gender, email, phone, type, image_url, home) " +
                            "VALUES (?,?,?,?,?,?,?,?,?,?)", id,pw,name,Birthday,gender,email,phone,type,image,home);
        }
        catch (SQLException se){
            se.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(conn);
        }
        return "회원가입에 성공하였습니다.";
    }
}
