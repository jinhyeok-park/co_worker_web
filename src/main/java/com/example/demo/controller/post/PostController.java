package com.example.demo.controller.post;

import com.example.demo.controller.alarm.mapper.AlarmMapper;
import com.example.demo.controller.chat.mapper.ChatMsgMapper;
import com.example.demo.controller.chat.mapper.ChatRoomMapper;
import com.example.demo.controller.post.mapper.CommentMapper;
import com.example.demo.controller.post.mapper.MemberMapper;
import com.example.demo.controller.post.mapper.PostMapper;
import com.example.demo.controller.post.mapper.UserApplicantsMapper;
import com.example.demo.controller.post.model.Comment;
import com.example.demo.controller.post.model.Post;

import com.example.demo.controller.team.mapper.TeamPostMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;


@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/post/")
public class PostController {

    private final PostMapper postMapper;
    private final MemberMapper memberMapper;
    private final ChatMsgMapper chatMsgMapper;
    private final ChatRoomMapper chatRoomMapper;
    private final CommentMapper commentMapper;
    private final UserApplicantsMapper userApplicantsMapper;
    private final AlarmMapper alarmMapper;
    private final TeamPostMapper teamPostMapper;

    @GetMapping("post_list.html")
    public ModelAndView showPosts(HttpSession session)
    {
//        String userId = (String)session.getAttribute("user_id");
//        ModelAndView mav = new ModelAndView("/post/post_list");
//        mav.addObject("postdata", postMapper.selectAllPost());
//        ArrayList<Post> postData = postMapper.selectAllPost();
//        Post post = postData.get(1);
//
//        ObjectMapper objectMapper = new ObjectMapper();
//        String jsonPostData = null;
//        try {
//            jsonPostData = objectMapper.writeValueAsString(post);
//        } catch (Exception e) {
//            // JSON 변환 중 에러 발생 시 처리할 내용 작성
//            System.out.println(e + "error occured"); // 혹은 로깅 등의 작업을 수행할 수 있습니다.
//        }
//        mav.addObject("test", jsonPostData);
        ModelAndView mav = new ModelAndView("/post/post_list");
        ObjectMapper objectMapper = new ObjectMapper();


        ArrayList<Post> postArray = postMapper.selectAllPost();
        try
        {
            String jsonPostData = objectMapper.writeValueAsString(postArray);
            jsonPostData = jsonPostData.replace("\\n", "<br>");
            jsonPostData = jsonPostData.replace("\\r", "");
            mav.addObject("jsonPostData", jsonPostData);
        }
        catch (Exception e)
        {
            System.out.println("post_list.html error occur");
        }
        return mav;
    }

    @GetMapping("search_content.do")
    public @ResponseBody ArrayList<Post> test(@RequestParam("keyword") String keyword)
    {
        return postMapper.findByTitleOrContentContaining(keyword);
    }

    @GetMapping("post_edit_form.html")
    public ModelAndView showPostForm(@RequestParam(value = "isEditMode", defaultValue = "false") boolean isEditMode,
                                     @RequestParam(value = "proposal_id", defaultValue = "0") long proposal_id) {
        ModelAndView mav = new ModelAndView("/post/post_new_form");
        mav.addObject("isEditMode", isEditMode);
        Post post  = postMapper.findPostByProposal_Id(proposal_id);

        if (post != null)
        {
            mav.addObject("title", post.getTitle());
            mav.addObject("content" ,post.getContent());
            mav.addObject("apply_limit", post.getApply_limit());
            mav.addObject("proposal_id", proposal_id);
        }
        // 추가 로직, 예를 들어, isEditMode가 true일 경우 수정할 게시글의 데이터를 모델에 추가
        return mav;
    }

    @PostMapping("edit_post.do")
    public ModelAndView editPost(@RequestParam("title") String title,
                                 @RequestParam("content") String content,
                                 @RequestParam("address") String address,
                                 @RequestParam("axis_x") String axis_x,
                                 @RequestParam("axis_y") String axis_y,
                                 @RequestParam("apply_limit") long apply_limit,
                                 @RequestParam("proposal_id") long proposal_id)
    {
        double x = !axis_x.isEmpty() ? Double.parseDouble(axis_x) : 0.0;
        double y = !axis_y.isEmpty() ? Double.parseDouble(axis_y) : 0.0;

        postMapper.updatePostByProposal_id(title,content,address,x,y,apply_limit, proposal_id);
        Post post = postMapper.findPostByProposal_Id(proposal_id);

        return new ModelAndView("redirect:/post/post_list.html");
    }

    @PostMapping("post_new_form.html")
    public ModelAndView posting(HttpSession session,
                                @RequestParam("title") String title,
                                @RequestParam("content") String content,
                                @RequestParam("address") String address,
                                @RequestParam("axis_x") String axis_x,
                                @RequestParam("axis_y") String axis_y,
                                @RequestParam("apply_limit") long apply_limit) {

        double x = !axis_x.isEmpty() ? Double.parseDouble(axis_x) : 0.0;
        double y = !axis_y.isEmpty() ? Double.parseDouble(axis_y) : 0.0;
        String userId = (String)session.getAttribute("user_id");

        Post post = new Post();
        post.setUser_id(userId); // 사용자 ID 설정
        post.setTitle(title);
        post.setContent(content);
        post.setAddress(address);
        post.setAxis_x(x);
        post.setAxis_y(y);
        post.setApply_limit(apply_limit);

        postMapper.insertPost(post);
        memberMapper.insertMemeber(userId, post.getProposal_id());

        return new ModelAndView("redirect:/post/post_list.html");
    }

