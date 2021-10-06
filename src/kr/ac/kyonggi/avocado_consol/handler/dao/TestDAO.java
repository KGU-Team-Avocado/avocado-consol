package kr.ac.kyonggi.avocado_consol.handler.dao;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kr.ac.kyonggi.avocado_consol.common.sql.Config;
import kr.ac.kyonggi.avocado_consol.handler.dto.TestDTO;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TestDAO {
    public static TestDAO it;

    public static TestDAO getInstance(){
        if(it==null)
            it = new TestDAO();
        return it;
    }

    public ArrayList<TestDTO> getTest(){
        List<Map<String,Object>> listOfMaps = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            listOfMaps = queryRunner.query(conn, "SELECT * FROM `test`", new MapListHandler());
        }
        catch (SQLException se){
            se.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        ArrayList<TestDTO> selectedList = gson.fromJson(gson.toJson(listOfMaps), new TypeToken<List<TestDTO>>(){
        }.getType());
        return selectedList;
    }

}