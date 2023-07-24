package ezen.pro.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

import org.springframework.security.core.userdetails.UserDetails;

public class User implements UserDetails {
	private static final long serialVersionUID = 1L;

	private String id;

	private String pw;

	public String getId() {

		return id;

	}

	public void setId(String id) {

		this.id = id;

	}

	public String getPw() {

		return pw;

	}

	public void setPw(String pw) {

		this.pw = pw;

	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override

	public String getUsername() {

		// TODO Auto-generated method stub

		return null;

	}

	@Override

	public boolean isAccountNonExpired() {

		// TODO Auto-generated method stub

		return false;

	}

	@Override

	public boolean isAccountNonLocked() {

		// TODO Auto-generated method stub

		return false;

	}

	@Override

	public boolean isCredentialsNonExpired() {

		// TODO Auto-generated method stub

		return false;

	}

	@Override

	public boolean isEnabled() {

		// TODO Auto-generated method stub

		return false;

	}

	@Override

	public String getPassword() {

		// TODO Auto-generated method stub

		return null;

	}
}
