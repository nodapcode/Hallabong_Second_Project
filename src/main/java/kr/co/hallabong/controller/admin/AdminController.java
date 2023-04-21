package kr.co.hallabong.controller.admin;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@GetMapping("/admin")
	public String adminMain() {
		return "admin/admin";
	}
}