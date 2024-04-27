package com.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.Appointment;

public class AppointmentDao {

	private Connection con;

	public AppointmentDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addAppointment(Appointment ap) {
		boolean f = false;
		try {
			
			CallableStatement cs = con.prepareCall("{call insertintoappointment(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
	
			cs.setInt(1, ap.getUserId());
			cs.setString(2, ap.getFullName());
			cs.setString(3, ap.getGender());
			cs.setString(4, ap.getAge());
			cs.setString(5, ap.getAppointmentDate());
			cs.setString(6, ap.getEmail());
			cs.setString(7, ap.getPhno());
			cs.setString(8, ap.getDiseases());
			cs.setInt(9, ap.getDoctorId());
			cs.setString(10, ap.getAddress());
			cs.setString(11, ap.getStatus());

			int i = cs.executeUpdate();

			if (i == 1)
				f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Appointment> getAllAppointmentByLoginUser(int userid) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		try {
			String sql = "select * from appointment where userid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setUserId(rs.getInt(2));
				ap.setId(rs.getInt(1));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointmentDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhno(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Appointment> getAllAppointmentByDoctorLogin(int doctorId) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		try {
			String sql = "select * from appointment where doctorid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, doctorId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setUserId(rs.getInt(2));
				ap.setId(rs.getInt(1));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointmentDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhno(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Appointment getAppointmentById(int id) {

		Appointment ap = null;
		try {
			String sql = "select * from appointment where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setUserId(rs.getInt(2));
				ap.setId(rs.getInt(1));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointmentDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhno(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ap;
	}

	public boolean updateCommentStatus(int id, int doctId, String comm) {
		boolean f = false;
		try {
			String sql = "update appointment set status = ? where (id = ? and doctorid = ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, comm);
			ps.setInt(2, id);
			ps.setInt(3, doctId);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Appointment> getAllAppointment() {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		try {
			String sql = "select * from appointment order by id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setUserId(rs.getInt(2));
				ap.setId(rs.getInt(1));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointmentDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhno(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list.size());
		return list;
	}

}
