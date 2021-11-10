package kr.ac.kyonggi.avocado_consol.handler.dao.with;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kr.ac.kyonggi.avocado_consol.common.sql.Config;
import kr.ac.kyonggi.avocado_consol.handler.dao.with.BbsDAO;
import kr.ac.kyonggi.avocado_consol.handler.dto.BbsDTO;
import kr.ac.kyonggi.avocado_consol.handler.dto.TestDTO;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BbsDAO {
    public static BbsDAO it;

    public static BbsDAO getInstance() {
        if (it == null)
            it = new BbsDAO();
        return it;
    }

    public ArrayList<BbsDTO> getBbs(){
        List<Map<String,Object>> listOfMaps = null;
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
        Gson gson = new Gson();
        ArrayList<BbsDTO> selectedList = gson.fromJson(gson.toJson(listOfMaps), new TypeToken<List<BbsDTO>>(){
        }.getType());
        System.out.print(listOfMaps);
        System.out.print(selectedList);
        return selectedList;
    }
}