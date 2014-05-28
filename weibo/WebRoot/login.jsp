<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>用户登录</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>css/style.css"/>
  </head>
  
  <body>
  	  <br/><br/><br/><br/>
      <form action="./User">
         <input type="hidden" id="type" name="type" value="1"/>
         <table border="1" width="50%" align="center" class="tab_comm mb20" bordercolor="green">
             <tr>
                <th colspan="2" align="center"  height="70px">
                	<font size="5" color="green">欢迎使用本系统</font>	
                </th>
             </tr>
             <tr>
                <td align="right" width="35%">用户名：</td>
                <td width="65%" height="50px"><input type="text" id="username" name="username" class="name_text"></td>
             </tr>
             <tr>
                <td align="right">密码：</td>
                <td  height="50px"><input type="password" id="password" name="password"  class="name_text"></td>
             </tr>
             <tr>
                <td colspan="2"  align="center">
                	<span class="btnC"><input type="button" value="登录" class="btnC_text" onclick="sub()"></span>
                	<span class="btnC"><input type="button" value="注册" class="btnC_text" onclick="regist();"></span>
                </td>
             </tr>
         </table>
      </s:form>
  </body>
  
  <script type="text/javascript">
    
    //验证登陆的js方法
    function sub(){
      var username = document.getElementById("username").value;
      var password = document.getElementById("password").value;
      if(username==null || username==""){
       	alert("请输入用户名");
       	return;
      }
      if(password==null || password==""){
       	alert("请输入密码");
       	return;
      }
      document.forms[0].submit();
    }

	//提交注册请求
    function regist(){
      document.location.href = "<%=basePath%>regist.jsp";
    }
  </script>
</html>
