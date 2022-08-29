package sansil.gxsx.service;

import java.util.List;

import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.LostPic;

public interface LostPicService {
	
	List<LostPic> selectLostPic();
}
