package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import bean.MessageBean;

/*
 * 所有操作都在这里响应
 */
public class Message extends HttpServlet {

	//入口方法
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		if("1".equals(type)){
			addMessage(request,response);//添加我的动态
		}
	}

	

	

	//显示朋友的动态消息
	private void addMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//从session中取得当前登录用户的id
		String id = request.getSession().getAttribute("userid").toString();
		String con = request.getParameter("con");
		
		MessageBean bean  = new MessageBean();
		bean.setUserid(Integer.parseInt(id));
		bean.setContent(con);
		bean.inserMyMessage(bean);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("html/mymessage.jsp");
		requestDispatcher.forward(request, response);
	}

	



	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
