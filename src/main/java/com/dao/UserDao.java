package com.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.Doctor;
import com.entities.User;


public class UserDao {
	
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean register(User u) {
		boolean f = false;
		try {
			
			CallableStatement cs = con.prepareCall("{call insertintouserdetails(?, ?, ?)}");
			
			
			cs.setString(1, u.getFullName());
			cs.setString(2, u.getEmail());
			cs.setString(3, u.getPassword());
			
			int i = cs.executeUpdate();
			
			if(i == 1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public User login(String email, String password) {
		
		User u = null;
		try {
			String sql = "select * from UserDetails where email = ? and password = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				u = new User();
				u.setId(rs.getInt(1));
				u.setFullName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));		
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return u;
	}
	
	public boolean checkOldPassword(int userId, String oldPassword) {
		boolean f = false;
		try {
			String sql = "select * from userDetails where id = ? and password = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, oldPassword);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean changePassword(int userId, String newPassword) {
		boolean f = false;
		try {
			String sql = "update userDetails set password = ? where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2,  userId);
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<User> getAllUser() {

		List<User> list = new ArrayList<>();
		User u = null;
		try {
			String sql = "select * from UserDetails order by id desc";
			PreparedStatement ps = con.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setFullName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				list.add(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public User getUserById(int id) {
		User u = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from userDetails where id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setFullName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	
	public boolean updateUser(User u) {
		boolean f = false;

		try {
			String sql = "update userDetails set name = ?, email=?, password = ? where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, u.getFullName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setInt(4, u.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
}
