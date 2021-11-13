package kr.ac.kyonggi.avocado_consol.handler.dao.with;

import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.sql.Config;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class BbsDAO {
    public static BbsDAO it;


    public static BbsDAO getInstance(){
        if(it==null)
            it = new BbsDAO();
        return it;
    }
    public List<Map<String, Object>> getBbs(){
        List<Map<String,Object>> listOfMaps = null;
//        Gson gson = new Gson();
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            listOfMaps = queryRunner.query(conn, "SELECT * FROM `bbs`", new MapListHandler());
        }
        catch (SQLException se){
            se.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(conn);
        }
//        ArrayList<BbsDTO> selectedList = gson.fromJson(gson.toJson(listOfMaps), new TypeToken<List<BbsDTO>>(){}.getType());
        return listOfMaps;
    }
}