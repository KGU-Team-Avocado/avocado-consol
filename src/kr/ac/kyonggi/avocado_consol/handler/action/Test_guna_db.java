package kr.ac.kyonggi.avocado_consol.handler.action;


import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import kr.ac.kyonggi.avocado_consol.handler.dao.TestDAO;
import kr.ac.kyonggi.avocado_consol.handler.dao.TestDAOgg;
import kr.ac.kyonggi.avocado_consol.handler.dto.TestDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


public class Test_guna_db implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
        String data = (String)request.getParameter("name");
        String output = "";

        ArrayList<TestDTO> result = TestDAOgg.getInstance().Testguna(data);

        output += result.get(0).oid+"--";
        output += result.get(0).title+"--";
        output += result.get(0).description+"--";
        output += result.get(0).image_url+"--";

        return output;
    }
}
