<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="bean.MessageBean;"%>
<jsp:useBean id="bean" scope="page" class="bean.MessageBean"></jsp:useBean>
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
					<td><font size="5">好友动态列表</font></td>
				</tr>
			</thead>
		</table>
		
		
		<table width="50%" class="tab_comm tab_list" align="center">
			<tbody>
				<%
					String id = request.getSession().getAttribute("userid").toString();
					if(id==null || "".equals(id)){
						return;
					}
					List<MessageBean> list = (List<MessageBean>)bean.listFriendMessage(Integer.parseInt(id));
					if(list==null || list.size()==0) list = new ArrayList<MessageBean>();
					for(int i=0;i<list.size();i++){
						MessageBean message = list.get(i);
				%>
					<tr>
						<td align="left">
							<%=i+1 %>楼&nbsp;&nbsp;&nbsp;
							<font color="blue"><%=message.getName() %>&nbsp;&nbsp;&nbsp;
							<%=message.getThetime() %><br/><br/></font>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=message.getContent() %><br/><br/>
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
			<a href="<%=basePath %>html/mymessage.jsp" style="text-decoration:none;">我的动态</a>
			<a href="<%=basePath %>html/addfriend.jsp" style="text-decoration:none;">添加好友</a>
			<a href="<%=basePath %>login.jsp" style="text-decoration:none;">退出系统</a>
		</div>
	</body>
	
	
	<script type="text/javascript">
	
	</script>
</html>
