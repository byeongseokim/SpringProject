package ezen.pro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.pro.domain.cateVO;
import ezen.pro.mapper.catemapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class cateServiceImpl implements cateService{

	@Autowired
	catemapper catemapper;
	@Override
		public void addcate(String cate) {
		catemapper.insertcate(cate);
		
		}
	
	@Override
	public void dropcate(String cate) {
	 catemapper.deletecate(cate);	
	}
	
	
	@Override
	public List<cateVO> readcate() {
		return  catemapper.selectcate();
	}
	
}
