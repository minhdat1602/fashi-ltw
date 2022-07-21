package com.ecommerce.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.omg.CORBA.REBIND;

import com.ecommerce.dao.IReviewDAO;
import com.ecommerce.mapper.ReviewMapper;
import com.ecommerce.model.Review;

public class ReviewDAO extends AbstractDAO<Review> implements IReviewDAO {

	@Override
	public List<Review> findAll() {
		StringBuilder sql = new StringBuilder("select * from reviews ");
		return query(sql.toString(), new ReviewMapper());
	}

	@Override
	public List<Integer> findAllProductId() {
		List<Integer> listProductId = new ArrayList<Integer>();
		String sql = "select distinct product_id from reviews";
		Connection connection = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				listProductId.add(rs.getInt(1));
			}
			return listProductId;
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				return null;
			}
		}
	}

	@Override
	public Integer countByProductId(Integer productId) {
		String sql = "select count(product_id) from reviews where product_id = ?";
		return count(sql, productId);
	}

	@Override
	public Double avgStar(Integer productId) {
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = getConnection();
		String sql = "select round(avg(vote),1) from reviews where product_id = ?";
		if (connection != null) {
			try {
				preparedStatement = connection.prepareStatement(sql);
				setParameters(preparedStatement, productId);
				resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					return resultSet.getDouble(1);
				}
				return null;
			} catch (SQLException e) {
				return null;
			} finally {
				try {
					if (resultSet != null) {
						resultSet.close();
					}
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (Exception e) {
					return null;
				}
			}
			
		}
		return null;
	}

	@Override
	public List<Review> findAllByProductId(Integer id) {
		String sql = "select * from reviews where product_id = ?";
		return query(sql, new ReviewMapper(), id);
	}

	@Override
	public boolean update(Review review) {
		String sql = "update reviews set reply = ? where id = ?";
		return updated(sql, review.getReply(), review.getId());
	}

	@Override
	public Integer save(Review review) {
		String sql = "insert into reviews (commentator, product_id, vote, comment, date_review) values (?,?,?,?,?)";
		return insert(sql, 
						review.getCommentator(), 
						review.getProductId(),
						review.getVote(),
						review.getComment(),
						review.getDateReview());
	}

}
