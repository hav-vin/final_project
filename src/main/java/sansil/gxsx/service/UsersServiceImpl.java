package sansil.gxsx.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindListVo;
import sansil.gxsx.domain.LostListVo;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Users;
import sansil.gxsx.domain.UsersListResult;
import sansil.gxsx.domain.UsersVo;
import sansil.gxsx.mapper.UsersMapper;
import sansil.gxsx.utils.PagingUtil;

@Log4j
@Service("Users")
@AllArgsConstructor
public class UsersServiceImpl implements UsersService {
	
	private UsersMapper usersMapper; //Spring 4.3~ : ÀÚµ¿ Injection

	@Override
	public List<Users> selectPerPageS(UsersVo usersVo) {
		return usersMapper.selectPerPage(usersVo);
	}
	
	@Override
	public UsersListResult getUsersResult(long page, long pageSize) {
		long totalCount = usersMapper.selectCount();
		return null;
	}
	
	@Override
	public long selectCountS() {
		return usersMapper.selectCount();
	}
	
	@Override
	public List<Users> listS() {
			return null;
	}
	
	@Override
	public void deleteS(String UserId) {
		usersMapper.delete(UserId);
	}
	
	@Override
	public void deleteAllS() {
		usersMapper.deleteAll();
	}
	
	@Override
	public UsersListResult getUsersListResult(int cp, int ps) {
		return null;
	}
	
	@Override
	public void updateS(Users users) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public UsersListResult getUsersResultByKeyword(String keyword, int page, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<LostListVo> getLostList(String louid, HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		PagingUtil pagingUtil = new PagingUtil(cpStr, psStr, session);
		LostListVo query = new LostListVo();
		query.setLouid(louid);
		Long listCount = usersMapper.selectCountLostItem(query.getLouid());

		query.setPaging(new Pagination(listCount, pagingUtil.getCp(), pagingUtil.getPs()));
		
		
		List<LostListVo> lostList = usersMapper.lostList(query);
		
		return lostList;
	}
	
	@Override
	public List<FindListVo> getFindList(String fiuId, HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		PagingUtil pagingUtil = new PagingUtil(cpStr, psStr, session);
		FindListVo query = new FindListVo();
		query.setFiuid(fiuId);
		Long listCount = usersMapper.selectCountLostItem(query.getFiuid());

		query.setPaging(new Pagination(listCount, pagingUtil.getCp(), pagingUtil.getPs()));
		
		
		List<FindListVo> findList = usersMapper.findList(query);
		
		return findList;
	}
	
	@Override
	public Pagination getFindPagination(String fiuid, HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		PagingUtil pagingUtil = new PagingUtil(cpStr, psStr, session);
		Long listCount = usersMapper.selectCountFindItem(fiuid);
		
		return new Pagination(listCount, pagingUtil.getCp(), pagingUtil.getPs());
	}
	
	@Override
	public Pagination getLostPagination(String louid, HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		PagingUtil pagingUtil = new PagingUtil(cpStr, psStr, session);
		Long listCount = usersMapper.selectCountLostItem(louid);
		
		return new Pagination(listCount, pagingUtil.getCp(), pagingUtil.getPs());
	}
	
	@Override
	public Pagination getAjaxFindPagination(int selectedPage, String fiuid, HttpServletRequest request, HttpSession session) {
		long listCount = usersMapper.selectCountFindItem(fiuid);
		PagingUtil page = new PagingUtil(null, null, session);
		return new Pagination(listCount, selectedPage, page.getPs());
	}
	
	@Override
	public Pagination getAjaxLostPagination(int selectedPage, String louid, HttpServletRequest request, HttpSession session) {
		long listCount = usersMapper.selectCountLostItem(louid);
		PagingUtil page = new PagingUtil(null, null, session);
		return new Pagination(listCount, selectedPage, page.getPs());
	}
	
	@Override
	public List<LostListVo> getLostListVo(Pagination page, String louid) {
		LostListVo query = new LostListVo();
		query.setLouid(louid);
		query.setPaging(page);
		return usersMapper.lostList(query);
	}
	
	@Override
	public List<FindListVo> getFindListVo(Pagination page, String fiuid) {
		FindListVo query = new FindListVo();
		query.setFiuid(fiuid);
		query.setPaging(page);
		
		return usersMapper.findList(query);
	}
	
	@Override
	public List<FindListVo> fselectByNameS(HashMap searchmap){
		return usersMapper.fselectByName(searchmap);
	}
	
	@Override
	public List<LostListVo> lselectByNameS(HashMap searchmap){
		return usersMapper.lselectByName(searchmap);
	}
	
	@Override
	public void editPwdS(HashMap editmap){
		usersMapper.editPwd(editmap);
	}
	
	@Override
	public void editProfileS(Users editUser){
		usersMapper.editProfile(editUser);
	}
	
	@Override
	public void leaveUserS(String userid){
		usersMapper.leaveUser(userid);
	}
	
}
