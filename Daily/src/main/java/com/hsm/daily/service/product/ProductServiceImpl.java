package com.hsm.daily.service.product;

import org.springframework.stereotype.Service;

import com.hsm.daily.model.product.dao.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {

	ProductDAO productDao;
}
