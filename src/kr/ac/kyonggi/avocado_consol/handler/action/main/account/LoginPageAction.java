package kr.ac.kyonggi.avocado_consol.handler.action.main.account;

import kr.ac.kyonggi.avocado_consol.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginPageAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(); //Session에 있는 정보로 뭔가 해야할 때 사용
        String user = (String)session.getAttribute("user");
        if(user==null){
            return "RequestDispatcher:jsp/main/account/login.jsp";
        }
        else {
            return "RequestDispatcher:jsp/main/main.jsp";
        }
    }
}
