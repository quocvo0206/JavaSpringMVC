package com.itquocvv.model.bean;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	private HashMap<Integer, CartItem> listCartItems;

	public Cart(HashMap<Integer, CartItem> listCartItems) {
		super();
		this.listCartItems = listCartItems;
	}

	public Cart() {
		super();
		listCartItems = new HashMap<>();
	}

	public HashMap<Integer, CartItem> getListCartItems() {
		return listCartItems;
	}

	public void setListCartItems(HashMap<Integer, CartItem> listCartItems) {
		this.listCartItems = listCartItems;
	}

	public void updateCart(Integer key, CartItem cartItem) {
		listCartItems.put(key, cartItem);
	}

	// remove to cart
	public void removeToCart(Integer key) {
		if (listCartItems.containsKey(key)) {
			listCartItems.remove(key);
		}
	}

	// count item
	public int countItems() {
		return listCartItems.size();
	}
	
	// sum total
	public int getTotalCart() {
		int count = 0;
		for (Map.Entry<Integer, CartItem> item : listCartItems.entrySet()) {
			CartItem cartItem = item.getValue();
			count += cartItem.getProduct().getPrice() * cartItem.getQuantity();
		}
		return count;
	}

}
