 package com.caravan.Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.query.Query;
import org.hibernate.FlushMode;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.caravan.entity.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Transactional
	@Override
	public int saveUser(User user) {
		// Check for duplicate username
		String usernameQuery = "SELECT COUNT(*) FROM User WHERE userName = :username";
		Long usernameCount = hibernateTemplate.execute(session -> {
			Query<Long> query = session.createQuery(usernameQuery, Long.class);
			query.setParameter("username", user.getUserName());
			return query.uniqueResult();
		});

		if (usernameCount != null && usernameCount > 0) {
			// Username already exists, return a specific error code or message
			return -1;
		}

		// Check for duplicate email
		String emailQuery = "SELECT COUNT(*) FROM User WHERE email = :email";
		Long emailCount = hibernateTemplate.execute(session -> {
			Query<Long> query = session.createQuery(emailQuery, Long.class);
			query.setParameter("email", user.getEmail());
			return query.uniqueResult();
		});

		if (emailCount != null && emailCount > 0) {
			// Email already exists, return a specific error code or message
			return -2;
		}

		// Check for duplicate password (assuming password needs to be unique, adjust as
		// needed)
		String passwordQuery = "SELECT COUNT(*) FROM User WHERE password = :password";
		Long passwordCount = hibernateTemplate.execute(session -> {
			Query<Long> query = session.createQuery(passwordQuery, Long.class);
			query.setParameter("password", user.getPassword());
			return query.uniqueResult();
		});

		if (passwordCount != null && passwordCount > 0) {
			// Password already exists, return a specific error code or message
			return -3;
		}

		// If no duplicates, save the user
		int i = (Integer) hibernateTemplate.save(user);
		return i;
	}

	@Override
	public User getUserById(int id) {
		User user = hibernateTemplate.get(User.class, id);
		return user;
	}

	@Override
	public List<User> getAllUser() {

		List<User> list = hibernateTemplate.loadAll(User.class);

		// TODO Auto-generated method stub
		return list;
	}

	@Transactional
	@Override
	public void update(User user) {

		hibernateTemplate.update(user);
		// TODO Auto-generated method stub

	}

	
	

	public User loginUser(String userName, String password) {
		
		// TODO Auto-generated method stub

		// select * from user where email=? and password=? ; ->user object
		String sql = "from User where userName=:em and password=:pwd";

		User us = (User) hibernateTemplate.execute(s -> {

			Query q = s.createQuery(sql);
			q.setString("em", userName);
			q.setString("pwd", password);
			return q.uniqueResult();
		});

		return us;
	}

	@Override
	public void deleteUser(int id) {
		// TODO Auto-generated method stub
		User user = hibernateTemplate.load(User.class, id); // Load the user by ID
	    
        hibernateTemplate.delete(user); // Delete the user
		
	}

}
