package com.kh.aniht.map.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {
	
	@GetMapping("map.ma")
	public String Map() {
		
		
		return "map/map";
	}

}
