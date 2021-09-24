package com.hta.project.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainController {

	private static final Logger logger
    = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mv) {
		  mv.setViewName("main/main");
		  return mv;
	}
	
	//굿즈 장터 메인 이동 
	@RequestMapping("/shopmain")
	public String shop_main() {		
		return "hyun/shop/shop_main";
	}
	
	//굿즈 장터 퍼스나콘 페이지 이동 
	@RequestMapping("/personacon")
	public String shop_personacon() {		
		return "hyun/shop/shop_personacon";
	}
		
	//굿즈 장터 주말굿즈 이동 
	@RequestMapping("/goods")
	public String shop_goods() {		
		return "hyun/shop/shop_goods";
	}

	//굿즈 장터 농기구 이동 
	@RequestMapping("/tools")
	public String shop_tools() {		
		return "hyun/shop/shop_tools";
	}
	
	//굿즈 장터 씨앗/모종 이동 
		@RequestMapping("/seed")
		public String shop_seed() {		
			return "hyun/shop/shop_seed";
		}
		
	//굿즈 장터 비료/상토 이동 
		@RequestMapping("/soil")
		public String shop_soil() {		
			return "hyun/shop/shop_soils";
		}
		
	//굿즈 장터 살충제 이동 
		@RequestMapping("/pesticide")
		public String shop_pesticide() {		
			return "hyun/shop/shop_pesticide";
	}
					
	//회원가입 바로가기 이동 
	@RequestMapping("/join")
	public String join() {		
		return "woo/join";
	}
	
	//로그인 바로가기 이동 
	@RequestMapping("/login")
	public String login() {		
		return "woo/login";
	}
}
