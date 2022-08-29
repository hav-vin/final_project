package sansil.gxsx.mapper;

import java.util.HashMap;
import java.util.List;

import sansil.gxsx.domain.FindListVo;
import sansil.gxsx.domain.LostListVo;
import sansil.gxsx.domain.Users;
import sansil.gxsx.domain.UsersVo;

public interface UsersMapper {
	List<Users> selectPerPage(UsersVo usersVo);
	List<Users> listLostitem();
	long selectCount();
	List<Users> listFinditem();
	void delete(String Usersid);
	void deleteAll();
	
	long selectCountLostItem(String query);
	List<LostListVo> lostList(LostListVo query);
	long selectCountFindItem(String query);
	List<FindListVo> findList(FindListVo query);
	
	List<FindListVo> fselectByName(HashMap searchmap);
	List<LostListVo> lselectByName(HashMap searchmap);
	
	void editPwd(HashMap editmap);
	void editProfile(Users editUser);
	void leaveUser(String userid);
	
}
