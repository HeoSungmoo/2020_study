package com.dango.hsm.controller.member;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dango.hsm.model.member.dto.MemberDTO;
import com.dango.hsm.service.member.MemberService;

@Controller
public class MemberController {

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Inject
	MemberService memberService;
	
	// 로그인 페이지 이동
	@RequestMapping("/member/login.do")
	public String login(HttpSession session) {
		if(session.getAttribute("id") != null) {
			return "redirect:/";
		} else {
			return "member/login";
		}
	}
	
	// 로그인 체크
	@RequestMapping("/member/loginCheck")
	@ResponseBody
	public String loginCheck(MemberDTO dto, HttpSession session) {
		if(memberService.loginCheck(dto, session) == 1) {
			return "1";
		} else {
			return "0";
		}
	}
	
	// 로그아웃
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping("/member/join.do")
	public String join(HttpSession session) {
		if(session.getAttribute("id") != null) {
			return "redirect:/";
		} else {
			return "member/join";
		}
	}
	
	// 아이디 유효성 검사 및 중복확인
	@RequestMapping("/member/idCheck")
	@ResponseBody
	public String idCheck(String id) {
		for(int i=0;i<id.length();i++) {
			if(!(id.charAt(i)>='0' && id.charAt(i)<='9' || id.charAt(i)>='a' && id.charAt(i)<='z') || id.length() < 5 || id.length() > 15) {
				return "X";
			}
		}

		if(memberService.idCheck(id) == 0) {
			return "0";
		} else {
			return "1";
		}
	}
	
	// 비밀번호 유효성 검사
	@RequestMapping("/member/pwCheck")
	@ResponseBody
	public String pwCheck(String pw) {
		int num = 0;
		int literal = 0;
		int icon = 0;
		String icons = "`~!@#$%^&*()_+-=[] {}|;:',.<>/?";
		
		for(int i=0;i<pw.length();i++) {
			if(pw.charAt(i)>='0' && pw.charAt(i)<='9') {
				num++;
			} else if(pw.charAt(i)>='a' && pw.charAt(i)<='z' || pw.charAt(i)>='A' && pw.charAt(i)<='Z') {
				literal++;
			}
			for(int j=0;j<icons.length();j++) {
				if(pw.charAt(i) == icons.charAt(j)) {
					icon++;
				}
			}
		}
		if(pw.length()<8 || pw.length()>15 || num==0 || literal==0 || icon==0) {
			return "X";
		}
		
		return "O";
	}
	
	// 메일 유효성 검사 및 중복확인
	@RequestMapping("/member/mailCheck")
	@ResponseBody
	public String mailCheck(String mail) {
		int at = 0;
		int dot = 0;
		int atCount = 0;
		int dotCount = 0;
		int hyphen = 0;
		int num = 0;
		
		for(int i=0;i<mail.length();i++) {
			if(mail.charAt(i) == '@') {
				at = i;
				atCount++;
			} else if(mail.charAt(i) == '.') {
				dot = i;
				dotCount++;
			} else if(mail.charAt(i) == '-' || mail.charAt(i) == '_') {
				hyphen = i;
			} else if(mail.charAt(i) >= '0' && mail.charAt(i) <= '9') {
				num = i;
			}
		}
		// 소문자, 숫자, 특수기호('-','_')만 가능
		if(at+1<dot && dot!=(mail.length()-1) && at!=0 && atCount==1 && dotCount==1 && at>hyphen && at>num && mail.charAt(0)!='-' && mail.charAt(0)!='_') {
			for(int i=0;i<mail.length();i++) {
				if(mail.charAt(i)=='.' || mail.charAt(i)=='@' || mail.charAt(i)=='-' || mail.charAt(i)=='_' || (mail.charAt(i)>='0' && mail.charAt(i)<='9') || (mail.charAt(i)>='a' && mail.charAt(i)<='z')) {
					if(memberService.mailCheck(mail) == 0) {
						return "0";
					} else {
						return "1";
					}
				}
			}		 
		}
		return "X";
	}
	
	// 메일 인증번호 보내기
	@RequestMapping("/member/mailSend")
	@ResponseBody
	public String mailSend(final String mail) {
		final String mailNum = (int)(Math.random()*10000) + "";
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("tjdan862@gmail.com");
				helper.setTo(mail);
				helper.setSubject("당고 인증번호입니다");
				helper.setText("인증번호 [" + mailNum +"]");
			}
		};
		mailSender.send(preparator);
		return mailNum;
	}
}
