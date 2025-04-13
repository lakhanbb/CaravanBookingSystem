package com.caravan.Dao;

import java.util.List;

import com.caravan.entity.User;

public interface UserDao {
	
	public int  saveUser(User user);
	
	public User getUserById(int id);
	
	public List<User> getAllUser();
	
	public void update(User user); 
	
	public void deleteUser(int id); 
	
	public User loginUser(String userName, String password);

}
