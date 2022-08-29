package sansil.gxsx.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadservice {

	String saveStore(MultipartFile f);
	String saveStore2(MultipartFile f);
    boolean writeFile(MultipartFile f, String saveFileName);
}