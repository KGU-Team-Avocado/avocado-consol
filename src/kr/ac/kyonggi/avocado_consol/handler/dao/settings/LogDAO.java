package kr.ac.kyonggi.avocado_consol.handler.dao.settings;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kr.ac.kyonggi.avocado_consol.common.sql.Config;
import kr.ac.kyonggi.avocado_consol.handler.dto.settings.LogDTO;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class LogDAO {
    public static LogDAO it;

    public static LogDAO getInstance() { //인스턴스 생성
        if (it == null)
            it = new LogDAO();
        return it;
    }

    public ArrayList<LogDTO> getAllLog(){
        List<Map<String, Object>> listOfMaps = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();

            listOfMaps = queryRunner.query(conn, "SELECT * FROM log ORDER BY id DESC;", new MapListHandler());
//            System.out.println(listOfMaps);
        } catch(Exception se) {
            se.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        ArrayList<LogDTO> selected = gson.fromJson(gson.toJson(listOfMaps), new TypeToken<List<LogDTO>>() {}.getType());

        return selected;
    }

    public String insertLog(String user_id, String user_name, String user_type, Date log_time, String log_type){
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.update(conn,"delete from log where log_time < DATE_FORMAT( CURDATE() + INTERVAL -1 MONTH , '%Y/%m/%d' )");
            queryRunner.update(conn,"INSERT INTO log(user_id, user_name, user_type, log_time, log_type) VALUE(?,?,?,?,?);", user_id,user_name,user_type, log_time, log_type);
        } catch(SQLException se) {
            se.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return "success";
    }
}
