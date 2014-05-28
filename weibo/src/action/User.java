package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import tools.Validator;

import bean.MessageBean;
import bean.UserBean;


/*
 * 所有操作都在这里响应
 */
public class User extends HttpServlet {

	//入口方法
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		if("1".equals(type)){
			login(request,response);//登陆
		}else if("2".equals(type)){
			regist(request,response);//注册
		}else if("3".equals(type)){
			addFriend(request,response);//添加一个好友
		}
	}

	
	//添加一个好友
	private void addFriend(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");//当前用户id
		String fid = request.getParameter("fid");//朋友id
		
		UserBean bean  = new UserBean();
		bean.addLink(id,fid);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("html/addfriend.jsp");
		requestDispatcher.forward(request, response);
	}
	
	//注册用户
	private void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");//用户名
		String password = request.getParameter("password");//密码
		String name = request.getParameter("name");//名字
		String tele = request.getParameter("tele");//电话
		String email = request.getParameter("email");//邮箱
		String sex = request.getParameter("sex");//性别
		
		//实例化一个user
		UserBean bean = new UserBean();
		bean.setUsername(username);
		bean.setPassword(password);
		bean.setName(name==null?"":name);
		bean.setTele(tele==null?"":tele);
		bean.setEmail(email==null?"":email);
		bean.setSex(sex);
		
		//调用javabean添加一个用户  返回true表示成功 否则失败
		boolean flag = bean.adduser(bean);
		if (flag) {
			//添加成功  跳转到登录页面
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
			requestDispatcher.forward(request, response);
		}else {
			//添加失败  重新回到注册页面
			request.setAttribute("flag", "no");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("regist.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	//用户登陆
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException   {
		String username = request.getParameter("username");//用户名
		String password = request.getParameter("password");//密码
		//验证登录信息
		List<UserBean> list = new UserBean().getUserBeanById(0, username, password, null);
		if (Validator.isNotNull(list) && list.size()>0) {
			//登陆成功后将用户信息写进session
			UserBean bean = list.get(0);
			request.getSession().setAttribute("userid", bean.getId());
			request.getSession().setAttribute("username", bean.getUsername());
			//显示朋友的动态消息 Message
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("html/friendmessage.jsp");
			requestDispatcher.forward(request, response);
		}else {
			//登录信息错误则回到登录页面
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	



	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
