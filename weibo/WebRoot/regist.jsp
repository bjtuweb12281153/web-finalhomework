<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>用户注册</title>
    <base href="<%=basePath%>">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>css/style.css"></link>
  </head>
  
  <body>
      <form action="./User">
      	 <input type="hidden" id="type" name="type" value="2"/>
         <table border="1" width="40%" align="center" class="tab_comm mb20" bordercolor="green">
             <tr>
                <th colspan="2" align="center"  height="70px">
                	<font size="5" color="green">欢迎使用注册页面</font>	
                </th>
             </tr>
             <tr>
                <td align="right" width="35%">用户名：</td>
                <td width="65%" height="50px">
                <input type="text" id="username" name="username" class="name_text"></input><font color="red">&nbsp;* 必填</font>
                </td>
             </tr>
             <tr>
                <td align="right">密码：</td>
                <td  height="50px"><input type="password" id="password" name="password"  class="name_text"><font color="red">&nbsp;* 必填</font></td>
             </tr>
             <tr>
                <td align="right">重复密码：</td>
                <td  height="50px"><input type="password" id="repassword" name="repassword"  class="name_text"><font color="red">&nbsp;* 必填</font></td>
             </tr>
             <tr>
                <td align="right" width="35%">姓名：</td>
                <td width="65%" height="50px"><input type="text" id="name" name="name" class="name_text"><font color="red">&nbsp;* 必填</font></td>
             </tr>
             <tr>
                <td align="right" width="35%">性别：</td>
                <td width="65%" height="50px">
                	<select class="name_text" name="sex" id="sex" style="width: 100px;">
						<option value="">请选择</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
                <font color="red">&nbsp;* 必填</font></td>
             </tr>
             <tr>
                <td align="right" width="35%">手机：</td>
                <td width="65%" height="50px"><input type="text" id="tele" name="tele" class="name_text"><font color="red">&nbsp;* 必填</font></td>
             </tr>
             <tr>
                <td align="right" width="35%">邮箱：</td>
                <td width="65%" height="50px"><input type="text" id="email" name="email" class="name_text"><font color="red">&nbsp;* 必填</font></td>
             </tr>
             <tr>
                <td colspan="2"  align="center">
                	<span class="btnC"><input type="button" value="保存" class="btnC_text" onclick="sub();"></span>
                	<span class="btnC"><input type="button" value="返回" class="btnC_text" onclick="history.go(-1);"></span>
                </td>
             </tr>
         </table>
      <form>
  </body>
  
  <script type="text/javascript">
  var flag = '${flag}';
  if(flag=='no'){
  	alert('注册失败');
  }
  
  var mobileCheck=/^1\d{10}$/;//手机
  //验证登陆的js方法
  function sub(){
  	   var username = document.getElementById("username").value;
       var password = document.getElementById("password").value;
       var repassword = document.getElementById("repassword").value;
       var name = document.getElementById("name").value;
       var sex = document.getElementById("sex").value
       var tele = document.getElementById("tele").value;
       var email = document.getElementById("email").value;
       
       if(username==null || username==""){
        	alert("请输入用户名");
        	return;
       }
       if(password==null || password==""){
        	alert("请输入密码");
        	return;
       }
       if(repassword==null || repassword==""){
          	alert("请输入重复密码");
          	return;
         }
       if(password!=repassword){
          	alert("两次输入密码不一致");
          	return;
       }
       if(name==null || name==""){
        	alert("请输入名字");
        	return;
       }
       if(sex==null || sex==""){
        	alert("请输入性别");
        	return;
       }
       if(tele==null || tele==""){
        	alert("请输入电话");
        	return;
       }
       if(email==null || email==""){
        	alert("请输入邮箱");
        	return;
       }
   	   document.forms[0].submit();
  }
  </script>
</html>
