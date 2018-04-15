package com.edu.knowledge.services;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.edu.knowledge.daos.UserRepositery;
import com.edu.knowledge.entities.CustomUserDetails;
import com.edu.knowledge.entities.Role;
import com.edu.knowledge.entities.User;

public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private UserRepositery userRepositery;
	@Override
	public CustomUserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepositery.findUserByEmail(username);
		if(user==null) {
			throw new UsernameNotFoundException("User not found");
		}
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		Role role = user.getRole();
		grantedAuthorities.add(new SimpleGrantedAuthority(role.getRoleName()));
		
		CustomUserDetails customUserDetails = new CustomUserDetails();
        customUserDetails.setUser(user);
        customUserDetails.setAuthorities(grantedAuthorities);
        return customUserDetails;
	}

}
