package com.dao;

import java.util.List;

import com.bean.Comment;
import com.bean.Goods;
import com.bean.Introduce;
import com.bean.SubType;
import com.bean.SuperType;

public interface GoodsDao {
	
	/**
	 * 查询最新的goodsID
	 */
	public boolean insertCommentInfo(Comment comment);
	/**
	 * 查询最新的goodsID
	 */
	public Goods getNewGoods();
	/**
	 * 根据评价数量对商品进行排序
	 */
	public List<Goods> getGoodsOrderByComment();
	
	/**
	 * 根据商品ID获得商品评价
	 */
	public List<Comment> getCommentByGoodsId(int id,int start ,int end);
	
	/**
	 * 根据商品ID得到商品评价
	 */
	public int getCommentCountByGoodsId(int id);
	
	/**
	 * 查询商品介绍
	 */
	public Introduce getIntroduceByGoodsId(int id);
	
	/**
	 * 显示商品介绍的个数
	 */
	public int getCountIntroduce();
	/**
	 * 显示所有的商品介绍
	 */
	public List<Introduce> getIntroduceAll(int start, int end);
	
	/**
	 * 按照小分类分类查询商品
	 */
	public List<Goods> getGoodsBySubID(int id,int start ,int end);
	
	/**
	 * 按照大分类分类分类查询商品
	 */
	public List<Goods> getGoodsBySuperID(int id,int start ,int end);
	
	/**
	 * 查询商品总数
	 */
	public int getGoodsCountByName(String name);
	
	/**
	 * 根据小分类ID查询商品总数
	 */
	public int getGoodsCountByID(int id);
	
	/**
	 * 根据大分类ID查询商品总数
	 */
	public int getGoodsCountBySuperID(int id);
	
	/**
	 * 查询最新商品
	 */
	public List<Goods> getNewGoodsAll();
	
	/**
	 * 查询打折商品
	 */
	public List<Goods> getDiscountAll();
	
	/**
	 * 查询热卖商品
	 */
	public List<Goods> getHotGoods(int top);
	
	/**
	 * 查询热卖同类型的商品
	 */
	public List<Goods> getRelatedGoods(int top,int id);
	
	/**
	 * 检索商品信息
	 */
	public List<Goods> getGoodsByName(String name,int start,int end);
	
	/**
	 * 商品详细信息
	 */
	public Goods getGoodsInfoByID(int id);
	
	/**
	 * 获取全部小分类
	 */
	public List<SubType> getSubTypeAll();
	
	/**
	 * 根据ID获取小分类
	 */
	public SubType getSubTypeById(int id);
	
	/**
	 * 得到第一个大分类
	 */
	public SuperType getSuperTypeById();
	
	/**
	 * 根据小分类ID获取大分类
	 */
	public SuperType getSuperTypeById(int id);
	
	/**
	 * 查询所有大分类
	 */
	public List<SuperType> getSuperTypeAll();
	
	/**
	 * 根据大分类ID查询所有小分类
	 */
	public List<SubType> getSubTypeBySuperID(int id);
	
	/**
	 * 根据商品ID更新商品点击次数
	 */
	public boolean updateGoodsByID(int id);
	
	/**
	 * 添加商品信息
	 */
	public boolean insertGoodsInfo(String _sql,Goods goods);
	
	/**
	 * 添加商品信息
	 */
	public boolean insertIntroduceInfo(String _sql,Introduce introduce);
	
	/**
	 * 更新商品信息
	 */
	public boolean updateGoodsInfo(String _sql,Goods goods);
	
	/**
	 * 更新商品详细信息
	 */
	public boolean updateIntroduceInfo(String _sql,Introduce introduce);
	
	/**
	 * 增加大分类
	 */
	public boolean insertSuperTypeInfo(SuperType superType);
	
	/**
	 * 根据ID修改大分类名称
	 */
	public boolean updateSuperTypeInfo(SuperType superType);
	
	/**
	 * 增加小分类
	 */
	public boolean insertSubTypeInfo(SubType subType);
	
	/**
	 * 根据ID修改小分类名称
	 */
	public boolean updateSubTypeInfo(SubType subType);
	
	/**
	 * 获取商品所有信息
	 * @return
	 */
	public List<Goods> getGoodsAll();
}
