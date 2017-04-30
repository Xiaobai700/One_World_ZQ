package com.oneworld.web.service.impl;

import com.oneworld.web.model.Answer;
import com.oneworld.web.service.AnswerService;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by Master ZQ on 2017/3/3.
 */
@Service
public class AnswerServiceImpl implements AnswerService {

    public Map insertAnswer(Answer answer) {
        return null;
    }

    public Map findAnswersByDiscuss_id(int discuss_id) {
        return null;
    }

    public Map findAllAnswersByDiscuss_id(int discuss_id) {
        return null;
    }

    public Map deleteAnswer(int id) {
        return null;
    }

    public Map findAnswerById(int id) {
        return null;
    }

    public Map getUserInfosByDiscuss_id(int discuss_id) {
        return null;
    }

    public Map findAnswerByDiscuss_idAndUser_account(int discuss_id, String account) {
        return null;
    }

    public Map findAnswersByUser_account(String user_account) {
        return null;
    }
}
