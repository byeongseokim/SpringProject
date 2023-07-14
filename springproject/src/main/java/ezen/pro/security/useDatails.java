package ezen.pro.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class useDatails implements UserDetails {
	
	private String useID; //사용자아이디
	private String password;//암호화 pw
	private String authority;//사용자의 권한
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth=new ArrayList<GrantedAuthority>();
		
		auth.add(new SimpleGrantedAuthority(this.authority));
		return auth;
	}
	public void setAuthorities(String authority) {
		this.authority=authority;
	}
	
	@Override
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	@Override
	public String getUsername() {
		return useID;
	}
	public void setUsername(String useID) {
		this.useID=useID;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
}
