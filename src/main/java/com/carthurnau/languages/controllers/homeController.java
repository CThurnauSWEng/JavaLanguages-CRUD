package com.carthurnau.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.carthurnau.languages.models.Language;
import com.carthurnau.languages.services.LanguageService;

@Controller
public class homeController {
	
	private final LanguageService languageService;
	
	public homeController(LanguageService languageService) {
		this.languageService = languageService;
	}

	@RequestMapping("")
	public String dashboard(Model model) {
		
		// go get all languages from the DB
		List<Language> allLanguages = languageService.allLanguages();
		model.addAttribute("allLanguages", allLanguages);
		
		// send a language object to the jsp so that it can link to the model
		Language language = new Language();
		model.addAttribute("language",language);
		
		return "dashboard.jsp";
	}
	
	@RequestMapping(value="/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Language language = languageService.findLanguage(id);
		model.addAttribute("language",language);
		return "showLanguage.jsp";
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String processNew(@Valid @ModelAttribute("language") Language language, BindingResult result) {
		if (result.hasErrors()) {
			return "dashboard.jsp";
		} else {
			languageService.createLanguage(language);
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/delete/{id}")
	public String deleteLanguage(@PathVariable("id") Long id, Model model) {
		languageService.deleteLanguage(id);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/edit/{id}")
	public String editLanguage(@PathVariable("id") Long id, Model model) {
		Language language = languageService.findLanguage(id);
		model.addAttribute("language", language);
		return "editForm.jsp";
	}
	
	@RequestMapping(value = "/processEdit/{id}", method = RequestMethod.POST)
	public String processEdit(@PathVariable("id") Long id, @Valid @ModelAttribute("language") Language language, BindingResult result){
		System.out.println("in processEdit, id: " + id);
		if (result.hasErrors()) {
			return "/edit/" + id;
		} else {
			language.setId(id);
			languageService.updateLanguage(language);
			return "redirect:/";
		}
	}
}
