package com.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.bean.Comment;
import com.bean.Goods;
import com.bean.Introduce;
import com.bean.SubType;
import com.bean.SuperType;
import com.dao.GoodsDao;
import com.dao.MemberDao;
import com.utils.DBConn;
import com.utils.variable;

public class GoodsDaoImpl implements GoodsDao {

	//
	@Override
	public boolean insertCommentInfo(Comment comment) {
		String sql = "insert into comment(goodsId,memberId,content) values(?,?,?)";
		boolean check = false;
		Connection conn = null;
		PreparedStatement prst = null;
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, comment.getGoods().getGoodsId());
			prst.setInt(2, comment.getMember().getMemberId());
			prst.setString(3, comment.getContent());
			prst.executeUpdate();
			check = true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(prst != null) prst.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(conn != null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		return check;
	}
	
	@Override
	public Goods getNewGoods() {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		Goods goods = new Goods();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql = "select goodsId,subId,goodsName,price,nowprice,picture,InTime,newsGoods,sale,hit from goods where goodsId in (select max(goodsId) from goods)";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			if(rs.next()) {
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setSubType(getSubTypeById(rs.getInt("subId")));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setPrice(rs.getInt("price"));
				goods.setNowPrice(rs.getInt("nowprice"));
				goods.setPicture(rs.getString("picture"));
				goods.setInTime(sdf.format(rs.getTimestamp("InTime")));
				goods.setNewsGoods(rs.getInt("newsGoods"));
				goods.setSale(rs.getInt("sale"));
				goods.setInTime(sdf.format(rs.getTimestamp("InTime")));
				goods.setHit(rs.getInt("hit"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return goods;
	}
	
	@Override
	public List<Goods> getGoodsOrderByComment() {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		List<Goods> goodses = new ArrayList<Goods>();
		String sql = "select goodsId from comment group by goodsId order by count(*)";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				Goods goods = getGoodsInfoByID(rs.getInt("goodsId"));
				goodses.add(goods);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return goodses;
	}
	
	@Override
	public List<Comment> getCommentByGoodsId(int id,int start ,int end) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Comment> comments = new ArrayList<Comment>();
		MemberDao dao = new MemberDaoImpl();
		String sql = "select commentId,goodsId,memberId,conTime,content FROM " +
				"(SELECT ROW_NUMBER() OVER ( ORDER BY commentId ASC) AS ROWNUM,* FROM comment where goodsId = ?)t " +
				"WHERE t.ROWNUM > ? AND t.ROWNUM <= ?";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, id);
			prst.setInt(2, start);
			prst.setInt(3, end);
			rs = prst.executeQuery();
			while(rs.next()) {
				Comment comment = new Comment(rs.getInt("commentId"), 
						getGoodsInfoByID(rs.getInt("goodsId")), 
						dao.getMemberByID(rs.getInt("memberId")), 
						sdf.format(rs.getTimestamp("conTime")), 
						rs.getString("content"));
				comments.add(comment);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return comments;
	}
	
	@Override
	public int getCommentCountByGoodsId(int id) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		int number = 0;
		String sql = "select count(*) from comment where goodsId = ?";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, id);
			rs = prst.executeQuery();
			if(rs.next()) {
				number = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return number;
	}
	
	@Override
	public Introduce getIntroduceByGoodsId(int id) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		Introduce intro = null;
		String sql = "select introduceId,goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption " +
				"from introduce where goodsId = ?";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, id);
			rs = prst.executeQuery();
			if(rs.next()) {
				 intro = new Introduce(rs.getInt("introduceId"), rs.getInt("memory"), rs.getString("brand"),rs.getString("color"), 
						rs.getString("distinguishability"), rs.getString("front_camera"), rs.getString("back_camera"), 
						rs.getString("cpu"), rs.getString("rate"), rs.getString("systems"), rs.getString("heft"), 
						rs.getString("battery"), rs.getString("thickness"), rs.getString("caption"), 
						getGoodsInfoByID(id));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return intro;
	}
	
	@Override
	public int getCountIntroduce() {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		int count = 0;
		String sql = "select COUNT(*) from introduce";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return count;
	}
	
