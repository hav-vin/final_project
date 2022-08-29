package sansil.gxsx.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ResponseListVo { //2개의 페이징을 해야하기에 만든 VO
	private List<?> list;  //물음표값은 오브젝트로 받는거이기에 2개값을 다받을수있음
	private Pagination page;
}