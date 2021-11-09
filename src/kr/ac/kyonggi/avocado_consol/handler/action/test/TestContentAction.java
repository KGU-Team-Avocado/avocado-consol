package kr.ac.kyonggi.avocado_consol.handler.action.test;

import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import kr.ac.kyonggi.avocado_consol.handler.dao.test.TestDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestContentAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String oid = (String)request.getParameter("oid");
        System.out.println(oid);
        if(oid==null){
            return "RequestDispatcher:jsp/test/test_error.jsp";
        }
        Gson gson = new Gson();
        request.setAttribute("one_test_data", gson.toJson(TestDAO.getInstance().getOneTest(oid)));
        return "RequestDispatcher:jsp/test/test_content.jsp";
    }
}
