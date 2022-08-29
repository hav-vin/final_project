package sansil.gxsx.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ResponseListVo { //2���� ����¡�� �ؾ��ϱ⿡ ���� VO
	private List<?> list;  //����ǥ���� ������Ʈ�� �޴°��̱⿡ 2������ �ٹ���������
	private Pagination page;
}