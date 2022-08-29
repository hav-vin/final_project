package sansil.gxsx.mapper;

import java.util.List;

import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindListVo;
import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.Pagination;


public interface FindPicMapper {

	List<FindPic> selectFindPic();

	long selectCount();
	
	FindItPic selectBySeq(long fino);
	String area(long fino);
	List<FindItPic> selectByWriter(FindListVo findListVo);
	List<FindItPic> selectBySeq(FindListVo findListVo);
	void insert(FindItPic findItPic);
	boolean update(FindItPic findItPic);
	FindItPic updatef(long fino);
	void delete(long fino);

	Long selectCountFindItPic();

	List<FindItPic> list();

	List<FindItPic> selectPerPage(Pagination page);

}
