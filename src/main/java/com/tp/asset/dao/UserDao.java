package com.tp.asset.dao;

import java.sql.SQLException;

import javax.security.auth.login.CredentialNotFoundException;

/**
 * @author CENTAUR
 * This interface will be used to communicate with the
 * Database
 */
public interface UserDao
{
		public boolean isValidUser(String username, String password) throws CredentialNotFoundException;
}
