package org.classit.security;
import org.springframework.security.crypto.password.PasswordEncoder;
public class CustomNoOpPasswordEncoder  implements PasswordEncoder {

           //비밀번호를 인코딩하지 않고 주어진 문자열 그대로 반환하는 사용자 정의 PasswordEncoder 구현체, 테스트목적
	@Override
	public String encode(CharSequence rawPassword) {
		return rawPassword.toString();
	}

            // 주어진 원시 비밀번호와 인코딩된 비밀번호를 비교, 비밀번호가 같으면 true, 아니면false
	// rawPassword(비밀번호),encodedPassword(확인할 인코딩된 비밀번호) 
	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		return rawPassword.toString().equals(encodedPassword);
	}
}
