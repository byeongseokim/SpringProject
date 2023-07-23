package ezen.pro.domain;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class pageVO {

	private int count=10;//페이지당나타나는 게시글의갯수
	private int pagenum; //현재페이지
	private String word;
	private String cate;
}
