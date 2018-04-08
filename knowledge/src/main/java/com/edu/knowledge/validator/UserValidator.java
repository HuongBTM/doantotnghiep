package com.edu.knowledge.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.UserService;

@Component
public class UserValidator implements Validator{

	@Autowired
	private UserService userService;
	@Override
	public boolean supports(Class<?> arg0) {
		return false;
	}

	@Override
	public void validate(Object arg0, Errors error) {
		User user = (User) arg0;
		
		if(!user.getConfirmpassword().equals(user.getPassword())) {
			error.rejectValue("confirmpassword", "user.confirmpassword.errors", "Confirm password not match!");
		}
		
		User dbUser = userService.getUserByEmail(user.getEmail());
		if(dbUser != null && dbUser.getUserId()!= user.getUserId()) {
			error.rejectValue("email", "user.email.errors", "Email đã tồn tại");
		}
	}

}
