package com.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.Specalist;


public class SpecalistDao {

	private Connection con;

	public SpecalistDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean addSpecialist(String spec) {
		
		boolean f = false;
		try {
			
			
			CallableStatement cs = con.prepareCall("{call insertintospecialist(?)}");

			cs.setString(1, spec);
			int i = cs.executeUpdate();
			
			if(i == 1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Specalist> getAllSpecialist(){
		List<Specalist> list = new ArrayList<>();
		Specalist s = null;
		
		try {
			String sql = "select * from specialist";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				s = new Specalist();
				s.setId(rs.getInt(1));
				s.setSpecalistName(rs.getString(2));
				list.add(s);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
