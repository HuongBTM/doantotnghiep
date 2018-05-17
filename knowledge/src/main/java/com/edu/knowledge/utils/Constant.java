package com.edu.knowledge.utils;

public class Constant {

	public static final String SUCCESS = "SUCCESS";
	public static final String ERROR = "ERROR";
	public static final String CURRENT_USER = "CURRENT_USER";
	public static final int FEED_TOP_LIMIT = 10; 
	public static final int FEED_NEW_LIMIT = 10; // update to 20
	public static final int QUESTION_LIST_LIMIT = 10; // update to 30 or 40
	public static final int TOP_USER = 5;
	public static final int TOP_USER_REQUEST = 9;
	public static final int SUMMARY = 300;
	
	public static final int REMOVE_POST_OR_QUESTION_UPVOTE_POINT = -1;
	public static final int REMOVE_POST_OR_QUESTION_DOWNVOTE_POINT = 1;
	public static final int REMOVE_ANSWER_UPVOTE_POINT = -2;
	public static final int REMOVE_ANSWER_DOWNVOTE_POINT = 1;
	public static final int UPVOTE_ID = 1;
	public static final int DOWNVOTE_ID = 2;
	public static final int POINTS_NEW_POST = 5; // cộng 5 điểm cho chuyên gia khi đăng bài viết mới
	public static final int POINTS_NEW_QUESTION = 2; // cộng 2 điểm khi đăng câu hỏi mới
	public static final int POINTS_EXPECT_NEW_ANSWER = 2; // cộng 2 điểm cho câu trả lời mới của chuyên gia
	public static final int POINTS_MEMBER_NEW_ANSWER = 1; // cộng 1 điểm cho câu trả lời mới của thành viên
	public static final int POINTS_ANSWER_UPVOTED = 2; // cộng 2 điểm khi câu trả lời dk upvote
	public static final int POINTS_POST_OR_QUESTION_UPVOTED = 1;
	public static final int POINTS_DOWNVOTED = -1; // trừ 1 điểm nếu bị downvote (bài viết, câu hỏi hoặc câu trả lời)
	
	public static final String ACTION_UPVOTE = "upvote";
}
