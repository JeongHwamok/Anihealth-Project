package com.kh.aniht.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.product.model.service.AdProductService;
import com.kh.aniht.product.model.vo.Effect;
import com.kh.aniht.product.model.vo.Product;

@Controller
public class AdProductController { // 클래스 영역 시작
	
	@Autowired
	private AdProductService productService;

	// 영양제 목록조회 (+ 페이징처리)
	@GetMapping(value="product.ad")
	public String selectProductList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
									@RequestParam(value="keyword", required=false) String keyword,
									Model model ) {
		
		// 페이징 처리
		int listCount = productService.selectProductListCount(keyword);
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 영양제 목록조회
		ArrayList<Product> list = productService.selectProductList(pi, keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		
		if (list.isEmpty()) {
            model.addAttribute("noResults", true);
        }
		
		return "admin/product/productListView";
		
	}
	
	// 영양제 상세조회 
	@GetMapping(value="detailProduct.ad")
	public ModelAndView selectProduct(int pno, ModelAndView mv) {
		
		Product p = productService.selectProduct(pno);
		
		ArrayList<Effect> e = productService.selectEffect(pno);
		ArrayList<Effect> se = productService.selectSideEffect(pno);
		
		mv.addObject("p", p).addObject("e", e).addObject("se", se).setViewName("admin/product/productDetailView");
		
		return mv;
		
	}
	
	// 영양제 등록 페이지 
	@GetMapping(value="enrollFormProduct.ad")
	public ModelAndView enrollForm(ModelAndView mv) {
		
		mv.setViewName("admin/product/productEnrollForm");
		
		return mv;
		
	}
	
	// 영양제 등록
	@PostMapping(value="insertProduct.ad")
	public ModelAndView insertProduct(Product p, String[] effect, String[] sideEffect, MultipartFile[] upfiles, HttpSession session, ModelAndView mv) {
		
		MultipartFile thumbnail = null;
		MultipartFile detail = null;
		
		for(int i = 0; i < upfiles.length; i++) {
			
			switch(i) {
			
				case 0 : thumbnail = upfiles[i]; break;
				case 1 : detail = upfiles[i]; break;
			
			}
			
		}
		
		// 요청 시 전달된 파일이 있을 경우
		if(!thumbnail.getOriginalFilename().equals("") && !detail.getOriginalFilename().equals("")) {
			
			// 파일명 수정 작업
			String changeThumbnail = savePath(thumbnail, session);
			String changeDetail = savePath(detail, session);
			
			// VO 객체에 담기
			p.setProductThumbnailPath("resources/pimg/" + changeThumbnail);
			p.setProductDetailPath("resources/pimg/" + changeDetail);
			
		}
		
		// 영양제 등록
		int productResult = productService.insertProduct(p);
		
		// 영양제 상품번호 조회
		int productNo = productService.selectProductNo();
		
		// 효능 등록
		int effectResult = 0;
		for(int i = 0; i < effect.length; i++) {
			
			int itemEffect = Integer.parseInt(effect[i]);
			
			effectResult += productService.insertEffect(itemEffect, productNo);
			
		}
		
		// 부작용 등록
		int sideEffectResult = 0;
		
		if(sideEffect != null) {
			
			for(int i = 0; i < sideEffect.length; i++) {
				
				int itemSideEffect = Integer.parseInt(sideEffect[i]);
				
				sideEffectResult += productService.insertSideEffect(itemSideEffect, productNo);
				
			}
			
		}
		
		if((productResult > 0 && effectResult >= effect.length) || sideEffectResult >= sideEffect.length) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 상품이 등록되었습니다.");
			mv.setViewName("redirect:/product.ad");
			
		} else { // 실패
			
			session.setAttribute("alertMsg", "상품 등록에 실패하였습니다.");
			mv.setViewName("redirect:/product.ad");
			
		}
		
		return mv;
		
	}
	
	// 영양제 수정 페이지
	@PostMapping(value="updateFormProduct.ad")
	public ModelAndView updateForm(int pno, ModelAndView mv) {
		
		Product p = productService.selectProduct(pno);
		
		ArrayList<Effect> e = productService.selectEffect(pno);
		ArrayList<Effect> se = productService.selectSideEffect(pno);
		
		mv.addObject("p", p).addObject("e", e).addObject("se", se).setViewName("admin/product/productUpdateForm");
		
		return mv;
		
	}
	
	// 영양제 수정
	@PostMapping(value="updateProduct.ad")
	public ModelAndView updateProduct(Product p, String[] effect, String[] sideEffect, MultipartFile[] upfiles, HttpSession session, ModelAndView mv) {
		
		if(upfiles != null && upfiles.length != 0) {
			
			for(int i = 0; i < upfiles.length; i++) {
				
				// 새로운 첨부파일이 있을 경우
				if(upfiles[i] != null && !upfiles[i].getOriginalFilename().equals("")) {
					
					switch(i) {
					
						case 0 
							  // 기존 파일 서버에서 삭제
							: String thumbnailRealPath = session.getServletContext().getRealPath(p.getProductThumbnailPath());
							  new File(thumbnailRealPath).delete(); 
							  // 파일명 수정 작업
							  String changeThumbnail = savePath(upfiles[i], session);
							  // VO 객체에 담기
							  p.setProductThumbnailPath("resources/pimg/" + changeThumbnail);
							  break;
						case 1 
							  // 기존 파일 서버에서 삭제
							: String detailRealPath = session.getServletContext().getRealPath(p.getProductDetailPath());
						      new File(detailRealPath).delete(); 
						      // 파일명 수정 작업
						      String changeDetail = savePath(upfiles[i], session);
						  	  // VO 객체에 담기	
							  p.setProductDetailPath("resources/pimg/" + changeDetail);
							  break;
					
					}
					
				}
				
			}
			
		}
		
		// 영양제 수정
		int result = productService.updateProduct(p);
		
		// 효능 수정 : delete 후 insert
		int effectResult = 0;
		
		int resultE = productService.deleteEffect(p.getProductNo());
		
		for(int i = 0; i < effect.length; i++) {
			
			int itemEffect = Integer.parseInt(effect[i]);
			
			effectResult += productService.insertEffect(itemEffect, p.getProductNo());
			
		}
		
		// 부작용 수정 : delete 후 insert
		int sideEffectResult = 0;
		
		int resultSE = productService.deleteSideEffect(p.getProductNo());
		
		if(sideEffect != null) {
			
			for(int i = 0; i < sideEffect.length; i++) {
				
				int itemSideEffect = Integer.parseInt(sideEffect[i]);
				
				sideEffectResult += productService.insertSideEffect(itemSideEffect, p.getProductNo());
				
			}
			
		}
		
		if((result > 0 && effectResult >= effect.length) || sideEffectResult >= sideEffect.length) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 상품이 수정되었습니다.");
			mv.setViewName("redirect:/detailProduct.ad?pno=" + p.getProductNo());
			
		} else { // 실패
			
			session.setAttribute("alertMsg", "상품 수정에 실패하였습니다.");
			mv.setViewName("redirect:/detailProduct.ad?pno=" + p.getProductNo());
			
		}
		
		return mv;
		
	}
	
	// 영양제 삭제
	@PostMapping(value="deleteProduct.ad")
	public String deleteProduct(int pno, Model model, HttpSession session) {
		
		int result = productService.deleteProduct(pno);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 상품이 삭제되었습니다.");
			
		} else { // 삭제
			
			session.setAttribute("alertMsg", "상품 삭제에 실패하였습니다.");
			
		}
		
		return "redirect:/product.ad";
		
	}
	
	// 영양제 삭제
	@PostMapping(value="recoverProduct.ad")
	public String recoverProduct(int pno, Model model, HttpSession session) {
		
		int result = productService.recoverProduct(pno);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 상품이 복구되었습니다.");
			
		} else { // 삭제
			
			session.setAttribute("alertMsg", "상품 복구에 실패하였습니다.");
			
		}
		
		return "redirect:/product.ad";
		
	}
	
	// 카테고비별 재고 순위 조회
	@ResponseBody
	@PostMapping(value="rankStock.ad", produces="application/json; charset=UTF-8")
	public String selectDeliveryCount() {
		
		List<Map<String, Object>> list = productService.selectStockRank();
		
		return new Gson().toJson(list);
	
		
	}
	
	// ----------------------------------- 일반 메소드 -----------------------------------
	
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
		String savePath = session.getServletContext().getRealPath("/resources/pimg/");
		
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

