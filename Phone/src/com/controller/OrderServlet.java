package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JFileChooser;

import com.bean.Cart;
import com.bean.CartItem;
import com.bean.DetailOrder;
import com.bean.Member;
import com.bean.ShopOrder;
import com.bean.PageInfo;
import com.dao.OrderDao;
import com.dao.impl.OrderDaoImpl;
import com.utils.ExportExcel;

public class OrderServlet extends HttpServlet {
	OrderDao dao = new OrderDaoImpl();
	List<ShopOrder> shopOrders = new ArrayList<ShopOrder>();
	List<DetailOrder> detailOrders = new ArrayList<DetailOrder>();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		Member member = (Member)request.getSession().getAttribute("memberSession");
		if("addOrder".equals(action)) {
			Cart cart = (Cart)request.getSession().getAttribute("cart");
			int bnumber = cart.getCount();
			String recevieName = request.getParameter("recevieName");
			String tel = request.getParameter("tel");
			String addresses = request.getParameter("address");
			String remark = request.getParameter("remark");
			ShopOrder shopOrder = new ShopOrder(dao.getOrderCount() + 1, bnumber, cart.getTotal(), recevieName, addresses, tel, null, remark, member);
			dao.insertNewOrder(shopOrder);
			for(CartItem cartItem : cart.getCartItems()) {
				DetailOrder detailOrder = new DetailOrder(0, shopOrder, cartItem.getGoods(), cartItem.getTotal(), cartItem.getQuantity(),cartItem.getTotal());
				dao.insertNewDetailOrder(detailOrder);
			}
			cart.clear();
			response.sendRedirect(request.getContextPath()+"/front/prolist.jsp");
		} else if("showShopOrder".equals(action)) {
			String searchword = request.getParameter("searchword");
			searchword = searchword==null?"":searchword;
			PageInfo pageInfo = new PageInfo(dao.getShopOrderByName(searchword, member.getMemberId()), 1);
			shopOrders = dao.getShopOrderByName(searchword, member.getMemberId(), pageInfo.getPageStart(), pageInfo.getPageEnd());
			request.setAttribute("searchword", searchword);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("shopOrders", shopOrders);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/front/orderList.jsp");
			dispatcher.forward(request, response);
		} else if("showDetailOrder".equals(action)) {
			showDetailShop(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/front/detailOrderList.jsp");
			dispatcher.forward(request, response);
		} else if("showShopOrderManager".equals(action)) {
			String searchword = request.getParameter("searchword");
			searchword = searchword==null?"":searchword;
			PageInfo pageInfo = new PageInfo(dao.getShopOrderByName(searchword), 1);
			shopOrders = dao.getShopOrderByName(searchword, pageInfo.getPageStart(), pageInfo.getPageEnd());
			request.setAttribute("searchword", searchword);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("shopOrders", shopOrders);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/orderManager.jsp");
			dispatcher.forward(request, response);
		} else if("showDetailOrderManager".equals(action)) {
			showDetailShop(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/detailOrderManager.jsp");
			dispatcher.forward(request, response);
		} else if("delOrder".equals(action)) {
			String _ids[] = request.getParameterValues("del");
			int ids[] = new int[_ids.length];
			for(int i=0;i<ids.length;i++)
			{
				ids[i] = Integer.parseInt(_ids[i]);
			}
			dao.deleteShopOrders(ids);
			PageInfo pageInfo = new PageInfo(dao.getShopOrderByName(""), 1);
			shopOrders = dao.getShopOrderByName("", pageInfo.getPageStart(), pageInfo.getPageEnd());
			request.setAttribute("searchword", "");
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("shopOrders", shopOrders);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/manager/orderManager.jsp");
			dispatcher.forward(request, response);
		} else if("excelOrder".equals(action)) {
			//orderId,bnumber,receiveName,addresses,tel,orderDate,remark
			List<ShopOrder> orders = new ArrayList<ShopOrder>();
			orders = dao.getShopOrderAll();
			for(ShopOrder shop : orders) {
				System.out.println(shop.getOrderId());
			}
			String filePath = "";
			JFileChooser fileChooser = new JFileChooser("D:\\");
			fileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
			int returnVal = fileChooser.showOpenDialog(fileChooser);
			if(returnVal == JFileChooser.APPROVE_OPTION) {
				filePath = fileChooser.getSelectedFile().getAbsolutePath();
		        Map<String,String> titleMap = new LinkedHashMap<String,String>();
		        titleMap.put("orderId", "订单编号");
		        titleMap.put("bnumber", "商品数量");
		        titleMap.put("total", "总价");
		        titleMap.put("receiveName", "收件人");
		        titleMap.put("addresses", "地址");
		        titleMap.put("tel", "电话");
		        titleMap.put("orderDate", "订单日期");
		        titleMap.put("remark", "备注");
		        String sheetName = "信息导出";
		        
		        System.out.println("start导出");
		        long start = System.currentTimeMillis();
		        ExportExcel.excelExport(orders, titleMap, sheetName, filePath);
		        long end = System.currentTimeMillis();
		        System.out.println("end导出");
		        System.out.println("耗时："+(end-start)+"ms");
		        response.sendRedirect("orderservlet?action=showShopOrderManager");
			}
		}
	}
	
	public void showDetailShop(HttpServletRequest request, HttpServletResponse response) {
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		PageInfo pageInfo = new PageInfo(dao.getDetailOrderCount(orderId), 1);
		detailOrders = dao.getDetailOrderPage(orderId, pageInfo.getPageStart(), pageInfo.getPageEnd());
		request.setAttribute("orderId", orderId);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("detailOrders", detailOrders);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("shopOrders", shopOrders);
	}
}
