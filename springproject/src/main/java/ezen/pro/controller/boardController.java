package ezen.pro.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.pro.domain.boardVO;
import ezen.pro.service.boardService;

@Controller
@RequestMapping("/board")
public class boardController {

    private final boardService boardService;

    @Autowired
    public boardController(boardService boardService) {
        this.boardService = boardService;
    }

    // 게시글 목록 조회
    @GetMapping("/main.do")
    public String getBoardList(Model model) {
        // 게시글 목록을 가져와서 모델에 추가
        List<boardVO> boardList = boardService.getAllBoard();
        model.addAttribute("boardList", boardList);
        return "list"; // 목록 페이지 템플릿으로 이동
    }

    // 게시글 상세 조회
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

    // 새로운 게시글 작성 폼을 보여주기 위함
    @GetMapping("/add")
    public String showAddBoardForm(Model model) {
        model.addAttribute("board", new boardVO());
        return "addboard"; // 새로운 게시글 작성 폼 템플릿으로 이동
    }

    // 게시글 등록을 처리
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

        // 데이터베이스에 새로운 게시글 등록
        boardService.boardRegister(board);
        redirectAttributes.addFlashAttribute("message", "새로운 게시글 등록이 성공하였습니다.");
        return "redirect:/board/list"; // 목록 페이지로 이동
    }
    
    @GetMapping("/board/detail")
    public String getBoardDetail1(@RequestParam("bno") int bno, Model model) {
        // 요청된 게시물이 테스트 게시물인지 확인합니다.
        if (bno == 1) {
            // 테스트 데이터를 사용하여 게시물 객체를 생성합니다.
            boardVO board = new boardVO();
            board.setBno(1);
            board.setBtie("테스트 게시물 제목");
            board.setBwriter("테스트 작성자");
            board.setBcon("테스트 내용");
            board.setCate("테스트 카테고리");
            board.setBdate(new Date());

            // 테스트 게시물을 모델에 추가합니다.
            model.addAttribute("board", board);
        } else {
            // 서비스를 통해 제공된 bno를 기반으로 게시물 상세 정보를 가져옵니다.
            boardVO board = boardService.getBoardDetail(bno);
            model.addAttribute("board", board);
        }
        
        return "detail"; // 상세 보기 템플릿을 반환합니다.
    }

}
