/**
 *
 */
package com.tp.asset.service;

import javax.security.auth.login.CredentialNotFoundException;

/**
 * @author CENTAUR
 *
 */
public interface UserService
{
		public boolean isValidUser(String username, String password) throws CredentialNotFoundException;
}
