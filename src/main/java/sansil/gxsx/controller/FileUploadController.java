package sansil.gxsx.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.service.FileUploadservice;
import filesetting.Path;
import sansil.gxsx.domain.FindItem;

@Log4j
@RequestMapping("file")
@Controller
@AllArgsConstructor
public class FileUploadController {
	private FileUploadservice service; //Spring 4.3~ : AutoInjection
	
	@GetMapping("list")
	public ModelAndView fileList() {
		File fStore = new File(Path.FILE_STORE2);
		if(!fStore.exists()) fStore.mkdirs();
		File files[] = fStore.listFiles();
		
		return new ModelAndView("file/list", "files", files);		
	}
	@GetMapping("/form")
	public String formFu() {
		return "file/form";
	}
	@GetMapping("/download")
	public ModelAndView download(@RequestParam String fname) {
		File file = new File(Path.FILE_STORE2, fname);
		if(file.exists()) {
			return new ModelAndView("fileDownloadView", "downloadFile", file);
		}else {
			return new ModelAndView("redirect:list");
		}
	}
	@PostMapping("/upload")
	public String upload(@RequestParam String name, @RequestParam MultipartFile file) {
		//log.info("name: " + name + ", file: " + file);
		
		String ofname = file.getOriginalFilename();
		if(ofname != null) {
			ofname = ofname.trim();
			if(ofname.length() != 0) {
				String url = service.saveStore(file);
				//log.info("m15() url: " + url);
			}
		}
		
		return "redirect:list";
	}
	@GetMapping("/del")
	public String del(@RequestParam String fname) {
		File file = new File(Path.FILE_STORE2, fname);
		if(file.exists()) {
			file.delete();
		}
		
		return "redirect:list";
	}
	
	@GetMapping("/form_mt")
	public String formFuMt() {
		return "file/form_mt";
	}
	@PostMapping("/upload_mt")
	public String uploadMt(@RequestParam ArrayList<MultipartFile> files) {
		for(MultipartFile file : files) {
			String ofname = file.getOriginalFilename();
			if(ofname != null) {
				ofname = ofname.trim();
				if(ofname.length() != 0) {
					String url = service.saveStore(file);
				}
			}
		}
		
		return "redirect:list";
	}
	
}
