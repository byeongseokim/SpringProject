package ezen.pro.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class boardVO {
    private int bno;          // 번호
    private String bcon;      // 내용
    private String btie;      // 제목
    private String bwriter;   // 글쓴이
    private String cate;      // 카테고리
    private Date bdate;       // 등록일
    private String imageurl;  // 이미지 URL 추가
    
    // imageurl의 getter 메서드 추가
    public String getImageurl() {
        return imageurl;
    }
}
