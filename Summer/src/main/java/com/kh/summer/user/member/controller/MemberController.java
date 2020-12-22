package com.kh.summer.user.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.summer.user.member.model.service.MemberService;
import com.kh.summer.user.member.model.vo.Member;

@SessionAttributes(value = { "member" }) // 모델에 member를 담을시 세션에 자동으로 등록
@Controller
public class MemberController {

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		return "user/member/memberEnroll";
	}
	/*
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member member, Model model) {
		
		System.out.println("memberEnroll : " + member);
		
		String plainPassword = member.getPassword();
		
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		
		System.out.println("원문 : " + plainPassword);
		System.out.println("암호문 : " + encryptPassword);
		
		member.setPassword(encryptPassword);
		
		try {
			// 1. 서비스를 통한 비즈니스 로직 수행
			int result = memberService.insertMember(member);
			
			// 2. 처리 결과에 따라 view 분기 처리
			String loc = "/";
			String msg = "";
			
			if(result > 0) {
				msg = "회원가입 성공!";
			} else {
				msg = "회원가입 실패!";
			}
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
		} catch (Exception e) {
			System.out.println("회원 가입 에러 발생!!");
			
			// 기존은 예외를 우리가 지정한 예외 형식으로
			// 바꾸어 보내기 위해 MemberException을 호출한다.
			throw new MemberException(e.getMessage());
		}
		
		return "common/msg";
	}
	*/

	// 로그인
	@RequestMapping("/member/memberLogin.do")
	public ModelAndView memberLogin(
				@RequestParam String userId,
				@RequestParam String password) {
		
		ModelAndView mv = new ModelAndView();
		
		String loc = "/";
		String msg = "";
		
		Member m = memberService.selectOneMember(userId);
		
		if( m == null ) {
			msg = "존재하지 않는 아이디 입니다.";
		} else {
			if(password.equals(m.getPassword())) { // 암호화 안한거(임시)
			//if( bcryptPasswordEncoder.matches(password, m.getPassword()) ) { // 입력 값과 암호화 값을 비교
				msg = "로그인에 성공하였습니다!";
				mv.addObject("member", m);
				// @SessionAttributes 어노테이션에 등록된 'member'로 인식하면서
				// 자동으로 세션 영역에 해당 객체를 저장한다.
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
			}
		}
		
		mv.addObject("loc", loc);
		mv.addObject("msg", msg);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus) {
		
		// 현재 세션이 만료되었음을
		// HttpSession 에서 invalidate() 메소드로 구현했다면
		// SessionStatus 는 .setComplete() 메소드로 구현한다.
		
		if( !sessionStatus.isComplete() ) { // 끝나지 않았다면
			sessionStatus.setComplete();
		}
		
		return "redirect:/";
	}
	@RequestMapping("/member/mUpdate.do")
	public String memberView(@RequestParam String userId, Model model) {
		
		Member m = memberService.selectOneMember(userId);
		
		model.addAttribute("member", m);
		
		return "user/member/memberUpdate";
	}
	
	@RequestMapping("/member/mUpdateEnd.do")
	public String memberUpdate(@RequestParam String userId,
							   @RequestParam(value="password", required = false) String password,
							   @RequestParam String nickName,
							   @RequestParam String email,
							   @RequestParam String phone,
							   @RequestParam(value="address1", required = false) String address1,
							   @RequestParam(value="address2", required = false) String address2,
							   Model model) {
		
		String address = address1 + " " + address2;
		
		Member member = new Member(userId, password, nickName, email, phone, address);
		
		System.out.println(member);
		
		int result = memberService.updateMember(member);
		
		String msg = "";
		
		if( result > 0 ) {
			msg = "회원정보 수정 완료";
		} else {
			msg = "회원정보 수정 실패!";
		}
		
		System.out.println(msg);
		
		model.addAttribute("msg", msg);
		
		return "user/myPage/myPageCart";
	}
	
	/*
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete(SessionStatus sessionStatus, Model model, Member member) {
		
		int result = memberService.deleteMember(member.getUserId());
		
		if( result > 0 ) sessionStatus.setComplete();
		
		String loc = "/";
		String msg = "";
		
		if( result > 0 ) {
			msg = "회원 탈퇴 성공!!";
		} else {
			msg = "회원 탈퇴 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	*/
	
	@ResponseBody // 자동으로 json으로 바꿔서 보내줌
	@RequestMapping("/member/checkIdDuplicate.do")
	public Map<String, Object> checkIdDuplicate(@RequestParam String userId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable
		= memberService.checkIdDuplicate(userId) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/member/nickNameDupChk.do")
	public Map<String, Object> nickChk(@RequestParam String nickName) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isUsable
			= memberService.nickNameDupChk(nickName) == 0 ? true : false;
	
		map.put("isUsable", isUsable);
		
		return map;
	}
}
















