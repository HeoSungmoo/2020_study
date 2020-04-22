package com.hsm.daily.service.cart;

import org.springframework.stereotype.Service;

import com.hsm.daily.model.cart.dao.CartDAO;

@Service
public class CartServiceImpl implements CartService {

	CartDAO cartDao;
}
