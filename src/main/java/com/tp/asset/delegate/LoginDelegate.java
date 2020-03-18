package com.tp.asset.delegate;

import javax.security.auth.login.CredentialNotFoundException;

import com.tp.asset.service.UserService;

public class LoginDelegate
{
		private UserService userService;

		public UserService getUserService()
		{
				return this.userService;
		}

		public void setUserService(UserService userService)
		{
				this.userService = userService;
		}

		public boolean isValidUser(String username, String password) throws CredentialNotFoundException
    {
		    return userService.isValidUser(username, password);
    }
}
