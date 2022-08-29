package sansil.gxsx.mapper;

import java.util.List;

import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.LostItemVo;
import sansil.gxsx.domain.Pagination;

public interface LostItemMapper {
	List<LostItem> selectPerPage(LostItemVo lostitemvo);
	long selectCount();
	List<LostItem> selectByWriter(LostItemVo lostitemvo);
	void insert(LostItem lostitem);
	void delete(int lono);
	LostItem Updatef(long lono);
	boolean Update(LostItem lostitem);
	
	List<LostItem> selectLostitem();
	
	/////////////////////////////////////////////////////////////////
	LostItem selectBySeq(long lono);
	List<LostItemPicVo> list();
	long selectCountLostitem();
	List<LostItemPicVo> selectPerPage(Pagination page);
	LostItemPicVo Content(int lono);
	String area (int lono);
}
