package com.kh.aniht.magazine.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.magazine.model.service.AdMagazineService;
import com.kh.aniht.magazine.model.vo.Magazine;

@Controller
public class AdMagazineController { // 클래스 영역 시작

	@Autowired
	private AdMagazineService magazineService;
	
	// 매거진 목록 조회
	@GetMapping(value="magazine.ad")
	public String selectMagazieList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		// 페이징 처리
		int listCount = magazineService.selectMagazineListCount();
		int pageLimit = 10;
		int boardLimit = 9;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 매거진 목록 조회
		ArrayList<Magazine> list = magazineService.selectMagazineList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/magazine/magazineListView";
		
	}
	
	// 매거진 상세 조회
	@GetMapping(value="detailMaga.ad")
	public ModelAndView selectMagazine(int mno, ModelAndView mv) {
		
		Magazine ma = magazineService.selectMagazine(mno);
		
		ArrayList<Magazine> list = magazineService.selectAttachmentList(mno);
		
		System.out.println(list);
		
		mv.addObject("ma", ma).addObject("list", list).setViewName("admin/magazine/magazineDetailView");
		
		return mv;
		
	}
	
	// 매거진 등록 페이지
	@GetMapping(value="enrollFormMaga.ad")
	public ModelAndView enrollForm(ModelAndView mv) {
		
		mv.setViewName("admin/magazine/magazineEnrollForm");
		
		return mv;
		
	}
	
	// 매거진 등록
	@PostMapping(value="insertMaga.ad")
	public ModelAndView insertMagazine(Magazine magazine, String[] magazineContent, MultipartFile[] files, HttpSession session, ModelAndView mv) {
		
		ArrayList<Magazine> list = new ArrayList<>();
		
		for (int i = 0; i < files.length; i++) {
			
		    if (!files[i].getOriginalFilename().equals("")) {
		    	
		        String changeFileName = savePath(files[i], session);

		        Magazine m = new Magazine();
		        
		        m.setMagazinePath("resources/mimg/" + changeFileName);
		        m.setMagazineNo(magazine.getMagazineNo());

		        if (i < magazineContent.length) {
		        	
		            m.setMagazineContent(magazineContent[i]);
		            
		        }
		        
		        m.setMagazineImgLevel(i == 0 ? 1 : 2);

		        list.add(m);
		    }
		}
		
		// MAGAZINE 테이블에 등록
		int result1 = magazineService.insertMagazine(magazine);
		
		int result2 = 0;
		
		// MAGAZINE_ATTACHMENT 테이블에 등록
		if (!list.isEmpty()) {
			
            for(int i = 0; i < list.size(); i++) {
            	
            	result2 += magazineService.insertAttachment(list.get(i));
            	
            }
            
        }
		
		if(result1 > 0 && result2 >= list.size()) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 매거진이 등록되었습니다.");
			mv.setViewName("redirect:/magazine.ad");
			
		} else { // 실패
			
			session.setAttribute("alertMsg", "매거진 등록에 실패하였습니다.");
			mv.setViewName("redirect:/magazine.ad");
			
		}
		
		return mv;
		
	}
	
	// 매거진 삭제 
	@PostMapping(value="deleteMaga.ad")
	public String deleteMagazine(int magazineNo, Model model, HttpSession session) {
		
		int result = magazineService.deleteMagazine(magazineNo);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로  매거진이 삭제되었습니다.");
			
		} else { // 삭제
			
			session.setAttribute("alertMsg", "매거진 삭제에 실패하였습니다.");
			
		}
		
		return "redirect:/magazine.ad";
		
	}
	
	// 매거진 삭제 
	@PostMapping(value="recoverMaga.ad")
	public String recoverMagazine(int magazineNo, Model model, HttpSession session) {
		
		int result = magazineService.recoverMagazine(magazineNo);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로  매거진이 복구되었습니다.");
			
		} else { // 삭제
			
			session.setAttribute("alertMsg", "매거진 복구에 실패하였습니다.");
			
		}
		
		return "redirect:/magazine.ad";
		
	}
	
	// 매거진 수정 페이지
	@PostMapping(value="updateFormMaga.ad")
	public ModelAndView updateForm(int magazineNo, ModelAndView mv) {
		
		Magazine ma = magazineService.selectMagazine(magazineNo);
		
		ArrayList<Magazine> list = magazineService.selectAttachmentList(magazineNo);
		
		mv.addObject("ma", ma).addObject("list", list).setViewName("admin/magazine/magazineUpdateForm");
		
		return mv;
		
	}
	
	// 매거진 수정
	@PostMapping(value="updateMaga.ad")
	public ModelAndView updateMagazine(Magazine magazine, int[] magazineAttachmentNo, String[] magazineContent, String[] beforePath, MultipartFile[] files, HttpSession session, ModelAndView mv) {
		
		// 파일수정X : filename 이 X
		// 파일 수정 또는 추가 : filename 이 O
		
		ArrayList<Magazine> list1 = new ArrayList<>(); // update
		ArrayList<Magazine> list2 = new ArrayList<>(); // insert
		
		for (int i = 0; i < files.length; i++) { 
			
			if(i < magazineAttachmentNo.length) { // 매거진 기존 내용
				
				if (files[i].getOriginalFilename().equals("")) { // 파일 수정 X, 내용 수정 
			    	
			        Magazine m = new Magazine();
			        
			        m.setMagazineNo(magazine.getMagazineNo());

			        if (i < magazineContent.length) {
			        	
			            m.setMagazineContent(magazineContent[i]);
			            
			        }
			        
			        if (i < magazineAttachmentNo.length) {
			        	
			            m.setMagazineAttachmentNo(magazineAttachmentNo[i]);
			            
			        }
			        
			        m.setMagazineImgLevel(i == 0 ? 1 : 2);

			        list1.add(m);
			        
			    } else { // 파일 수정 O, 내용 수정 
			    	
			    	// 기존파일 삭제
			    	String realPath = session.getServletContext().getRealPath(beforePath[i]);
			    	new File(realPath).delete(); 
			    	
			    	// 파일명 수정 작업
			    	String changeFileName = savePath(files[i], session);

			        Magazine m = new Magazine();
			        
			        m.setMagazinePath("resources/mimg/" + changeFileName);
			        m.setMagazineNo(magazine.getMagazineNo());

			        // 수정내용이 있다면
			        if (i < magazineContent.length) {
			        	
			            m.setMagazineContent(magazineContent[i]);
			            
			        }
			        
			        // 수정파일번호가 있다면
			        if (i < magazineAttachmentNo.length) {
			        	
			            m.setMagazineAttachmentNo(magazineAttachmentNo[i]);
			            
			        }
			        
			        m.setMagazineImgLevel(i == 0 ? 1 : 2);

			        list1.add(m);
			    	
			    }
				
			} else { // 매거진 추가 내용
				
				if (!files[i].getOriginalFilename().equals("")) { // 파일 O
			    	
			        String changeFileName = savePath(files[i], session);

			        Magazine m = new Magazine();
			        
			        m.setMagazinePath("resources/mimg/" + changeFileName);
			        m.setMagazineNo(magazine.getMagazineNo());

			        if (i < magazineContent.length) {
			        	
			            m.setMagazineContent(magazineContent[i]);
			            
			        }
			        
			        m.setMagazineImgLevel(i == 0 ? 1 : 2);

			        list2.add(m);
			        
			    }
				
			}
		    
		} 
		
		// 기존 매거진 내용 수정
		int result = magazineService.updateMagazine(magazine);
		
		// 기존 매거진 ATTACHMENT 수정 UPDATE
		int result1 = 0;
		
		// MAGAZINE_ATTACHMENT 테이블에 수정
		if (!list1.isEmpty()) {
			
            for(int i = 0; i < list1.size(); i++) {
            	
            	result1 += magazineService.updateAttachment(list1.get(i));
            	
            }
            
        }
		
		// 매거진 새로운 ATTACHMENT 추가 INSERT
		int result2 = 0;
		
		// 기존 매거진의 MAGAZINE_ATTACHMENT 테이블에 등록
		if (!list2.isEmpty()) {
			
            for(int i = 0; i < list2.size(); i++) {
            	
            	result2 += magazineService.insertExistingAttachment(list2.get(i));
            	
            }
            
        }
		
		if(result > 0 || result1 >= list1.size() || result2 >= list2.size()) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 매거진이 수정되었습니다.");
			mv.setViewName("redirect:/detailMaga.ad?mno=" + magazine.getMagazineNo());
			
		} else { // 실패
			
			session.setAttribute("alertMsg", "매거진 수정에 실패하였습니다.");
			mv.setViewName("redirect:/detailMaga.ad?mno=" + magazine.getMagazineNo());
			
		}
		
		return mv;
		
	}
	
	
	// -----------------------------------------------------------------------------------------------------
	
	// 현재 넘어온 첨부차일 그 자체를 서버의 폴더로 저장시키는 메소드
	// > 일반메소드 BoardController 에 만들고 있음
	// > Controller 클래스에 url 을 요청하는 메소드만 있다라는 법은 없음
	//   즉, 일반메소드도 내가 필요하다면 막 만들어서 호출해도됨!!
	public String savePath(MultipartFile upfile, HttpSession session) {
		
		// 1. 원본파일명 뽑아오기
		String originName = upfile.getOriginalFilename(); // "bono.jpg"
		
		// 2. 시간 형식으로 문자열로 뽑아내기
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// "20240521161430" (년월일시분초)
		
		// 3. 뒤에 붙을 5자리 랜덤수 얻어내기 (10000 ~ 99999)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 4. 원본파일명으로부터 확장자명 뽑기
		String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"
		
		// 5. 2 ~ 4 까지 모두 이어 붙이기
		String changeName = currentTime + ranNum + ext;
		
		// 6. 업로드하고자 하는 물리적인 서버의 경로 알아내기
		// (webapp/resources/uploadFiles/~~)
		String savePath = session.getServletContext().getRealPath("/resources/mimg/");
		// 7. 경로와 수정파일명 합체 후 파일을 업로드해주기
		// > MultipartFile 객체가 제공하는 transferTo 메소드를 이용함
		try {
			
			upfile.transferTo(new File(savePath + changeName));
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		// 수정파일명 문자열을 리턴
		return changeName;

	}
	
} // 클래스 영역 끝
