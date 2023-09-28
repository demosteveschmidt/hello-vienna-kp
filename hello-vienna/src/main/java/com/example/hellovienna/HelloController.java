package com.example.hellovienna;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

	@GetMapping("/")
	public String index() {
		return "\uD83D\uDE00 Greeting Vienna \uD83C\uDDE6\uD83C\uDDF9 from Spring Boot REST!"; // Smiley + Austria
		// return "Greeting from \uD83C\uDF31 Spring Boot REST!"; // Seedling
		// return "Greeting from \uD83D\uDC33 and \uD83C\uDF31 Spring Boot REST!"; // Whale + Seedling
	}

	@GetMapping("/host")
	public String hostname() {
		String message = "Generation 1 running on: " + System.getenv("HOSTNAME");
		return message;
	}
	
}
