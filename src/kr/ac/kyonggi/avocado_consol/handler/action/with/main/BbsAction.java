package kr.ac.kyonggi.avocado_consol.handler.action.with.main;

import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import kr.ac.kyonggi.avocado_consol.handler.dao.test.TestDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BbsAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String mode = request.getParameter("mode");
        System.out.println(mode);

        if(mode==null){
            mode="list";
        }


        if(mode.equals("view")){
            return "RequestDispatcher:jsp/with/bbs/view.jsp";
        }
        else if(mode.equals("write")){
            return "RequestDispatcher:jsp/with/bbs/write.jsp";
        }
        else if(mode.equals("modify")){
            return "RequestDispatcher:jsp/with/bbs/modify.jsp";
        }
        else {
            return "RequestDispatcher:jsp/with/bbs/list.jsp";
        }
    }

}
