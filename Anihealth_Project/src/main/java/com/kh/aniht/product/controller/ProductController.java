package com.kh.aniht.product.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.member.model.vo.Member;
import com.kh.aniht.product.model.service.ProductService;
import com.kh.aniht.product.model.vo.Effect;
import com.kh.aniht.product.model.vo.Product;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("list.pd")
    public String productList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
                              @RequestParam(value="order", defaultValue="newest") String order,
                              @RequestParam(value="category", required=false) String category,
                              @RequestParam(value="keyword", required=false) String keyword,
                              Model model) {

        PageInfo pi = Pagination.getPageInfo(productService.selectProductListCount(category, keyword), currentPage, 10, 8);
        ArrayList<Product> list;

        if ((category == null || category.isEmpty()) && (keyword == null || keyword.isEmpty())) {
            list = productService.selectProductList(pi, order);
        } else {
            list = productService.selectFilteredProductList(pi, order, category, keyword);
        }

        model.addAttribute("pi", pi);
        model.addAttribute("list", list);
        model.addAttribute("selectedCategory", category);
        model.addAttribute("searchKeyword", keyword);

        if (list.isEmpty()) {
            model.addAttribute("noResults", true);
        }

        return "product/productListView";
    }
    @GetMapping("search.pd")
    public String searchProduct(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
                                @RequestParam(value="order", defaultValue="newest") String order,
                                @RequestParam(value="category", required=true) String category,
                                @RequestParam(value="keyword", required=true) String keyword,
                                RedirectAttributes redirectAttributes) {

       // System.out.println("Search Category: " + category);
        //System.out.println("Search Keyword: " + keyword);

        PageInfo pi = Pagination.getPageInfo(productService.selectProductListCount(category, keyword), currentPage, 10, 8);
        ArrayList<Product> list;

        list = productService.selectFilteredProductList(pi, order, category, keyword);

        if (list.isEmpty()) {
            redirectAttributes.addFlashAttribute("noResults", true);
            return "redirect:/list.pd";
        }

        redirectAttributes.addFlashAttribute("pi", pi);
        redirectAttributes.addFlashAttribute("list", list);
        redirectAttributes.addFlashAttribute("selectedCategory", category);
        redirectAttributes.addFlashAttribute("searchKeyword", keyword);

        return "redirect:/list.pd";
    }


    // 영양제 상세조회 
    @GetMapping("detail.pd")
    public ModelAndView selectProductDetail(@RequestParam("pno") int productNo, ModelAndView mv, HttpSession session) {
     //   System.out.println("Controller: Fetching product details for productNo: " + productNo);
        Product product = productService.selectProductDetail(productNo);
        
        if (product != null) {
           // System.out.println("Controller: Fetched product: " + product);
        	 mv.addObject("product", product);
        	 
        	   ArrayList<Effect> effects = productService.selectEffectsByProductNo(productNo);
				/*
				 * for(Effect e : effects) { System.out.println(e); }
				 */
        	   
               ArrayList<Effect> sideEffects = productService.selectSideEffectsByProductNo(productNo);
               
               // 효능과 부작용 정보를 모델에 추가
               mv.addObject("effects", effects);
               mv.addObject("sideEffects", sideEffects);

               mv.setViewName("product/productDetailView");
               
               // System.out.println(effects);
               // System.out.println(sideEffects);
            
        } else {
           // System.out.println("Controller: Product not found for productNo: " + productNo);
            session.setAttribute("alertMsg", "존재하지 않는 페이지입니다.");
            
            mv.setViewName("redirect:/list.pd");
        }
        
        return mv;
    }
    
    
    @ResponseBody
    @GetMapping(value = "rating.pd", produces="application/json; charset=UTF-8")
    public String selectRating(int[] productNoArr) {
    	ArrayList<HashMap<String, Object>> rList = productService.selectRating(productNoArr); 	
    	
    	//System.out.println(rList);
    	
    	return new Gson().toJson(rList);
		
	}
    
    
    // 로그인 확인
    @ResponseBody
    @GetMapping(value="checkLogin1", produces="application/json; charset=UTF-8")
    public String checkLogin(HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser != null) {
            return "{\"loggedIn\": true, \"userNo\": " + loginUser.getUserNo() + "}";
        } else {
            return "{\"loggedIn\": false}";
        }
    }

    // 위시리스트 추가/삭제 처리
    @ResponseBody
    @PostMapping(value="toggleHeart.pd", produces="application/json; charset=UTF-8")
    public String toggleHeart(@RequestBody Product product, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "{\"success\": false, \"message\": \"로그인이 필요합니다.\"}";
        }

        int userNo = loginUser.getUserNo();
        int productNo = product.getProductNo();

        // 위시리스트에 추가되어 있는지 확인
        boolean isAdded = productService.checkWishlist(userNo, productNo);

        if (!isAdded) {
            // 위시리스트에 추가
            boolean result = productService.addToWishlist(userNo, productNo);
            if (result) {
                return "{\"success\": true, \"added\": true, \"message\": \"찜한 제품에 추가 되었습니다.\"}";
            } else {
                return "{\"success\": false, \"message\": \"찜한 제품 추가에 실패했습니다 .\"}";
            }
        } else {
            // 위시리스트에서 삭제
            boolean result = productService.removeFromWishlist(userNo, productNo);
            if (result) {
                return "{\"success\": true, \"added\": false, \"message\": \"찜한 제품에 삭제되었습니다.\"}";
            } else {
                return "{\"success\": false, \"message\": \"찜한 제품 삭제에 실패했습니다.\"}";
            }
        }
    }
    
		
		@ResponseBody
		@GetMapping(value="checkWishlistStatus", produces="application/json; charset=UTF-8")
		public String checkWishlistStatus(@RequestParam int productNo, HttpSession session) {
		    Member loginUser = (Member) session.getAttribute("loginUser");
		    if (loginUser == null) {
		        return "{\"inWishlist\": false}";
		    }
		
		    int userNo = loginUser.getUserNo();
		    boolean inWishlist = productService.checkWishlist(userNo, productNo);
		    return "{\"inWishlist\": " + inWishlist + "}";
		}

    // 메인페이지 베스트 9 제품 조회용  - 정민
	@ResponseBody
	@GetMapping(value="selectBest.ad", produces="application/json; charset=UTF-8")
	public String selectBestProduct() {
		
		ArrayList<Product> list = productService.selectBestProduct();
		
		return new Gson().toJson(list);
		
	}

    
    

}
