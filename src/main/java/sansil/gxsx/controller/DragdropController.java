package sansil.gxsx.controller;
// 파일 업로드 관련 Controller
import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FindItem;
import sansil.gxsx.service.FileUploadservice;
import sansil.gxsx.service.FindItemService;

@Log4j
@RequestMapping("file")
@Controller
public class DragdropController {

	@Resource(name = "FindItem")
	FindItemService findItemService;
	@Autowired
	FileUploadservice uploadservice;

	@RequestMapping(value = "/fileUpload", method = RequestMethod.GET)
	public String dragAndDrop(Model model) {

		return "drag_drop/form";

	}

	@RequestMapping(value = "/write2.do") // ajax에서 호출하는 부분
	@ResponseBody
	public String upload(MultipartHttpServletRequest multipartRequest) { // Multipart로 받는다.

		Iterator<String> itr = multipartRequest.getFileNames();

		String filePath = "C:\\GitHub\\GxSx\\GxSx\\src\\main\\webapp\\resources\\images\\Findimgs\\"; // 설정파일로 뺀다.

		while (itr.hasNext()) { // 받은 파일들을 모두 돌린다.

			MultipartFile mpf = multipartRequest.getFile(itr.next());

			String originalFilename = mpf.getOriginalFilename(); // 파일명

			String fileFullPath = filePath + "/" + originalFilename; // 파일 전체 경로
			try {
				mpf.transferTo(new File(fileFullPath)); // 파일저장 실제로는 service에서 처리

				System.out.println("originalFilename => " + originalFilename);
				System.out.println("fileFullPath => " + fileFullPath);
			} catch (Exception e) {
				System.out.println("postTempFile_ERROR======>" + fileFullPath);
				e.printStackTrace();
			}
		}
		return "success";
	}

	@RequestMapping(value = "/fileUpload/post.do", method = RequestMethod.POST) // ajax에서 호출하는 부분
	@ResponseBody
	public String fileUploadTest(MultipartHttpServletRequest multipartRequest, Model model) {
		
		String result = "failed";

		if (multipartRequest != null) {
			result = "success";
		}
		
		return result;
	}
	
	@Transactional
	@RequestMapping(value = "/fileUpload/post2.do", method = RequestMethod.POST) // ajax에서 호출하는 부분
	public String fileUploadTest2(List<MultipartFile> fileUpload, FindItem findItem) {
//		MultipartHttpServletRequest fileUpload
		//순서
		// 1. 게시글 정보 디비에 저장
		// 2. 파일 업로드 (설정한 Path에 파일 업로드)
		// 3. 파일 정보 디비에 저장
		Map<String, Object> paramMap = new HashMap<String, Object>();
		log.info("#>file size : "+fileUpload.size());
		log.info("#>FindItem fino : "+findItem.getFino());
		if(findItemService.insertBoard(findItem) > 0) {
			System.out.println("#>FindItem fino : "+findItem.getFino());
			Iterator<MultipartFile> itr =  fileUpload.iterator();
			while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
				MultipartFile mpf = itr.next();
				String originalFilename = mpf.getOriginalFilename(); //파일명
				try {
					//파일 저장
					String changedFileName = uploadservice.saveStore(mpf); //파일저장 실제로는 service에서 처리
					System.out.println("originalFilename => "+originalFilename);
					System.out.println("fileFullPath => "+changedFileName);
					
					paramMap.put("fipno", findItem.getFino());
					paramMap.put("fipicname", changedFileName);
					findItemService.insertBoardPic(paramMap);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return "redirect:../../finditem/list.do";
	}

	@RequestMapping(value = "/fileUpload/post3.do", method = RequestMethod.POST) // ajax에서 호출하는 부분
	@ResponseBody
	public String fileUploadTest3(MultipartHttpServletRequest multipartRequest) {

		Iterator<String> itr =  multipartRequest.getFileNames();

		while (itr.hasNext()) { //받은 파일들을 모두 돌린다.

			MultipartFile mpf = multipartRequest.getFile(itr.next());

			String originalFilename = mpf.getOriginalFilename(); //파일명

			try {
				//파일 저장
				String changedFileName = uploadservice.saveStore(mpf); //파일저장 실제로는 service에서 처리

				System.out.println("originalFilename => "+originalFilename);
				System.out.println("fileFullPath => "+changedFileName);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//return "redirect:/findItPic2/list.do";
		return null;
	}
}	
