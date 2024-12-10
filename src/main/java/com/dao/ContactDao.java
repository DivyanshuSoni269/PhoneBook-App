package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contact;

public class ContactDao {
    private Connection conn;

    public ContactDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean saveContact(Contact c) {
        boolean f = false; // Initialize flag to false
        try {
            String sql = "insert into contact(name, email, mob, about, uid) values (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getMob());
            ps.setString(4, c.getAbout());
            ps.setInt(5, c.getUserId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true; // Set flag to true if insertion is successful
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print exception details for debugging
        }
        return f; // Return the actual flag value
    }
    
    public List<Contact> getAllContact(int uid){
    	List<Contact> list=new ArrayList<Contact>();
    	Contact c=null;
    	try {
			String sql="select * from contact where uid=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1,uid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Contact();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setMob(rs.getString(4));
				c.setAbout(rs.getString(5));
				list.add(c);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
    	return list;
    }
    public Contact getContactById(int cid) {
    	Contact c=new Contact();
    	try {
    		PreparedStatement ps=conn.prepareStatement("select * from contact where id=?");

    		ps.setInt(1, cid);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next()) {
    			c.setId(rs.getInt(1));
    			c.setName(rs.getString(2));
    			c.setEmail(rs.getString(3));
    			c.setMob(rs.getString(4));
    			c.setAbout(rs.getString(5));
    			
    		}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
    	return c;
    }
    
    public boolean updateContact(Contact c) {
        boolean f = false;
        try {
            String sql = "UPDATE contact SET name=?, email=?, mob=?, about=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getMob());
            ps.setString(4, c.getAbout());
            ps.setInt(5, c.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true; // Update successful
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteContact(int id) {
        boolean f = false;
        try {
            String sql = "delete from contact where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true; // Update successful
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
