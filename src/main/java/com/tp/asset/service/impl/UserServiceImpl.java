package com.tp.asset.service.impl;

import javax.security.auth.login.CredentialNotFoundException;

import com.tp.asset.dao.UserDao;
import com.tp.asset.service.UserService;

public class UserServiceImpl implements UserService
{

		private UserDao userDao;

		public UserDao getUserDao()
		{
				return this.userDao;
		}

		public void setUserDao(UserDao userDao)
		{
				this.userDao = userDao;
		}

		public boolean isValidUser(String username, String password) throws CredentialNotFoundException
		{
				return userDao.isValidUser(username, password);
		}

}
