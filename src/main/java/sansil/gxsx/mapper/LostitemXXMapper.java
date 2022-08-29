package sansil.gxsx.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sansil.gxsx.domain.Area;
import sansil.gxsx.domain.Category;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindItemVo;
import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.LostItemVo;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Pagination;

public interface LostitemXXMapper {
	
	List<LostItemPicVo> list();
	
	long selectCountLostitem();
	
	List<LostItemPicVo> selectPerPage(Pagination page);
	
	void insert(LostItemPicVo lostitem);
	
	void insert1(LostItemPicVo lostitem);

	List<LostItemPicVo> Content(int lono);

	String area (int lono);
	
	void delete(int lono);

	List<LostItemPicVo> Updatef(int lono);
	boolean Update(LostItemPicVo lostitem);
	boolean Update1(LostItemPicVo lostitem);

	String saveStore(MultipartFile f);
    boolean writeFile(MultipartFile f, String saveFileName);
    
    void uploadpic(Map<String,String> map);
	List<LostItemPicVo> getLostRelated();
	List<LostItemPicVo> getpic();

	List<LostItemPicVo> selectByName(String losub);

	long selectCount();
	long selectCount2(String losub);

	List<LostItemPicVo> selectPerPage2(LostItemVo lostitemVo);
	List<LostPic> selectLostPic(long lopno);

	long selectCountByCondition(Map<String, String> paramMap);
	List<LostItemPicVo> selectPerPageByCondition(Map<String, Object> paramMap);

	long selectListCount(Map<String, Object> query);
	List<LostItemPicVo> selectList(Map<String, Object> query);


	//八祸 可记 孽府
	List<Category> selectCategory();
	List<Area> selectArea();
	//八祸 孽府
	long selectCountSearch(HashMap<String, Object> query);
	List<LostItemPicVo> selectSearch(HashMap<String, Object> query);
    
}