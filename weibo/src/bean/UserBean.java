package bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tools.Validator;

import db.JDBConnection;


public class UserBean {

	private int id;//主键
	private String username;//用户名
	private String name;//姓名
	private String email;//邮箱
	private String password;//密码
	private String tele;//电话
	private String sex;//性别
	
	//无参数构造器
	public UserBean() {
		super();
	}
	
	//有参构造器
	public UserBean(int id, String username, String password, String name, String sex, String email,
			 String tele) {
		super();
		this.id = id;
		this.username = username;
		this.name = name;
		this.email = email;
		this.password = password;
		this.tele = tele;
		this.sex = sex;
	}

	
	//尚未关注的用户列表 
	public List<UserBean> noCareUser(int id){
		List<UserBean> list = new ArrayList<UserBean>();
		String sql = "SELECT * FROM theuser WHERE id<>"+id+" AND id NOT IN (SELECT friendid FROM linkman WHERE userid="+id+")";
		ResultSet rs = new JDBConnection().executeQuery(sql);
		try {
			while (rs.next()) {
				int id1 = rs.getInt(1);
				String username1 = rs.getString(2);
				String password1 = rs.getString(3);
				String name1 = rs.getString(4);
				String sex1 = rs.getString(5);
				String email1 = rs.getString(6);
				String tele1 = rs.getString(7);
				UserBean bean = new UserBean(id1,username1,password1,name1,sex1,email1,tele1);
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	//已经关注的用户列表 
	public List<UserBean> careUser(int id){
		List<UserBean> list = new ArrayList<UserBean>();
		String sql = "SELECT * FROM theuser WHERE id<>"+id+" AND id IN (SELECT friendid FROM linkman WHERE userid="+id+")";
		ResultSet rs = new JDBConnection().executeQuery(sql);
		try {
			while (rs.next()) {
				int id1 = rs.getInt(1);
				String username1 = rs.getString(2);
				String password1 = rs.getString(3);
				String name1 = rs.getString(4);
				String sex1 = rs.getString(5);
				String email1 = rs.getString(6);
				String tele1 = rs.getString(7);
				UserBean bean = new UserBean(id1,username1,password1,name1,sex1,email1,tele1);
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	//不同条件查询用户
	public List<UserBean> getUserBeanById(int id,String username,String password,String tele){
		List<UserBean> list = new ArrayList<UserBean>();
		String sql = "select * from theuser where 1=1 ";
		//主键
		if (Validator.isNotNull(id) && id>0) {
			sql = sql + " and id="+id;
		}
		//用户名
		if (Validator.isNotNull(username)) {
			sql = sql + " and username='"+username+"' ";
		}
		//密码
		if (Validator.isNotNull(password)) {
			sql = sql + " and password='"+password+"' ";
		}
		//电话
		if (Validator.isNotNull(tele)) {
			sql = sql + " and tele='"+tele+"' ";
		}
		//执行查询结果
		ResultSet rs = new JDBConnection().executeQuery(sql);
		try {
			while (rs.next()) {
				int id1 = rs.getInt(1);
				String username1 = rs.getString(2);
				String password1 = rs.getString(3);
				String name1 = rs.getString(4);
				String sex1 = rs.getString(5);
				String email1 = rs.getString(6);
				String tele1 = rs.getString(7);
				UserBean bean = new UserBean(id1,username1,password1,name1,sex1,email1,tele1);
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	//添加注册用户
	public boolean adduser(UserBean bean){
		//检查是否有用户名相同的用户  有的话 添加失败
		List<UserBean> list = getUserBeanById(0,bean.getUsername(),null,null);
		if (Validator.isNotNull(list) && list.size()>0) {
			return false;
		}
		//生成sql语句
		String sql = "insert into theuser(username,password,name,sex,tele,email) " +
				"values('"+bean.getUsername()+"','"+bean.getPassword()+"','"+bean.getName()+"','" + bean.getSex() + "','"+bean.getTele()+"','"+bean.getEmail()+"')";
		return new JDBConnection().executeUpdate(sql);
	}

	//添加好友
	public boolean addLink(String id, String fid) {
		String sql = "insert into linkman(userid,friendid) values ("+id+","+fid+")";
		return new JDBConnection().executeUpdate(sql);
	}
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getTele() {
		return tele;
	}


	public void setTele(String tele) {
		this.tele = tele;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}

}
