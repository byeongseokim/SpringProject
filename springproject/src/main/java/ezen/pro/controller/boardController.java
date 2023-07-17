package ezen.pro.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

import ezen.pro.domain.boardVO;
import ezen.pro.service.boardServiceImpl;

@Controller
@RequestMapping("/board")
public class boardController {

	@Autowired
	boardServiceImpl boardService;

	@ResponseBody
	@PostMapping("/uploadSummernoteImageFile")
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
//파일저장 외부 경로, 파일명, 저장할 파일명         
		try {
			String originalFileName = multipartFile.getOriginalFilename();
			String root = request.getSession().getServletContext().getRealPath("resources");
			System.out.println("여기1");
			String savePath = root + "\\image\\review\\summerimagefiles";
			System.out.println(savePath);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			System.out.println("여기2.1");
			String boardFileRename = sdf.format(new Date(System.currentTimeMillis())) + "." + extension;
			File targetFile = new File(savePath);
			if (!targetFile.exists()) {
				targetFile.mkdir();
				System.out.println("여기3");
			}
			System.out.println("여기4");
			multipartFile.transferTo(new File(savePath + "\\" + boardFileRename));
			System.out.println("여기5");
			System.out.println(savePath);
			jsonObject.addProperty("url", "/resources/image/review/summerimagefiles/" + boardFileRename);
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
    @GetMapping("/main.do")
    public String getBoardList(Model model) {
        // 게시글 목록을 가져와서 모델에 추가
        List<boardVO> boardList = boardService.getAllBoard();
        model.addAttribute("boardList", boardList);
        return "list"; // 목록 페이지 템플릿으로 이동
    }
//

    // 게시글 상세 조회ok
    @GetMapping("/detail")
    public String getBoardDetail(
            @RequestParam("bno") int bno,
            Model model
    ) {
        // 게시글 상세 내용을 가져와서 모델에 추가
        boardVO board = boardService.getBoardDetail(bno);
        model.addAttribute("board", board);
        return "detail"; // 상세 페이지 템플릿으로 이동합니다.
    }

    // 새로운 게시글 작성 폼을 보여주기 위함ok
    @GetMapping("/add")
    public String showAddBoardForm(Model model) {
        return "addboard"; // 새로운 게시글 작성 폼 템플릿으로 이동
    }

    // 게시글 등록을 처리 ok
    @PostMapping("/add")
    public String addBoard(
            @ModelAttribute("board") boardVO board,
            RedirectAttributes redirectAttributes
    ) {
        // 제목이 null이거나 비어있는지 확인
        if (board.getBtie() == null || board.getBtie().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "제목은 비워 둘 수 없습니다.");
            return "redirect:/board/add";
        } 
        if (board.getBcon() == null || board.getBtie().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "내용은 비워 둘 수 없습니다.");
            return "redirect:/board/add";
        }
        // 데이터베이스에 새로운 게시글 등록
        boardService.boardRegister(board);
        redirectAttributes.addFlashAttribute("message", "새로운 게시글 등록이 성공하였습니다.");
        return "redirect:/board/list"; // 목록 페이지로 이동
    }
    
  

}
