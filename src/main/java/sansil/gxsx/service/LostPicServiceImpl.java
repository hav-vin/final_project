package sansil.gxsx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.mapper.LostPicMapper;

@Log4j
@Service("LostPic")
@AllArgsConstructor
public class LostPicServiceImpl implements LostPicService {
	
	@Autowired
	private LostPicMapper lostpicMapper;
	
	@Override
	public List<LostPic> selectLostPic() {
		return lostpicMapper.selectLostPic();
	}
}
