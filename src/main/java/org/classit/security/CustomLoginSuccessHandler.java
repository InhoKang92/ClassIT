package org.classit.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classIT.domain.MemberVO;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

//로그인에 성공해야만 오는 페이지
//Authentication 객체로 로그인한 사람의 정보 사용자의 이름, 권한, 인증된 시간 등을 알수 있다.
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {


	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
	        throws IOException, ServletException {

	    log.warn("Login Success................");
	    List<String> roleNames = new ArrayList<String>();

	    // 사용자의 권한을 확인하고 이를 roleNames 리스트에 추가
	    authentication.getAuthorities().forEach(authority -> {
	        roleNames.add(authority.getAuthority());
	    });

	    log.warn("ROLE NAMES : " + roleNames);

	    // 로그인한 사용자 정보를 세션에 저장
	    UserDetails userDetails = (UserDetails) authentication.getPrincipal();
	    String username = userDetails.getUsername();
	    
	    // 필요한 경우 추가 정보를 가져와 MemberVO를 생성
	    MemberVO loginUser = new MemberVO();
	    loginUser.setUsername(username);
	    // 다른 필드도 설정

	    // 원래 요청 URL 가져오기
	    String redirectUrl = request.getParameter("redirectUrl");
	    log.warn("redirectUrl : " + redirectUrl);

	    // ROLE_ADMIN과 ROLE_MEMBER 권한을 가진 사용자를 구분
	    if (roleNames.contains("ROLE_관리자")) {
	        response.sendRedirect("/main");
	        return;
	    }

	    if (roleNames.contains("ROLE_사장")) {
	        response.sendRedirect("/main");
	        return;
	    }

	    // redirectUrl이 null이거나 비어있으면 기본 URL로 리다이렉트
	    if (redirectUrl == null || redirectUrl.isEmpty()) {
	        redirectUrl = "/main"; // 기본 리다이렉트 URL
	    }

	    // redirectUrl을 세션에 저장
	    request.getSession().setAttribute("redirectUrl", redirectUrl);
	    response.sendRedirect("/main");
	}


}