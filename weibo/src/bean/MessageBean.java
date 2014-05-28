package bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import db.JDBConnection;


public class MessageBean extends UserBean{

	private int mid;//主键
	private int userid;//主键
	private String thetime;//时间
	private String content;//内容
	
	//无参数构造器
	public MessageBean() {
		super();
	}
	
	//有参构造器
	public MessageBean(int mid, int userid, String thetime, String content) {
		super();
		this.mid = mid;
		this.userid = userid;
		this.thetime = thetime;
		this.content = content;
	}
	
	//有参构造器
	public MessageBean(int mid, int userid, String name, String thetime, String content) {
		super();
		super.setName(name);
		this.mid = mid;
		this.userid = userid;
		this.thetime = thetime;
		this.content = content;
	}



	//显示朋友的动态信息
	public List<MessageBean> listFriendMessage(int userid){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<MessageBean> list = new ArrayList<MessageBean>();
		String sql = "SELECT b.name,c.id,c.userid,c.thetime,c.content FROM linkman a,theuser b,message c WHERE a.friendid=b.id AND b.id=c.userid ";
		//主键
		if (userid > 0) {
			sql = sql + " AND a.userid=" + userid;
		}
		sql = sql + " ORDER BY c.thetime DESC";
		//执行查询结果
		ResultSet rs = new JDBConnection().executeQuery(sql);
		try {
			while (rs.next()) {
				String name = rs.getString(1);
				int mid = rs.getInt(2);
				int uid = rs.getInt(3);
				Date thetime = rs.getTimestamp(4);
				String dateString = formatter.format(thetime);
				String content = rs.getString(5);
				MessageBean bean = new MessageBean( mid,  uid,  name,  dateString,  content);
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	//显示自己的动态信息
	public List<MessageBean> listMyMessage(int userid){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<MessageBean> list = new ArrayList<MessageBean>();
		String sql = "SELECT a.name,b.id,b.userid,b.thetime,b.content FROM theuser a,message b WHERE a.id=b.userid ";
		//主键
		if (userid > 0) {
			sql = sql + " AND a.id=" + userid;
		}
		sql = sql + " ORDER BY b.thetime DESC";
		//执行查询结果
		ResultSet rs = new JDBConnection().executeQuery(sql);
		try {
			while (rs.next()) {
				String name = rs.getString(1);
				int mid = rs.getInt(2);
				int uid = rs.getInt(3);
				Date thetime = rs.getTimestamp(4);
				String dateString = formatter.format(thetime);
				String content = rs.getString(5);
				MessageBean bean = new MessageBean( mid,  uid,  name,  dateString,  content);
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	//添加一个消息动态
	public boolean inserMyMessage(MessageBean bean){
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(currentTime);

		String sql = "INSERT INTO message (userid,thetime,content) VALUES ("+bean.getUserid()+",'"+dateString+"','"+bean.getContent()+"');";
		//执行查询结果
		return new JDBConnection().executeUpdate(sql);
	}
	
	
	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getThetime() {
		return thetime;
	}

	public void setThetime(String thetime) {
		this.thetime = thetime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
