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
	
	// 휴대폰 번호 유효성 검사
	@RequestMapping("/member/phoneCheck")
	@ResponseBody
	public String phoneCheck(String phone) {
		for(int i=0;i<phone.length();i++) {
			if(!(phone.charAt(i)>='0' && phone.charAt(i)<='9') || phone.length()!=11) {
				return "X";
			}
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
		// 메일이 존재하면 1 존재하지 않으면 0 잘못된 형식이면 x
		if(at+1<dot && dot!=(mail.length()-1) && at!=0 && atCount==1 && dotCount==1 && at>hyphen && at>num && mail.charAt(0)!='-' && mail.charAt(0)!='_') {
			for(int i=0;i<mail.length();i++) {
				if(mail.charAt(i)=='.' || mail.charAt(i)=='@' || mail.charAt(i)=='-' || mail.charAt(i)=='_' || (mail.charAt(i)>='0' && mail.charAt(i)<='9') || (mail.charAt(i)>='a' && mail.charAt(i)<='z')) {
					if(i == mail.length()-1) {
						if(memberService.mailCheck(mail) == 0) {
							return "0";
						} else {
							return "1";
						}
					}
				} else {
					break;
				}
			}		 
		}
		return "X";
	}
	
	// 메일 인증번호 보내기
	@RequestMapping("/member/mailNumSend")
	@ResponseBody
	public String mailNumSend(final String mail) {
		final String mailNum;
		while(true){
			int random = (int)(Math.random()*10000);
			if(random > 1000) {
				mailNum = random + "";
				break;
			}
		}
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
	
	// 회원가입
	@RequestMapping("/member/join")
	@ResponseBody
	public String join(MemberDTO dto) {
		memberService.join(dto);
		return "";
	}
	
	// 회원가입 완료 페이지
	@RequestMapping("/member/joinSuccess.do")
	public String joinSuccess() {
		return "member/joinSuccess";
	}
	
	// 아이디 찾기 페이지
	@RequestMapping("/member/findId.do")
	public String findId(HttpSession session) {
		if(session.getAttribute("id") != null) {
			return "redirect:/";
		} else {
			return "member/findId";
		}
	}
	
	// 아이디 찾기
	@RequestMapping("/member/findId")
	@ResponseBody
	public String findId(MemberDTO dto) {
		return memberService.findId(dto);
	}
	
	// findId 메일 보내기
	@RequestMapping("/member/mailIdSend")
	@ResponseBody
	public String mailIdSend(final String mail, final String id) {
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("tjdan862@gmail.com");
				helper.setTo(mail);
				helper.setSubject("당고 인증번호입니다");
				helper.setText("고객님의 당고 아이디는 : [" + id + "]입니다");
			}
		};
		mailSender.send(preparator);
		return "";
	}
	
	// 아이디 찾기 성공 페이지
	@RequestMapping("/member/findIdSuccess.do")
	public String findIdSuccess() {
		return "member/findIdSuccess";
	}
	
	// 비밀번호 찾기 페이지
	@RequestMapping("/member/findPw.do")
	public String findPw() {
		return "member/findPw";
	}
	
	// 비밀번호 찾기
	@RequestMapping("/member/findPw")
	@ResponseBody
	public String findPw(HttpSession session, MemberDTO dto) {
		if(memberService.findPw(dto) == 1) {
			session.setAttribute("guestId", dto.getId());
			return "O";
		} else {
			return "X";
		}
	}
	
	// 비밀번호 찾기 성공 후 변경 페이지, 정보 수정 비밀번호 변경 페이지
	@RequestMapping("/member/pwChange.do")
	public String pwChange(HttpSession session) {
		if(session.getAttribute("guestId") == null) {
			return "redirect:/";
		} else {
			return "member/pwChange";
		}
	}
	
	@RequestMapping("/member/pwChange")
	public String pwChange(HttpSession session, String pw) {
		memberService.pwChange(session, pw);
		session.invalidate();
		return "";
	}
}
