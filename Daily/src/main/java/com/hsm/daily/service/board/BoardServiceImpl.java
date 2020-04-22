package com.hsm.daily.service.board;

import org.springframework.stereotype.Service;

import com.hsm.daily.model.board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	BoardDAO boardDao;
}
