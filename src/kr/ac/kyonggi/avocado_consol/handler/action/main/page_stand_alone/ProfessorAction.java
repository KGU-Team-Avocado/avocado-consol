package kr.ac.kyonggi.avocado_consol.handler.action.main.page_stand_alone;

import com.google.gson.Gson;
import kr.ac.kyonggi.avocado_consol.common.controller.CustomAction;
import kr.ac.kyonggi.avocado_consol.handler.dao.settings.ProfessorDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProfessorAction extends CustomAction  {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.execute(request,response);
		Gson gson = new Gson();
		String major=request.getParameter("major");
		String num=request.getParameter("num");

	    request.setAttribute("getProfessorlist", gson.toJson(ProfessorDAO.getInstance().getProfessor(major)));

		request.setAttribute("jsp", gson.toJson("professor")); //information.jsp
		return "RequestDispatcher:jsp/page_stand_alone/page_stand_alone.jsp";
	}
}