    //포스트 삭제
    @DeleteMapping("{proposal_id}/delete.do")
    public ResponseEntity<Boolean> deleteDetailPage(@PathVariable("proposal_id") long proposal_id)
    {
        chatMsgMapper.deleteChat_msgByProposal_id(proposal_id);
        chatRoomMapper.deleteChat_roomByProposal_id(proposal_id);
        commentMapper.deleteCommentByProposal_id(proposal_id);
        userApplicantsMapper.deleteUser_applicantsByProposal_id(proposal_id);
        postMapper.deletePostByProposal_id(proposal_id);
        teamPostMapper.deleteAllTeamPostByProposal_id(proposal_id);

        return (ResponseEntity.ok(true));
    }

    @GetMapping("{postid}/post_detail_form.html")
    public ModelAndView showPostDetail(@PathVariable("postid") long postId)
    {
        Post detailPost = postMapper.findPostByProposal_Id(postId);
        ArrayList<Comment> comments = commentMapper.selectCommentByProposal_id(postId);
        ModelAndView mav = new ModelAndView("/post/post_detail_form");
        mav.addObject("detailPost", detailPost);
        mav.addObject("comments", comments);
        return mav;
    }
    // post chatting room create
    @PostMapping("create_chat.do")
    public @ResponseBody ResponseEntity createChattingRoom(@RequestParam("proposal_id") long propsal_id)
    {
        postMapper.updateChatRoomStatusTrue(propsal_id);
        return ResponseEntity.ok("true");
    }

    @PostMapping("delete_chat.do")
    public @ResponseBody ResponseEntity deleteChattingRoom(@RequestParam("proposal_id") long propsal_id)
    {
        postMapper.updateChatRoomStatusFalse(propsal_id);
        chatMsgMapper.deleteChat_msgByProposal_id(propsal_id);
        return ResponseEntity.ok("true");
    }

    @PostMapping("create_teampage.do")
    public @ResponseBody ResponseEntity createTeamPage(@RequestParam("proposal_id") long propsal_id)
    {
        postMapper.updateTeamPageStatusTrue(propsal_id);
        return ResponseEntity.ok("true");
    }

    @PostMapping("delete_teampage.do")
    public @ResponseBody ResponseEntity deleteTeamPage(@RequestParam("proposal_id") long propsal_id)
    {
        postMapper.updateTeamPageStatusFalse(propsal_id);
        teamPostMapper.deleteAllTeamPostByProposal_id(propsal_id);
        return ResponseEntity.ok("true");
    }


    // post에 대한 지원
    @PostMapping("apply.do")
    public @ResponseBody String applyId(HttpSession session,
                   @RequestParam("proposal_id") String proposal_id)
    {
        long pro_id;

        pro_id = Long.parseLong(proposal_id);
        Post post = postMapper.findPostByProposal_Id(pro_id);
        String user_id;

        user_id = (String)session.getAttribute("user_id");
        if (user_id == null)
        {
            return ("fail");
        }
        else if (post.getApply_accept_count() >= post.getApply_limit())
        {
            return ("limit_over");
        }
        else if(isApplicantsExists(pro_id, user_id))
        {
            return("already applied");
        }
        userApplicantsMapper.insertUser_applicants(user_id, pro_id);
        postMapper.applyCountPlus(pro_id);
        String message = user_id + " 님이 " + post.getTitle() + "에 지원 하셨습니다.";
        alarmMapper.insertAlarm(post.getUser_id(), "3", message);
        return ("true");
    }

    public boolean isApplicantsExists(long proposalId, String userId) {
        long count = userApplicantsMapper.countApplicants(proposalId, userId);
        return count > 0;
    }

    // post에 대한 지원자 수락
    @PostMapping("post_accept.do")
    public ModelAndView ButtonAction(@RequestParam("action") String action,
                                     @RequestParam("proposal_id") long proposal_id,
                                     @RequestParam("user_id") String user_id)
    {
        Post post = postMapper.findPostByProposal_Id(proposal_id);
        String title = post.getTitle();
        String message;

        if (action.equals("accept"))
        {
            postMapper.applyAcceptCountPlus(proposal_id);
            userApplicantsMapper.acceptApplier(proposal_id, user_id);
            memberMapper.insertMemeber(user_id, proposal_id);
            message =  title + " 제안에 수락 되셨습니다.";
            alarmMapper.insertAlarm(user_id, "3", message);
        }
        else if (action.equals("reject"))
        {
            message = title + "제안에 거절 되셨습니다.";
            userApplicantsMapper.rejectApplier(proposal_id, user_id);
            alarmMapper.insertAlarm(user_id, "3", message);
        }

        return new ModelAndView("redirect:/mypage/my_page.html");
    }
}
