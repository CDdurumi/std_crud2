package controler;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StdDAO;
import dto.StdDTO;


@WebServlet("*.std")
public class Std_servlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");//한글 안깨지게
		request.setCharacterEncoding("UTF-8");// post 방식 한글 안깨지게
		
		String uri = request.getRequestURI();
		StdDAO dao = StdDAO.getInstance();
		try {
			if(uri.equals("/insert.std")) {
				String name = request.getParameter("name");
				int kor = Integer.parseInt(request.getParameter("kor"));
				int eng = Integer.parseInt(request.getParameter("eng"));
				int math = Integer.parseInt(request.getParameter("math"));

				int result = dao.insert(new StdDTO(0,0,name,kor,eng,math,null));
				response.sendRedirect("/index.jsp");

			}else if(uri.equals("/studentList.std")) {
				List<stdDTO> list = dao.selectAll();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/list/studentList.jsp").forward(request, response);	
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
