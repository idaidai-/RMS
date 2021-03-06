package Ctroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BL.AppBL;
import BL.RecBL;
import Entities.Report;

public class RecCtl extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		if (action.equals("newJO")) {
			int r;
			String joid = request.getParameter("joid");
			String opendate = request.getParameter("opendate");
			String position = request.getParameter("position");
			String deadline = request.getParameter("deadline");
			String location = request.getParameter("location");
			String mail = request.getParameter("mail");
			String rid = request.getParameter("rid");
			String salary = request.getParameter("salary");
			String number = request.getParameter("number");
			String experience = request.getParameter("experience");
			String language = request.getParameter("language");
			String description = request.getParameter("description");
			String technique = request.getParameter("technique");
			r = new RecBL().newJO(joid, opendate, position, deadline, location,
					mail, rid, number, experience, language, description,
					salary, technique);
			PrintWriter out = response.getWriter();
			if (r != 0) {
				out.println("<script>");
				out.println("alert('Create jobopening successful!');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('Sorry,"+joid+" already exist!');");
				out.println("history.back();");
				out.println("</script>");
			}
		} else if (action.equals("searchCV")) {
			String school = request.getParameter("school");
			String major = request.getParameter("major");
			String sex = request.getParameter("sex");
			String location = request.getParameter("location");
			String technique = request.getParameter("technique");
			String language = request.getParameter("language");
			String education = request.getParameter("education");
			String joid = request.getParameter("joid");
			List cvs = new RecBL().searchCV(school, major, sex, location,
					technique, language, education,joid);
			request.setAttribute("cvs", cvs);
			request.getRequestDispatcher("../user/manageCV.jsp").forward(
					request, response);

		} else if (action.equals("checkApplication")) {
			List apps = new RecBL().checkApp();
			request.setAttribute("apps", apps);
			request.getRequestDispatcher("../user/CheckApplication.jsp")
					.forward(request, response);
		} else if (action.equals("updateApp")) {
			String cid = request.getParameter("cid");
			String joid = request.getParameter("joid");
			String status = request.getParameter("status");
			int r = new RecBL().updateApp(cid, joid, status);
			if (r != 0) {
				List apps = new RecBL().checkApp();
				request.setAttribute("apps", apps);
				request.getRequestDispatcher("../user/CheckApplication.jsp")
						.forward(request, response);
			}
		} else if (action.equals("makeRep")) {
			System.out.println("***** in RecCtl/makeReport*****");
			List reps = null;
			Report rep = new Report();
			String kind = request.getParameter("range");
			String jbid = request.getParameter("jb_id");
			String rid = request.getParameter("rid");
			String export = request.getParameter("export");
			String format = null;
			if("export_on".equals(export)){
				format = request.getParameter("format");
			}else{
				format = null;
			}
			if(kind.equals("all")){
				rep = new RecBL().makeReport(kind,rid,format);
			}else {
				rep = new RecBL().makeReport(kind,jbid,format);
			}
			request.setAttribute("rep", rep);
			request.getRequestDispatcher("../user/CreateReport.jsp").forward(
					request, response);
		}
	}
}
