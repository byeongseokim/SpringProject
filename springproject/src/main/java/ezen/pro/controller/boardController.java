package ezen.pro.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import ezen.pro.domain.boardVO;
import ezen.pro.domain.cateVO;
import ezen.pro.domain.pageVO;
import ezen.pro.domain.replyVO;
import ezen.pro.service.boardServiceImpl;
import ezen.pro.service.cateServiceImpl;
import ezen.pro.service.replyServiceImpl;

@Controller
@RequestMapping("/board")
public class boardController {
	
	pageVO page=new pageVO();
	int pagenumber;
	
	@Autowired
	replyServiceImpl replyServiceImpl;
	@Autowired
	boardServiceImpl boardService;
	@Autowired
	cateServiceImpl cateServiceImpl;

	@ResponseBody
	@PostMapping("/upload")
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request, @RequestParam("id") String id) {
		JsonObject jsonObject = new JsonObject();
//파일저장 외부 경로, 파일명, 저장할 파일명         
		try {
			System.out.println(id);
			String originalFileName = multipartFile.getOriginalFilename();
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\image\\review\\summerimagefiles\\" + id;
			// 이게경로야 이게파일으름을 yyymmddhhmmss으로해서
			//
			System.out.println(savePath);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			String boardFileRename = sdf.format(new Date(System.currentTimeMillis())) + "." + extension;
			File targetFile = new File(savePath);
			if (!targetFile.exists()) {
				targetFile.mkdir();
			}

			multipartFile.transferTo(new File(savePath + "\\" + boardFileRename));
			jsonObject.addProperty("url", "/resources/image/review/summerimagefiles/" + id + "/" + boardFileRename);
			jsonObject.addProperty("originName", originalFileName);
			jsonObject.addProperty("reponseCode", "success");
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(jsonObject);
		return jsonObject;

	}

	// 게시글 목록 조회ok
	@GetMapping("/list.do")
	public String getBoardList(Model model, pageVO vo) {
		// 게시글 목록을 가져와서 모델에 추가
		if(vo.getWord()!=null) {
			vo.setWord(vo.getWord().equals("")?null:vo.getWord());
			page.setWord(vo.getWord());
		}
		if(vo.getCate()!=null){
			if(vo.getCate().equals("옵션")||vo.getCate().equals("")) {
				page.setCate(null);
				vo.setCate(null);
			}
			if(vo.getCate()!=null){
				page.setCate(vo.getCate());
			}
		}
		pagenumber=(vo.getPagenum()==0? 1 :vo.getPagenum());
		page.setPagenum((pagenumber - 1) *page.getCount());
		int tot = boardService.totboard(page);
		tot = (int) (((double) tot / (double) page.getCount()) + 1);
		List<boardVO> boardList = boardService.pagingboard(page);
		model.addAttribute("cou",page.getCount());
		model.addAttribute("page", tot);
		model.addAttribute("boardList", boardList);
		model.addAttribute("nowpage",pagenumber);
		List<cateVO> cate = cateServiceImpl.readcate();
		model.addAttribute("cate", cate);
		model.addAttribute("nowword",page.getWord());
		model.addAttribute("categori",page.getCate());
		return "listboard"; // 목록 페이지 템플릿으로 이동
	}
//	
//	@ResponseBody
//	@GetMapping("/list.do")
//	public List<boardVO> postBoardList(@RequestBody String nowpage) {
//		int nowpagenum =Integer.parseInt(nowpage);
//		// 게시글 목록을 가져와서 모델에 추가
//		page.setPagenum((nowpagenum - 1) * 10);
//		int tot = boardService.totboard();
//		tot = (int) (((double) tot / (double) page.getCount()) + 1);
//		List<boardVO> boardList = boardService.pagingboard(page);
//		return boardList; // 목록 페이지 템플릿으로 이동
//	}
//

	// 게시글 상세 조회ok
	@GetMapping("/detail.do")
	public String getBoardDetail(@RequestParam("bno") int bno, Model model) {
		// 게시글 상세 내용을 가져와서 모델에 추가
		List<cateVO> cate = cateServiceImpl.readcate();
		boardVO board = boardService.getBoardDetail(bno);
		List<replyVO> reply= replyServiceImpl.selectreply(bno);
		model.addAttribute("reply",reply);
		model.addAttribute("board", board);
		model.addAttribute("cate", cate);
		model.addAttribute("nowpage",pagenumber);
		return "detail"; // 상세 페이지 템플릿으로 이동합니다.
	}

	// 새로운 게시글 작성 폼을 보여주기 위함ok
	@GetMapping("/add.do")
	public String showAddBoardForm(Model model) {
		List<cateVO> cate = cateServiceImpl.readcate();
		model.addAttribute("cate", cate);
		return "addboard"; // 새로운 게시글 작성 폼 템플릿으로 이동

	}

	// 게시글 등록을 처리 ok
	@PostMapping("/add.do")
	public String addBoard(boardVO board) {
		// 제목이 null이거나 비어있는지 확인
		// 데이터베이스에 새로운 게시글 등록
		boardService.boardRegister(board);
		return "redirect:/board/list.do"; // 목록 페이지로 이동
	}

	@ResponseBody
	@PutMapping("/update.do")
	public boardVO chagemeboard(@RequestBody boardVO vo) {
		boardService.changeBoard(vo);
		return boardService.getBoardDetail(vo.getBno());
	}

	@ResponseBody
	@DeleteMapping("/delete.do/{bno}")
	public String dropboard(@PathVariable("bno") String bno) {
		System.out.println(bno);
		int rebno = Integer.parseInt(bno);
		boardService.deleteBoard(rebno);
		return "success";
	}

	@ResponseBody
	@PutMapping(value ="/updatecount",produces="application/json;charset=UTF-8")
	public String count(@RequestBody String count){
		System.out.println(count);
		int countnum=Integer.parseInt(count);
		page.setCount(countnum);
		return count+"개로 변경되었습니다";
	}
	

}
