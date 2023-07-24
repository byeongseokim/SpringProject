package ezen.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.pro.domain.cateVO;
import ezen.pro.domain.pageVO;
import ezen.pro.service.boardServiceImpl;
import ezen.pro.service.cateServiceImpl;

@Controller
@RequestMapping("/cate")
public class cateController {

	@Autowired
	private cateServiceImpl cateServiceImpl;
	@Autowired
	private boardServiceImpl boardServiceImpl;
	
	
	@GetMapping("/cateadd.do")
	public String add(cateVO vo, Model model) {
		model.addAttribute("cate", cateServiceImpl.readcate());
		return "addcate";
	}
	
	@ResponseBody
	@PostMapping(value ="/cateadd.do",produces="application/json;charset=UTF-8")
	public String addcate(@RequestParam("cate") String cate) {
		cateServiceImpl.addcate(cate);
		return cate+"카테고리를 추가하였습니다";
	}

	@ResponseBody
	@DeleteMapping(value ="/dropcate.do/{cate}",produces="application/json;charset=UTF-8")
	public String drop(@PathVariable("cate")String vo) {
		pageVO page=new pageVO();
		page.setCate(vo);
		int tot=boardServiceImpl.totboard(page);
		if(tot>0) {
			return "게시물이 남아있어 카테고리를 삭제할수없습니다";
		}else {
		cateServiceImpl.dropcate(vo);
		return vo+"카테고리를 제거하였습니다";
		}
	}

}
