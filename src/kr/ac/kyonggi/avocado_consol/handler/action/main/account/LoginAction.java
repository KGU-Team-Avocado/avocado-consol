package kr.ac.kyonggi.avocado_consol.handler.action.main.account;

import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.Action;
import kr.ac.kyonggi.avocado_consol.common.controller.LoginManager;
import kr.ac.kyonggi.avocado_consol.handler.dao.user.UserDAO;
import kr.ac.kyonggi.avocado_consol.handler.dto.UserDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

public class LoginAction implements Action {


    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        LoginManager manager = LoginManager.getInstance();
        String id = request.getParameter("id");
        String password = request.getParameter("password_hash");
        UserDAO dao = UserDAO.getInstance();
        UserDTO it = dao.getUser(id); //id에 따른 유저 정보를 일단 받아옴. (아이디가 일치하지 않으면 null을 갖게됨)
        HttpSession session = request.getSession();
        Gson gson = new Gson();

        if(it!=null) { //조회한 id가 존재한다면
            if (it.password.equals(password)) { //조회한 id의 비밀번호가 입력한 비밀번호와 일치한다면
                if (manager.isUsing(id)) { //접속중이라면
                    manager.removeSession(id); //접속중인 세션 제거
                }
//            System.out.println("로그인 성공");
                manager.setSession(request.getSession(), id); //세션 설정하기
                UserDTO type = dao.getType(it.type);
                dao.whoIsLogIn(id);
//                LogDAO.getInstance().insertLog(it.id,it.name,it.type, new Date(),"로그인");
                session.setAttribute("user", gson.toJson(it));
                session.setAttribute("type", gson.toJson(type));
//                session.setAttribute("miss", 0);
                response.sendRedirect("/"); //요청이 끝나면 메인페이지로 이동시켜줌 (깔끔한 URL 정리를 위해 이걸로 대체함)
                return "";
            }
        }
        return "RequestDispatcher:jsp/main/account/login.jsp";
    }

}