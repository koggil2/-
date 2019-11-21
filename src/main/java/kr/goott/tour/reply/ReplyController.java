package kr.goott.tour.reply;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
 
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
 
 
// REST : Representational State Transfer
// �ϳ��� URI�� �ϳ��� ������ ���ҽ��� ��ǥ�ϵ��� ����� ����
 
// http://localhost/spring02/list?bno=1 ==> url+�Ķ����
// http://localhost/spring02/list/1 ==> url
// RestController�� ������ 4.0���� ����
// @Controller, @RestController �������� �޼��尡 ����Ǹ� ȭ����ȯ�� ����
//@Controller

public class ReplyController  {
	 
    @Inject
    ReplyService replyService;
    
    // ��� �Է� 
    @RequestMapping("insert.do")
    public void insert(@ModelAttribute ReplyVO vo, HttpSession session){
        String userId = (String) session.getAttribute("userId");
        vo.setUserId(userId);
        replyService.create(vo);
    }
    
    // ��� ���(@Controller��� : veiw(ȭ��)�� ����)
    @RequestMapping("list.do")
    public ModelAndView list(@RequestParam String goodCode, ModelAndView mav){
        List<ReplyVO> list = replyService.list(goodCode);
        // ���̸� ����
        mav.setViewName("board/replyList");
        // �信 ������ ������ ����
        mav.addObject("list", list);
        // replyList.jsp�� ������
        return mav;
    }
    
    // ��� ���(@RestController Json������� ó�� : �����͸� ����)
    @RequestMapping("listJson.do")
    @ResponseBody // ���ϵ����͸� json���� ��ȯ(��������)
    public List<ReplyVO> listJson(@RequestParam  String goodCode){
        List<ReplyVO> list = replyService.list(goodCode);
        return list;
    }
}
