package kr.ac.kyonggi.avocado_consol.handler.action.test;


import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import kr.ac.kyonggi.avocado_consol.handler.dao.test.TestDAOgg;
import kr.ac.kyonggi.avocado_consol.handler.dto.TestDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;


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
