<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="bean.UserBean;"%>
<jsp:useBean id="bean" scope="page" class="bean.UserBean"></jsp:useBean>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>welcome you</title>
		<link type="text/css" rel="stylesheet" href="<%=basePath%>css/style.css">
	</head>

	<body>
		<table width="70%" class="tab_comm mb20" align="center">
			<thead>
				<tr align="center">
					<td><font size="5">好友管理</font></td>
				</tr>
			</thead>
		</table>
		
		
		<table width="50%" class="tab_comm tab_list" align="center">
			<thead>
				<th colspan="5" align="center">已添加好友</th>
			</thead>
			<tbody>
				<%
					String id = request.getSession().getAttribute("userid").toString();
					if(id==null || "".equals(id)){
						return;
					}
					List<UserBean> list = (List<UserBean>)bean.careUser(Integer.parseInt(id));
					if(list==null || list.size()==0) list = new ArrayList<UserBean>();
					for(int i=0;i<list.size();i++){
						UserBean user = list.get(i);
				%>
					<tr>
						<td align="center">
							<%=user.getName() %>
						</td>
						<td align="center">
							<%=user.getSex() %>
						</td>
						<td align="center">
							<%=user.getUsername() %>
						</td>
						<td align="center">
							<%=user.getTele() %>
						</td>
						<td align="center">
							<%=user.getEmail() %>
						</td>
					</tr>
				<%
					}
				%>
			</tbody>
		</table>
		
		<br/><br/><br/>
		<table width="50%" class="tab_comm tab_list" align="center">
			<thead>
				<th align="center" colspan="6">未添加好友</th>
			</thead>
			<tbody>
				<%
					// String id = request.getSession().getAttribute("userid").toString();
					if(id==null || "".equals(id)){
						return;
					}
					List<UserBean> list1 = (List<UserBean>)bean.noCareUser(Integer.parseInt(id));
					if(list1==null || list1.size()==0) list1 = new ArrayList<UserBean>();
					for(int i=0;i<list1.size();i++){
						UserBean user = list1.get(i);
				%>
					<tr>
						<td align="center">
							<%=user.getName() %>
						</td>
						<td align="center">
							<%=user.getSex() %>
						</td>
						<td align="center">
							<%=user.getUsername() %>
						</td>
						<td align="center">
							<%=user.getTele() %>
						</td>
						<td align="center">
							<%=user.getEmail() %>
						</td>
						<td align="center">
							<a href="<%=basePath %>User?type=3&id=<%=id %>&fid=<%=user.getId() %>">添加</a>
						</td>
					</tr>
				<%
					}
				%>
			</tbody>
		</table>
		
		<br>
		<br>
		<div align="right" style="padding-right: 200px;">
			<a href="<%=basePath %>html/friendmessage.jsp" style="text-decoration:none;">好友动态</a>
			<a href="<%=basePath %>login.jsp" style="text-decoration:none;">退出系统</a>
		</div>
	</body>
	
	
	<script type="text/javascript">
	
	</script>
</html>
