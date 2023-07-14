package ezen.pro.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import ezen.pro.domain.userVO;
import ezen.pro.service.userService;

@Component
public class customAuthenticationProvider implements AuthenticationProvider{

	
	
	@Autowired
	userService service;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String userid=(String) authentication.getPrincipal();
		String password=(String)authentication.getCredentials();
		userVO  user = service.readuser(userid);

		if(user==null) {
			throw new UsernameNotFoundException("아이디가 없습니다");
		}

		//암호화
		//hashpassword=encoding(password);
		BCryptPasswordEncoder hashpassword= new BCryptPasswordEncoder();
		
		if(!hashpassword.matches(password,user.getPassword())) {
			throw new BadCredentialsException("비밀번호가틀립니다");
		}
		List<GrantedAuthority> role=new ArrayList<>();
		if(user.getGrade()==2) {
			role.add(new SimpleGrantedAuthority("admin"));
		}else {
			role.add(new SimpleGrantedAuthority("normal"));
		}
		UsernamePasswordAuthenticationToken result =new UsernamePasswordAuthenticationToken(userid, password,role);
		return result;
	}
	
	@Override
	public boolean supports(Class<?> authentication) {
	
		return true;
	}
	
	

}
