package com.hta.project.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hta.project.domain.Category;
import com.hta.project.domain.Member;
import com.hta.project.domain.Notice;
import com.hta.project.domain.Product;
import com.hta.project.service.AdminService;
import com.hta.project.service.MemberService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping(value="/main")
	public String main() {
		logger.info("Admin main()");
		return "jjs/admin/main";
	}
	
	@GetMapping("/userList")
	public ModelAndView userList(@RequestParam(value="page", defaultValue="1", required=false) int page,
			ModelAndView mv) {
		logger.info("Admin userList()");
		
		int limit = 7;
		
		int listcount = memberService.getListCount();
		
		int maxpage = (listcount + limit - 1) / limit;
		
		int startpage = ((page - 1) / 10) * 10 + 1;
		
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		List<Member> userlist = memberService.getUserList(page, limit);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("userlist", userlist);
		mv.addObject("limit", limit);
		
		mv.setViewName("jjs/admin/userList");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/userList_search")
	public Map<String, Object> userList_search(
			@RequestParam(value="page", defaultValue="1", required = false) int page,
			@RequestParam(value="search_word", required=false) String search_word){
		
		int limit = 7;
		int listcount = 0;
		if(search_word != "") {
			listcount = memberService.getSearchListCount(search_word);
		}else {
			listcount = memberService.getListCount();
		}
		
		int maxpage = (listcount + limit - 1) / limit;
		
		int startpage = ((page - 1) / 10) * 10 + 1;
		
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		List<Member> userlist = new ArrayList<Member>();
		if(search_word != "") {
			userlist = memberService.getSearchList(search_word, page, limit);
		}else{
			userlist = memberService.getUserList(page, limit);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("listcount", listcount);
		map.put("userlist", userlist);
		map.put("limit", limit);
		return map;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/main_userList")
	public Map<String, Object> main_userList(){
		
		List<Member> userlist = memberService.getUserList(1, 2);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userlist", userlist);
		
		return map;
	}
	
	@GetMapping("/userInfo")
	public ModelAndView userInfo(String id, ModelAndView mv, 
			HttpServletRequest request) {
		logger.info("Admin userInfo()");
		
		Member m = memberService.member_info(id);
		
		if(m == null) {
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "해당 정보가 없습니다.");
		}else {
			mv.addObject("memberInfo", m);
			mv.setViewName("jjs/admin/userInfo");
		}
		
		return mv;
	}
	
	@GetMapping("/userDelete")
	public String userDelete(String id) {
		logger.info("Admin userDelete()");
		memberService.delete(id);
		return "redirect:userList";
	}
	
	@GetMapping("/postList")
	public ModelAndView postList(@RequestParam(value="page", defaultValue="1", required=false) int page, 
			   ModelAndView mv) {
		logger.info("Admin postList()");
		
		int limit = 7;
		
		int listcount = adminService.getListCount();
		
		int maxpage = (listcount + limit - 1) / limit;
		
		int startpage = ((page - 1) / 10) * 10 + 1;
		
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		List<Notice> noticelist = adminService.getNoticeList(page, limit);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("noticelist", noticelist);
		mv.addObject("limit", limit);
		
		mv.setViewName("jjs/admin/noticeList");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/noticeList_search")
	public Map<String, Object> noticeList_search(
			@RequestParam(value="page", defaultValue="1", required = false) int page,
			@RequestParam(value="search_word", required=false) String search_word){
		
		int limit = 7;
		int listcount = 0;
		if(search_word != "") {
			listcount = adminService.getSearchListCount(search_word);
		}else {
			listcount = adminService.getListCount();
		}
		
		int maxpage = (listcount + limit - 1) / limit;
		
		int startpage = ((page - 1) / 10) * 10 + 1;
		
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		List<Notice> noticelist = new ArrayList<Notice>();
		if(search_word != "") {
			noticelist = adminService.getSearchNoticeList(page, limit, search_word);
		}else{
			noticelist = adminService.getNoticeList(page, limit);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("listcount", listcount);
		map.put("noticelist", noticelist);
		map.put("limit", limit);
		return map;
		
	}
	
	@PostMapping("/noticeAdd")
	public String noticeAdd(Notice notice) {
		logger.info("Admin noticeAdd()");
		
		adminService.insert(notice);
		
		return "redirect:postList";
	}
	
	@PostMapping("/noticeModify")
	public String noticeModify(Notice notice, 
			HttpServletRequest request, Model model) {
		logger.info("Admin noticeModify()");
		
		int result = adminService.noticeModify(notice);
		
		if(result == 0) {
			logger.info("공지사항 글 수정 실패");
			model.addAttribute("url", request.getRequestURL());
			model.addAttribute("message", "공지사항 글 수정 실패입니다.");
			return "jjs/error/error";
		}
		
		return "redirect:noticeDetail?num=" + notice.getNOTICE_NUM();
	}
	
	@GetMapping("/noticeDetail")
	public ModelAndView noticeDetail(int num, ModelAndView mv,
				HttpServletRequest request) {
		logger.info("Admin noticeDetail()");
		
		Notice notice = adminService.getDetail(num);
		
		if(notice == null) {
			logger.info("공지사항 상세보기 실패");
			mv.setViewName("jjs/error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "공지사항 상세보기 실패입니다.");
		}else {
			logger.info("공지사항 상세보기 성공");
			mv.setViewName("jjs/admin/noticeDetail");
			mv.addObject("notice", notice);
		}
		
		return mv;
	}
	
	@PostMapping("/noticeFixUpdate")
	@ResponseBody
	public Map<String, Object> noticeFixUpdate(int num,
			@RequestParam(value="fix", required=false) String fix){
		logger.info("Admin noticeFixUpdate()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = adminService.noticeFixUpdate(num, fix);
		
		Notice notice = adminService.noticeSelect(num);
		
		map.put("result", result);
		map.put("notice", notice);
		
		return map;
	}
	
	@PostMapping("/noticeSelect")
	@ResponseBody
	public Map<String, Object> noticeSelect(int num){
		logger.info("Admin noticeSelect()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Notice notice = adminService.noticeSelect(num);
		
		map.put("notice", notice);
		
		return map;
	}
	
	@PostMapping("/noticeSelectionDelete")
	@ResponseBody
	public void noticeSelectionDelete(
			@RequestParam("valueArr") int[] noticeArr,
			HttpServletResponse response) throws Exception{
		logger.info("Admin noticeSelectionDelete()");
		int result = adminService.noticeSelectionDel(noticeArr);
		response.getWriter().print(result);
	}
	
	@PostMapping("/noticeDelete")
	public String noticeDelete(int num, HttpServletRequest request,
			Model mv) throws Exception {
		int result = adminService.noticeDelete(num);
		
		if(result == 0) {
			logger.info("공지사항 글 삭제 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "삭제 실패");
			return "error/error";
		}
		
		logger.info("공지사항 글 삭제 성공");
		return "redirect:postList";
	}
	
	@GetMapping("/farmPostList")
	public String farmPostList() {
		logger.info("Admin farmPostList()");
		return "jjs/admin/farmPostList";
	}
	
	@GetMapping("/farmPostDetail")
	public String farmPostDetail() {
		logger.info("Admin farmPostDetail()");
		return "jjs/admin/farmPostDetail";
	}
	
	@GetMapping("/farmList")
	public String farmList() {
		logger.info("Admin farmList()");
		return "jjs/admin/farmList";
	}
	
	@PostMapping("/categoryList")
	@ResponseBody
	public Map<String, Object> categoryList() {
		logger.info("Admin categoryList()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Category> categoryList = adminService.getCategoryList();
		
		map.put("categoryList", categoryList);
		
		return map;
	}
	
	@PostMapping("/productAdd")
	public String productAdd(Product product, HttpServletRequest request) throws Exception{
		logger.info("Admin productAdd()");
		
		MultipartFile uploadfile = product.getUploadfile();
		
		if(!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
			product.setProduct_original(fileName); // 원래 파일명 저장
			String saveFolder = request.getSession().getServletContext().getRealPath("resources") + "/upload/";
			String fileDBName = fileDBName(fileName, saveFolder);
			logger.info("fileDBName = " + fileDBName);
			
			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			
			// 바뀐 파일명으로 저장
			product.setProduct_img(fileDBName);
		}
		
		adminService.productAdd(product);
		
		return "redirect:productList";
	}
	
	private String fileDBName(String fileName, String saveFolder) {
		// 새로운 폴더 이름 : 오늘 년+월+일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); // 오늘 년도 구합니다.
		int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구합니다.
		int date = c.get(Calendar.DATE); // 오늘 일 구합니다.
		
		String homedir = saveFolder + year + "-" + month + "-" + date;
		logger.info(homedir);
		File path1 = new File(homedir);
		if((!path1.exists())) {
			path1.mkdir(); // 새로운 폴더를 생성
		}
		
		// 난수를 구합니다.
		Random r = new Random();
		int random = r.nextInt(100000000);
		
		/**** 확장자 구하기 시작 ****/
		int index = fileName.lastIndexOf(".");
		// 문자열에서 특정 문자열의 위치 값(index)를 반환합니다.
		// indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
		// lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
		// (파일명에 점에 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
		logger.info("index = " + index);
		
		String fileExtension = fileName.substring(index + 1);
		logger.info("fileExtension = " + fileExtension);
		/**** 확장자 구하기 끝 ****/
		
		// 새로운 파일명
		String refileName = "product" + year + month + date + random + "." + fileExtension;
		logger.info("refileName = " + refileName);
		
		// 오라클 디비에 저장될 파일 명
		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		logger.info("fileDBName = " + fileDBName);
		return fileDBName;
	}
	
	@GetMapping("/productList")
	public ModelAndView productList(@RequestParam(value="page", defaultValue="1", required = false) int page,
			ModelAndView mv) {
		logger.info("Admin productList()");
		
		int limit = 5;
		
		int listcount = adminService.getProductListCount();
		
		int maxpage = (listcount + limit - 1) / limit;
		
		int startpage = ((page - 1) / 10) * 10 + 1;
		
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		List<Product> productlist = adminService.getProductList(page, limit);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("productlist", productlist);
		mv.addObject("limit", limit);
		
		mv.setViewName("jjs/admin/productList");
		return mv;
	}
	
	@PostMapping("/productDetail")
	@ResponseBody
	public Map<String, Object> productDetail(String code) {
		logger.info("Admin productDetail()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Product product = adminService.getProductDetail(code);
		
		map.put("product", product);
		
		return map;
	}
	
	@GetMapping("/orderList")
	public String orderList() {
		logger.info("Admin orderList()");
		return "jjs/admin/orderList";
	}
	
	@GetMapping("/orderDetail")
	public String orderDetail() {
		logger.info("Admin orderDetail()");
		return "jjs/admin/orderDetail";
	}

}
