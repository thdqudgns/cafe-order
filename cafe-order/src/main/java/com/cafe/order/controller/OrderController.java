package com.cafe.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.cafe.order.model.Order;
import com.cafe.order.model.service.OrderService;

@Controller
public class OrderController {
	
	private OrderService orderService;
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}
	
	@GetMapping("/")
	public String menu(Model model) throws Exception {
		model.addAttribute("kinds", orderService.getKinds());
		model.addAttribute("menuList", orderService.menuList());
		return "order/menu";
	}
	
	@PostMapping("/order")
	public String order(Order order) {
		
		return "redirect:/";
	}
	

}
