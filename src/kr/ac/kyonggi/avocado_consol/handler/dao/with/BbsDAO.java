package kr.ac.kyonggi.avocado_consol.handler.dao.with;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kr.ac.kyonggi.avocado_consol.common.sql.Config;
import kr.ac.kyonggi.avocado_consol.handler.dto.BbsDTO;
import kr.ac.kyonggi.avocado_consol.handler.dto.TeamDTO;
import kr.ac.kyonggi.avocado_consol.handler.dto.TestDTO;
import kr.ac.kyonggi.avocado_consol.handler.dto.UserDTO;
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


    public BbsDTO getOneBbs(String id){
        List<Map<String,Object>> listOfMaps = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            listOfMaps = queryRunner.query(conn, "SELECT * FROM `bbs` WHERE id=?", new MapListHandler(),id);
            System.out.println(listOfMaps);
        }
        catch (SQLException se){
            se.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        System.out.println("ddd");
        ArrayList<BbsDTO> selectedList = gson.fromJson(gson.toJson(listOfMaps), new TypeToken<List<BbsDTO>>(){
        }.getType());
        if(selectedList.size()>0) {
            return selectedList.get(0);
        }
        else
            return null;
    }


}