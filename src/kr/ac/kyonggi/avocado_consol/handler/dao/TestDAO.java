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
    public ArrayList<TestDTO> getOneTest(String oid){
        List<Map<String,Object>> listOfMaps = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            listOfMaps = queryRunner.query(conn, "SELECT * FROM `test`  WHERE oid = ?", new MapListHandler(), oid);
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

    public String deleteData(String data) {
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.update(conn, "DELETE FROM `test` WHERE oid = ?", data);
        }
        catch (SQLException se){
            se.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(conn);
        }
        return "삭제성공";
    }

    public String addData(String data) {
        String [] arr = data.split("-/-/-"); // 받아온 한 줄짜리 데이터를 배열로 쪼개기
        String title = arr[0];
        String description = arr[1];
        String image_url = arr[2];
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.update(conn, "INSERT INTO `test`(title, description, image_url) VALUES (?,?,?)", title,description,image_url);
        }
        catch (SQLException se){
            se.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(conn);
        }
        return "데이터 추가가 되었습니다.";
    }
    public String addtuesdayData(String data) {
        String [] arr = data.split("-/-/-"); // 받아온 한 줄짜리 데이터를 배열로 쪼개기
        String title = arr[0];
        String description = arr[1];
        String image_url = arr[2];
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.update(conn, "INSERT INTO `test`(title, description, image_url) VALUES (?,?,?)", title,description,image_url);
        }
        catch (SQLException se){
            se.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(conn);
        }
        return "끝!";
    }

    public String modifyData(String data) {
        String [] arr = data.split("-/-/-"); // 받아온 한 줄짜리 데이터를 배열로 쪼개기
        String oid = arr[0];
        String title = arr[1];
        String description = arr[2];
        String image_url = arr[3];
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.update(conn, "UPDATE `test`SET title=? , description=? , image_url=? WHERE oid=?", title,description,image_url,oid);
        }
        catch (SQLException se){
            se.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(conn);
        }
        return "데이터가 정상적으로 수정되었습니다.";
    }

    public String guroTest(String data) {
        //title--dis--img
        String arr[] = data.split("--");
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.update(conn, "INSERT INTO `test`(title, description, image_url) VALUES (?,?,?)", arr[0],arr[1],arr[2]);
        }
        catch (SQLException se){
            se.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(conn);
        }
        return "success";
    }

    public String deleteGuro(String data) {
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.update(conn, "DELETE FROM `test` WHERE oid = ?", data);
        }
        catch (SQLException se){
            se.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(conn);
        }
        return "success";
    }
    public String deleteTuesdayData(String data) {
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.update(conn, "DELETE FROM `test` WHERE oid = ?", data);
        }
        catch (SQLException se){
            se.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(conn);
        }
        return "삭제완료";
    }
}