	@Override
	public List<Introduce> getIntroduceAll(int start, int end) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		List<Introduce> introduces = new ArrayList<Introduce>();
		String sql = "select introduceId,goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption FROM " +
				"(SELECT ROW_NUMBER() OVER ( ORDER BY introduceId asc) AS ROWNUM,* FROM introduce)t WHERE t.ROWNUM > ? AND t.ROWNUM <=?";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, start);
			prst.setInt(2, end);
			rs = prst.executeQuery();
			while(rs.next()) {
			Introduce intro = new Introduce(rs.getInt("introduceId"), rs.getInt("memory"), rs.getString("brand"),rs.getString("color"), 
						rs.getString("distinguishability"), rs.getString("front_camera"), rs.getString("back_camera"), 
						rs.getString("cpu"), rs.getString("rate"), rs.getString("systems"), rs.getString("heft"), 
						rs.getString("battery"), rs.getString("thickness"), rs.getString("caption"), 
						getGoodsInfoByID(rs.getInt("goodsId")));
			introduces.add(intro);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return introduces;
	}
	
	@Override
	public List<Goods> getGoodsBySubID(int id,int start ,int end) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Goods> goodses = new ArrayList<Goods>();
		String sql = "select goodsId,subId,goodsName,price,nowprice,picture,InTime,hit FROM " +
				"(SELECT ROW_NUMBER() OVER ( ORDER BY goodsId ASC) AS ROWNUM,* FROM goods where subId = ?)t " +
				"WHERE t.ROWNUM > ? AND t.ROWNUM <= ?";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, id);
			prst.setInt(2, start);
			prst.setInt(3, end);
			rs = prst.executeQuery();
			while(rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setSubType(getSubTypeById(rs.getInt("subId")));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setPrice(rs.getInt("price"));
				goods.setNowPrice(rs.getInt("nowprice"));
				goods.setPicture(rs.getString("picture"));
				goods.setInTime(sdf.format(rs.getTimestamp("InTime")));
				goods.setHit(rs.getInt("hit"));
				goodses.add(goods);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return goodses;
	}
	

	@Override
	public List<Goods> getGoodsBySuperID(int id,int start ,int end) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Goods> goodses = new ArrayList<Goods>();
		String sql = "select goodsId,subId,goodsName,price,nowprice,picture,InTime,hit FROM " +
				"(SELECT ROW_NUMBER() OVER ( ORDER BY goodsId ASC) AS ROWNUM,* FROM goods where subId in " +
				"(select subId FROM subType where superId = ?))t " +
				"WHERE t.ROWNUM > ? AND t.ROWNUM <= ?";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, id);
			prst.setInt(2, start);
			prst.setInt(3, end);
			rs = prst.executeQuery();
			while(rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setSubType(getSubTypeById(rs.getInt("subId")));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setPrice(rs.getInt("price"));
				goods.setNowPrice(rs.getInt("nowprice"));
				goods.setPicture(rs.getString("picture"));
				goods.setInTime(sdf.format(rs.getTimestamp("InTime")));
				goods.setHit(rs.getInt("hit"));
				goodses.add(goods);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return goodses;
	}
	
	@Override
	public int getGoodsCountByName(String name) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		int count = 0;
		String sql = "select COUNT(*) from goods where goodsName like ?";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setString(1,"%" + name + "%");
			rs = prst.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return count;
	}
	
	@Override
	public int getGoodsCountByID(int id) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		int count = 0;
		String sql = "select COUNT(*) from goods where subId = ?";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, id);
			rs = prst.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return count;
	}
	

	@Override
	public int getGoodsCountBySuperID(int id) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		int count = 0;
		String sql = "select COUNT(*) FROM goods where subId in (select subId FROM subType where superId = ?)";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, id);
			rs = prst.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return count;
	}
	
	@Override
	public List<Goods> getNewGoodsAll() {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Goods> goodses = new ArrayList<Goods>();
		String sql = "select top " + variable.GOODSNUMBERTOP + " goodsId,subId,goodsName,price,nowprice,picture,InTime,newsGoods,hit from goods where newsGoods = 1";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setSubType(getSubTypeById(rs.getInt("subId")));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setPrice(rs.getInt("price"));
				goods.setNowPrice(rs.getInt("nowprice"));
				goods.setPicture(rs.getString("picture"));
				goods.setInTime(sdf.format(rs.getTimestamp("InTime")));
				goods.setHit(rs.getInt("hit"));
				goodses.add(goods);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return goodses;
	}

	@Override
	public List<Goods> getDiscountAll() {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Goods> goodses = new ArrayList<Goods>();
		String sql = "select top " + variable.GOODSNUMBERTOP + " goodsId,subId,goodsName,price,nowprice,picture,InTime,sale,hit from goods where sale = 1";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setSubType(getSubTypeById(rs.getInt("subId")));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setPrice(rs.getInt("price"));
				goods.setNowPrice(rs.getInt("nowprice"));
				goods.setPicture(rs.getString("picture"));
				goods.setInTime(sdf.format(rs.getTimestamp("InTime")));
				goods.setSale(rs.getInt("sale"));
				goods.setHit(rs.getInt("hit"));
				goodses.add(goods);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return goodses;
	}
	
	@Override
	public List<Goods> getGoodsByName(String name,int start ,int end) {
		Connection conn = null;
		//PreparedStatement prst = null;
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Goods> goodses = new ArrayList<Goods>();
		CallableStatement proc = null;
		/*String sql = "select goodsId,subId,goodsName,price,nowprice,picture,InTime,hit FROM " +
				"(SELECT ROW_NUMBER() OVER ( ORDER BY goodsId asc) AS ROWNUM,* FROM goods where goodsName like ?)t " +
				"WHERE t.ROWNUM > ? AND t.ROWNUM <= ?";*/
		String sql = "{call GetGoodsByPage(?,?,?)}";
		try {
			conn = DBConn.getConn();
			proc = conn.prepareCall(sql);
			//prst = conn.prepareStatement(sql);
			proc.setString(1, "%"+name+"%");
			proc.setInt(2, start);
			proc.setInt(3, end);
			rs = proc.executeQuery();
			while(rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setSubType(getSubTypeById(rs.getInt("subId")));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setPrice(rs.getInt("price"));
				goods.setNowPrice(rs.getInt("nowprice"));
				goods.setPicture(rs.getString("picture"));
				goods.setInTime(sdf.format(rs.getTimestamp("InTime")));
				goods.setHit(rs.getInt("hit"));
				goodses.add(goods);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(proc!=null) proc.close();
					//if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return goodses;
	}
	
	@Override
	public List<Goods> getHotGoods(int top) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Goods> goodses = new ArrayList<Goods>();
		String sql = "select top(?) goodsId,subId,goodsName,price,nowprice,picture,InTime,hit from goods order by hit desc";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, top);
			rs = prst.executeQuery();
			while(rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setPrice(rs.getInt("price"));
				goods.setNowPrice(rs.getInt("nowprice"));
				goods.setPicture(rs.getString("picture"));
				goods.setInTime(sdf.format(rs.getTimestamp("InTime")));
				goods.setHit(rs.getInt("hit"));
				goodses.add(goods);
			} 
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return goodses;
	
	}

	@Override
	public List<Goods> getRelatedGoods(int top,int id) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Goods> goodses = new ArrayList<Goods>();
		String sql = "select top(?) goodsId,subId,goodsName,price,nowprice,picture,InTime,hit FROM goods where subId  = ? order by hit desc";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, top);
			prst.setInt(2, id);
			rs = prst.executeQuery();
			while(rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setPrice(rs.getInt("price"));
				goods.setNowPrice(rs.getInt("nowprice"));
				goods.setPicture(rs.getString("picture"));
				goods.setInTime(sdf.format(rs.getTimestamp("InTime")));
				goods.setHit(rs.getInt("hit"));
				goodses.add(goods);
			} 
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return goodses;
	}

	@Override
	public Goods getGoodsInfoByID(int id) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Goods goods = null;
		String sql = "select goodsId,subId,goodsName,nowprice,price,picture,InTime,hit FROM goods where goodsId = ?";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, id);
			rs = prst.executeQuery();
			while(rs.next()) {
				goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setSubType(getSubTypeById(rs.getInt("subId")));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setPrice(rs.getInt("price"));
				goods.setNowPrice(rs.getInt("nowprice"));
				goods.setPicture(rs.getString("picture"));
				goods.setInTime(sdf.format(rs.getTimestamp("InTime")));
				goods.setHit(rs.getInt("hit"));
			} 
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return goods;
	
	}

	@Override
	public SuperType getSuperTypeById() {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		String sql = "select top(1) superId,typeName from superType";
		SuperType superType = null;
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				superType = new SuperType(rs.getInt("superId"), rs.getString("typeName"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return superType;
	}
	
	@Override
	public SubType getSubTypeById(int id) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		String sql = "select subId,typeName,superId from subType where subId = ?";
		SubType subType = new SubType();
		subType.setSubId(id);
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, id);
			rs = prst.executeQuery();
			while(rs.next()) {
				subType.setTypeName(rs.getString("typeName"));
				subType.setSuperType(getSuperTypeById(rs.getInt("superId")));
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return subType;
	}
	

	@Override
	public List<SubType> getSubTypeAll() {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		String sql = "select subId,typeName,superId from subType";
		List<SubType> subTypes = new ArrayList<SubType>();
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				SubType subType = new SubType(rs.getInt("subId"), rs.getString("typeName"), getSuperTypeById(rs.getInt("superId")));
				subTypes.add(subType);
			}
			rs.close();
			prst.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return subTypes;
	}
	
	@Override
	public SuperType getSuperTypeById(int id) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		String sql = "select superId,typeName from superType where superId = ?";
		SuperType superType = new SuperType();
		superType.setSuperId(id);
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, id);
			rs = prst.executeQuery();
			while(rs.next()) superType.setTypeName(rs.getString("typeName"));
			rs.close();
			prst.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return superType;
	}

	@Override
	public List<SuperType> getSuperTypeAll() {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		List<SuperType> supers = new ArrayList<SuperType>();
		String sql = "select superId,typeName from superType";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				SuperType superType = new SuperType(rs.getInt("superId"), rs.getString("typeName"));
				supers.add(superType);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return supers;
	}

	@Override
	public List<SubType> getSubTypeBySuperID(int id) {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		List<SubType> supers = new ArrayList<SubType>();
		String sql = "select subId,typeName,superId from subType where superId = ?";
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, id);
			rs = prst.executeQuery();
			while(rs.next()) {
				SubType subType = new SubType(rs.getInt("subId"), rs.getString("typeName"), getSuperTypeById(rs.getInt("superId")));
				supers.add(subType);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return supers;
	}


	@Override
	public boolean updateGoodsByID(int id) {
		Connection conn = null;
		PreparedStatement prst = null;
		boolean check = false;
		String sql = "update goods set hit = hit + 1 where goodsId = ?";
		try {
				conn = DBConn.getConn();
				prst = conn.prepareStatement(sql);
				prst.setInt(1, id);
				prst.executeUpdate();
				check = true;
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(prst!=null) prst.close();
			} catch(Exception e) {
				e.printStackTrace();
			}finally{
				try {
					if(conn!=null) conn.close();
				} catch(Exception e) {
					e.printStackTrace();
				} 
			}
		}
		return check;
	}


	@Override
	public boolean insertGoodsInfo(String _sql,Goods goods) {
		String sql = "insert into goods(subId,goodsName,price,nowprice,picture," +_sql + ",hit) values(?,?,?,?,?,?,?)";
		boolean check = false;
		Connection conn = null;
		PreparedStatement prst = null;
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, goods.getSubType().getSubId());
			prst.setString(2, goods.getGoodsName());
			prst.setInt(3, goods.getPrice());
			prst.setInt(4, goods.getNowPrice());
			prst.setString(5, goods.getPicture());
			prst.setInt(6, 1);
			prst.setInt(7, goods.getHit());
			prst.executeUpdate();
			check = true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(prst != null) prst.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(conn != null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		return check;
	}
	
	@Override
	public boolean insertIntroduceInfo(String _sql, Introduce introduce) {
		String sql = "insert into introduce(goodsId,memory,brand,color,distinguishability,front_camera,back_camera,cpu,rate,systems,heft,battery,thickness,caption) " +
				"values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		boolean check = false;
		Connection conn = null;
		PreparedStatement prst = null;
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, introduce.getGoods().getGoodsId());
			prst.setInt(2, introduce.getMemory());
			prst.setString(3, introduce.getBrand());
			prst.setString(4, introduce.getColor());
			prst.setString(5, introduce.getDistinguishability());
			prst.setString(6, introduce.getFront_camera());
			prst.setString(7, introduce.getBack_camera());
			prst.setString(8, introduce.getCpu());
			prst.setString(9, introduce.getRate());
			prst.setString(10, introduce.getSystems());
			prst.setString(11, introduce.getHeft());
			prst.setString(12, introduce.getBattery());
			prst.setString(13, introduce.getThickness());
			prst.setString(14, introduce.getCaption());
			prst.executeUpdate();
			check = true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(prst != null) prst.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(conn != null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		return check;
	}
	
	@Override
	public boolean updateGoodsInfo(String _sql, Goods goods) {
		String sql = "update goods set subId=?,goodsName=?,price=?,nowprice=?,picture=?,InTime=?,sale=?,newsGoods=?,hit=? where goodsId = ?";
		boolean check = false;
		Connection conn = null;
		PreparedStatement prst = null;
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, goods.getSubType().getSubId());
			prst.setString(2, goods.getGoodsName());
			prst.setInt(3, goods.getPrice());
			prst.setInt(4, goods.getNowPrice());
			prst.setString(5, goods.getPicture());
			prst.setString(6, goods.getInTime());
			if("sale".equals(_sql)) {
				prst.setInt(7, 1);
				prst.setInt(8, 0);
			}
			else if("newsGoods".equals(_sql)) {
				prst.setInt(7, 0);
				prst.setInt(8, 1);
			}
			prst.setInt(9, goods.getHit());
			prst.setInt(10, goods.getGoodsId());
			prst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(prst != null) prst.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(conn != null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		return check;
	}
	

	@Override
	public boolean updateIntroduceInfo(String _sql, Introduce introduce) {
		String sql = "update introduce set memory=?,brand=?,color=?,distinguishability=?,front_camera=?,back_camera=?,cpu=?,rate=?,systems=?,heft=?,battery=?,thickness=?,caption=? where goodsId = ?";
		boolean check = false;
		Connection conn = null;
		PreparedStatement prst = null;
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setInt(1, introduce.getMemory());
			prst.setString(2, introduce.getBrand());
			prst.setString(3, introduce.getColor());
			prst.setString(4, introduce.getDistinguishability());
			prst.setString(5, introduce.getFront_camera());
			prst.setString(6, introduce.getBack_camera());
			prst.setString(7, introduce.getCpu());
			prst.setString(8, introduce.getRate());
			prst.setString(9, introduce.getSystems());
			prst.setString(10, introduce.getHeft());
			prst.setString(11, introduce.getBattery());
			prst.setString(12, introduce.getThickness());
			prst.setString(13, introduce.getCaption());
			prst.setInt(14, introduce.getGoods().getGoodsId());
			prst.executeUpdate();
			check = true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(prst != null) prst.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(conn != null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		return check;
	}

	@Override
	public boolean updateSuperTypeInfo(SuperType superType) {
		String sql = "update superType set typeName = ? where superId = ?";
		boolean check = false;
		Connection conn = null;
		PreparedStatement prst = null;
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setString(1, superType.getTypeName());
			prst.setInt(2, superType.getSuperId());
			prst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(prst != null) prst.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(conn != null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		return check;
	
	}


	@Override
	public boolean updateSubTypeInfo(SubType subType) {
		String sql = "update subType set typeName = ?,superId = ? where subId = ?";
		boolean check = false;
		Connection conn = null;
		PreparedStatement prst = null;
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setString(1, subType.getTypeName());
			prst.setInt(2, subType.getSuperType().getSuperId());
			prst.setInt(3, subType.getSubId());
			prst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(prst != null) prst.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(conn != null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		return check;
	}


	@Override
	public boolean insertSuperTypeInfo(SuperType superType) {
		String sql = "insert into superType(typeName) values(?)";
		boolean check = false;
		Connection conn = null;
		PreparedStatement prst = null;
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setString(1, superType.getTypeName());
			prst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(prst != null) prst.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(conn != null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		return check;
	
	}

	@Override
	public boolean insertSubTypeInfo(SubType subType) {
		String sql = "insert into subType(typeName,superId) values(?,?)";
		boolean check = false;
		Connection conn = null;
		PreparedStatement prst = null;
		try {
			conn = DBConn.getConn();
			prst = conn.prepareStatement(sql);
			prst.setString(1, subType.getTypeName());
			prst.setInt(2, subType.getSuperType().getSuperId());
			prst.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(prst != null) prst.close();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(conn != null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		return check;
	}
	@Override
	public List<Goods> getGoodsAll() {
		Connection conn = null;
		PreparedStatement prst = null;
		ResultSet rs = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Goods> goodses = new ArrayList<Goods>();
		//CallableStatement proc = null;
		String sql = "select goodsId,goodsName,price,nowprice,InTime,hit FROM goods";
		//String sql = "{call GetGoodsByPage(?,?,?)}";
		try {
			conn = DBConn.getConn();
			//proc = conn.prepareCall(sql);
			prst = conn.prepareStatement(sql);
			rs = prst.executeQuery();
			while(rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsName(rs.getString("goodsName"));
				goods.setPrice(rs.getInt("price"));
				goods.setNowPrice(rs.getInt("nowprice"));
				goods.setInTime(sdf.format(rs.getTimestamp("InTime")));
				goods.setHit(rs.getInt("hit"));
				goodses.add(goods);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					//if(proc!=null) proc.close();
					if(prst!=null) prst.close();
				} catch(Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null) conn.close();
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return goodses;
	}
}
