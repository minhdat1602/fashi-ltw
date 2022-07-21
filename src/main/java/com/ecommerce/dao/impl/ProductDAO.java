package com.ecommerce.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.dao.IProductDAO;
import com.ecommerce.mapper.CollectionMapper;
import com.ecommerce.mapper.ProductMapper;
import com.ecommerce.model.Collection;
import com.ecommerce.model.Product;
import com.ecommerce.model.ProductGroup;

public class ProductDAO extends AbstractDAO<Product> implements IProductDAO {

	@Override
	public List<Product> findAll() {
		StringBuilder sql = new StringBuilder("SELECT p.id, p.code,p.name,");
		sql.append("p.origin_price,p.sell_price,p.image_url,");
		sql.append("p.descriptions,p.status,p.new,p.hot,p.group_id,p.brand_id as brand_id,");
		sql.append("g.name as category,b.name as brand, c.name as collection ");
		sql.append("FROM products p join products_group g on p.group_id = g.id ");
		sql.append("join products_brand b on b.id = p.brand_id ");
		sql.append("join products_collection c on c.id = p.collection_id ");
		sql.append("where p.status = 1");
		return query(sql.toString(), new ProductMapper());
	}

	@Override
	public List<Product> findAll(String productGroup, String... attr) {
		StringBuilder sql = new StringBuilder("SELECT p.id, p.code,p.name,");
		sql.append("p.origin_price,p.sell_price,p.image_url,");
		sql.append("p.descriptions,p.status,p.new,p.hot,p.group_id,p.brand_id as brand_id,");
		sql.append("g.name as category,b.name as brand, c.name as collection ");
		sql.append("FROM products p join products_group g on p.group_id = g.id ");
		sql.append("join products_brand b on b.id = p.brand_id ");
		sql.append("join products_collection c on c.id = p.collection_id ");
		sql.append("WHERE ");

		sql.append("group_id in (SELECT id ");
		sql.append("FROM products_group ");
		sql.append("where `id` in (SELECT g3.id ");
		sql.append("FROM products_group g1 join products_group g2 ");
		sql.append("on g1.id = g2.parent_id ");
		sql.append("JOIN products_group g3 on g2.id = g3.parent_id ");
		sql.append("WHERE  p.status = 1 and g1.`code` = " + "'" + productGroup + "')) and (");

		for (int i = 0; i < attr.length; i++) {
			sql.append(attr[i] + " = 1");
			if (i != attr.length - 1) {
				sql.append(" or ");
			} else
				sql.append(")");
		}
		return query(sql.toString(), new ProductMapper());
	}

	@Override
	public Product findOne(Integer id) {
		StringBuilder sql = new StringBuilder("SELECT p.id, p.code,p.name,");
		sql.append("p.origin_price,p.sell_price,p.image_url,");
		sql.append("p.descriptions,p.status,p.new,p.hot,p.group_id,p.brand_id as brand_id,");
		sql.append("g.name as category,b.name as brand, c.name as collection ");
		sql.append("FROM products p join products_group g on p.group_id = g.id ");
		sql.append("join products_brand b on b.id = p.brand_id ");
		sql.append("join products_collection c on c.id = p.collection_id ");
		sql.append("WHERE  p.status = 1 and p.id = ?");
		List<Product> result = query(sql.toString(), new ProductMapper(), id);
		return (result.size() > 0) ? result.get(0) : null;
	}
	
	@Override
	public List<Product> findAllByPromotionId(Integer id) {
		StringBuilder sql = new StringBuilder("SELECT p.id, p.code,p.name,");
		sql.append("p.origin_price,p.sell_price,p.image_url,");
		sql.append("p.descriptions,p.status,p.new,p.hot,p.group_id,p.brand_id as brand_id,");
		sql.append("g.name as category,b.name as brand, c.name as collection ");
		sql.append("FROM products p join products_group g on p.group_id = g.id ");
		sql.append("join products_brand b on b.id = p.brand_id ");
		sql.append("join products_collection c on c.id = p.collection_id ");
		sql.append("join promotion_product pp on p.id = pp.product_id ");
		sql.append("where  p.status = 1 and pp.promotion_id = ?");
		return query(sql.toString(), new ProductMapper(),id);
	}

	@Override
	public List<Product> findRelatedProduct(Integer groupId) {
		String sql = "select p.*, gr.name as category, br.name as brand, cl.name as collection " +
				"from products p join products_group gr on gr.id = p.group_id" +
				" join products_brand br on br.id = p.brand_id join products_collection cl on cl.id = p.collection_id" +
				" where p.group_id = ?";
		return query(sql, new ProductMapper(), groupId);
	}


	@Override
	public List<Product> findAllByCollectionId(Integer id) {
		StringBuilder sql = new StringBuilder("SELECT p.*, ");
		sql.append("g.name as category,b.name as brand, c.name as collection ");
		sql.append("FROM products p join products_group g on p.group_id = g.id ");
		sql.append("join products_brand b on b.id = p.brand_id ");
		sql.append("join products_collection c on c.id = p.collection_id ");
		sql.append("where  p.status = 1 and p.collection_id= ?");
		return query(sql.toString(), new ProductMapper(), id);
	}

	@Override
	public Integer getTotalProduct() {
		String sql = "select count(id) from products where status = 1";
		return count(sql);
	}

	@Override
	public List<Product> findAll(Product pageable) {
		StringBuilder sql = new StringBuilder("SELECT p.id, p.code,p.name,");
		sql.append("p.origin_price,p.sell_price,p.image_url,");
		sql.append("p.descriptions,p.status,p.new,p.hot,p.group_id,p.brand_id as brand_id,");
		sql.append("g.name as category,b.name as brand, c.name as collection ");
		sql.append("FROM products p join products_group g on p.group_id = g.id ");
		sql.append("join products_brand b on b.id = p.brand_id ");
		sql.append("join products_collection c on c.id = p.collection_id ");
		sql.append("where p.status = 1 ");
		sql.append(" order by "+ pageable.getSorting() + " " + pageable.getSortBy() +" limit ?,? ");
		return query(sql.toString(), new ProductMapper(), pageable.getOffset(),pageable.getMaxPageItem());
	}

	@Override
	public void delete(int id) {
		String sql = "update products set status = 0 where id = ?";
		update(sql, id);
	}

	@Override
	public Integer save(Product product) {
		StringBuilder sql = new StringBuilder("insert into products (code,name,origin_price,sell_price,group_id,brand_id,image_url,descriptions,collection_id,status,new,hot)");
		sql.append(" values (?,?,?,?,?,?,?,?,?,?,?,?)");
		return insert(sql.toString(), product.getCode(),
				product.getName(),
				product.getOriginPrice(),
				product.getSellPrice(),
				product.getGroupId(),
				product.getBrandId(),
				product.getImageUrl(),
				product.getDescription(),
				product.getCollectionId(),
				product.getStatus(),
				product.getNewProduct(),
				product.getHotProduct()
				);
	}
	
	@Override
	public List<Product> findAll(String segment, String group, Integer isHot, Integer isNew) {
		StringBuilder sb = new StringBuilder();
		sb.append("select p.id, p.name, p.code, p.origin_price, p.discount, p.sell_price, ");
		sb.append("gr.code as group, sm.code as segment,mt.code as material,");
		sb.append("br.code as brand, cl.code as collection, p.image_url, p.descriptions, p.status, p.new, p.hot ");
		sb.append("from products p join products_group gr on p.group_id = gr.id ");
		sb.append("join products_segment sm on p.segment_id = sm.id ");
		sb.append("join products_material mt on p.material_id = mt.id ");
		sb.append("join products_brand br on p.brand_id = br.id ");
		sb.append("join products_collection cl on p.collection_id = cl.id ");
		sb.append("where gr.code = ? and sm.code = ? and p.hot = ? and p.new = ?");

		String sql = "select p.id, p.name, p.code, p.origin_price, p.discount, p.sell_price, " +
				"gr.code as group_code, sm.code as segment_code,mt.code as material_code, " +
				"br.code as brand_code, cl.code as collection_code, p.image_url, p.descriptions, p.status, p.new, p.hot  " +
				"from products p join products_group gr on p.group_id = gr.id  " +
				"join products_segment sm on p.segment_id = sm.id  " +
				"join products_material mt on p.material_id = mt.id  " +
				"join products_brand br on p.brand_id = br.id  " +
				"join products_collection cl on p.collection_id = cl.id  " +
				"where gr.code = ? and sm.code = ? and p.hot = ? and p.new = ? and status = ?";

		List<Product> list = query(sql, new ProductMapper(), segment, group, isHot, isNew, 1);
		return list;
	}

	@Override
	public List<Product> findByGroupId(Integer groupId) {
		String sql = "select * from products where group_id = ?";
		return query(sql, new ProductMapper(), groupId);
	}

	@Override
	public boolean update(Product product) {
		StringBuilder sql = new StringBuilder("update products products set code =?,name=?,origin_price=?,sell_price=?,group_id=?,brand_id=?,image_url=?,descriptions=? ");
		sql.append(" where id = ?");
		return updated(sql.toString(), 
				product.getCode(),
				product.getName(),
				product.getOriginPrice(),
				product.getSellPrice(),
				product.getGroupId(),
				product.getBrandId(),
				product.getImageUrl(),
				product.getDescription(),
				product.getId()
				);
	}
	
	@Override
	public boolean importProduct(Product product) {
		StringBuilder sql = new StringBuilder("update products products set code =?,name=?,origin_price=?,sell_price=?,group_id=?,brand_id=?,image_url=?,descriptions=? ");
		sql.append(" where id = ?");
		return updated(sql.toString(), 
				product.getCode(),
				product.getName(),
				product.getOriginPrice(),
				product.getSellPrice(),
				product.getGroupId(),
				product.getBrandId(),
				product.getImageUrl(),
				product.getDescription(),
				product.getId()
				);
	}

	@Override
	public List<Product> findAllByKey(String filterAttr,String key) {
		StringBuilder sql = new StringBuilder("SELECT p.id, p.code,p.name,");
		sql.append("p.origin_price,p.sell_price,p.image_url,");
		sql.append("p.descriptions,p.status,p.new,p.hot,p.group_id,p.brand_id as brand_id,");
		sql.append("g.name as category,b.name as brand, c.name as collection ");
		sql.append("FROM products p join products_group g on p.group_id = g.id ");
		sql.append("join products_brand b on b.id = p.brand_id ");
		sql.append("join products_collection c on c.id = p.collection_id ");
		sql.append("where p.status = 1 and p."+filterAttr+" like ?");
		return query(sql.toString(), new ProductMapper(),key);
	}

	@Override
	public Integer countBuyTimes(Integer id) {
		StringBuilder sql = new StringBuilder("SELECT sum(od.quantity) as totalBuyTimes from products p join stocks s on p.id =s.product_id ");
		sql.append("join orders_detail od on s.id = od.stock_id where p.id = ?");
		return count(sql.toString(), id);
	}

	@Override
	public List<Product> findAllNotInPromotionId(Product pageable, int promotionId) {
		StringBuilder sql = new StringBuilder("SELECT p.id, p.code,p.name,");
		sql.append("p.origin_price,p.sell_price,p.image_url,");
		sql.append("p.descriptions,p.status,p.new,p.hot,p.group_id,p.brand_id as brand_id,");
		sql.append("g.name as category,b.name as brand, c.name as collection ");
		sql.append("FROM products p join products_group g on p.group_id = g.id ");
		sql.append("join products_brand b on b.id = p.brand_id ");
		sql.append("join products_collection c on c.id = p.collection_id ");
		sql.append("where p.status = 1  and p.id not in (select product_id from promotion_product where promotion_id = ?)");
		sql.append(" order by "+ pageable.getSorting() + " " + pageable.getSortBy() +" limit ?,? ");
		return query(sql.toString(), new ProductMapper(), promotionId, pageable.getOffset(),pageable.getMaxPageItem());
	}
	//dat
	public List<Product> findAll(Product pageable, Integer isHot, Integer isNew,
								 String groupName, String brandName, String collectionName) {

		String sql = "select p.*, gr.name as category, br.name as brand, cl.name as collection " +
				" from products p " +
				" join products_brand br on br.id = p.brand_id " +
				" join products_group gr on gr.id = p.group_id " +
				" join products_collection cl on cl.id = p.collection_id " +
				" where p.status = 1 ";
		if (isHot != null)
			sql += " and hot = ? ";
		else
			sql += " and hot is not ?";
		if (isNew != null)
			sql += " and new = ?";
		else
			sql += " and new is not ?";
		if (groupName != null)
			sql += " and gr.name = ?";
		else
			sql += " and gr.name is not ?";
		if (brandName != null)
			sql += " and br.name = ?";
		else
			sql += " and br.name is not ?";
		if (collectionName != null)
			sql += " and cl.name = ?";
		else
			sql += " and cl.name is not ?";
		sql += " limit ? offset ? ";
		return query(sql, new ProductMapper(), isHot, isNew, groupName, brandName, collectionName,
				pageable.getLimit(), pageable.getOffset());
	}

	// Câu truy vấn cấp bậc huyền thoại
	public List<Product> findAll(Product pageable, Integer isHot, Integer isNew,
								 String[] groupNameArr, String[] brandNameArr, String[] collectionNameArr
			, Integer level) {
		String[] param;

		String sql = "select p.*, lv3.name as category, br.name as brand, cl.name as collection " +
				" from products p " +
				" join products_brand br on br.id = p.brand_id " +
				" join products_group lv3 on lv3.id = p.group_id ";
		if (level <= 2)
			sql += " join products_group lv2 on lv2.id = lv3.parent_id ";
		if (level == 1)
			sql += " join products_group lv1 on lv1.id = lv2.parent_id ";

		sql += " join products_collection cl on cl.id = p.collection_id " +
				" where p.status = 1 ";

		if (isHot != null)
			sql += " and hot = ? ";
		else
			sql += " and hot is not ?";
		if (isNew != null)
			sql += " and new = ?";
		else
			sql += " and new is not ?";
		if (groupNameArr != null)
			for (int i = 0; i < groupNameArr.length; i++) {
				if (i == 0)
					sql += " and lv" + level + ".name = ? ";
				else
					sql += " or lv" + level + ".name = ? ";
			}
		else
			sql += " and lv" + level + ".name is not ? ";
		if (brandNameArr != null)
			for (int i = 0; i < brandNameArr.length; i++) {
				if (i == 0)
					sql += " and br.name = ? ";
				else
					sql += " or br.name = ? ";
			}
		else
			sql += " and br.name is not ? ";
		if (collectionNameArr != null)
			for (int i = 0; i < collectionNameArr.length; i++) {
				if (i == 0)
					sql += " and cl.name = ?";
				else
					sql += " or cl.name = ? ";
			}
		else
			sql += " and cl.name is not ?";
		sql += " limit ? offset ? ";

		List<Product> results = new ArrayList<Product>();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = getConnection();
		if (connection != null) {
			try {
				preparedStatement = connection.prepareStatement(sql);
				int n = 1;
				if (isHot != null)
					preparedStatement.setInt(n++, isHot);
				else
					preparedStatement.setString(n++, null);
				if (isNew != null)
					preparedStatement.setInt(n++, isNew);
				else
					preparedStatement.setString(n++, null);
				if (groupNameArr != null)
					for (int i = 0; i < groupNameArr.length; i++) {
						preparedStatement.setString(n++, groupNameArr[i]);
					}
				else {
					preparedStatement.setString(n++, null);
				}
				if (brandNameArr != null)
					for (int i = 0; i < brandNameArr.length; i++) {
						preparedStatement.setString(n++, brandNameArr[i]);
					}
				else
					preparedStatement.setString(n++, null);
				if (collectionNameArr != null)
					for (int i = 0; i < collectionNameArr.length; i++) {
						preparedStatement.setString(n++, collectionNameArr[i]);
					}
				else
					preparedStatement.setString(n++, null);

				preparedStatement.setInt(n++, pageable.getLimit());
				preparedStatement.setInt(n++, pageable.getOffset());

				resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {
					Product product = new Product();
					product.setId(resultSet.getInt("id"));
					product.setCode(resultSet.getString("code"));
					product.setName(resultSet.getString("name"));
					product.setOriginPrice(resultSet.getInt("origin_price"));
					product.setSellPrice(resultSet.getInt("sell_price"));
					product.setGroupProduct(resultSet.getString("category"));
					product.setGroupId(resultSet.getInt("group_id"));
					product.setBrandId(resultSet.getInt("brand_id"));
					product.setBrandProduct(resultSet.getString("brand"));
					product.setCollectionProduct(resultSet.getString("collection"));
					product.setImageUrl(resultSet.getString("image_url"));
					product.setDescription(resultSet.getString("descriptions"));
					product.setStatus(resultSet.getInt("status"));
					product.setNewProduct(resultSet.getInt("new"));
					product.setHotProduct(resultSet.getInt("hot"));

					results.add(product);
				}
				return results;
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

	// Câu truy vấn cấp bậc huyền thoại
	public List<Product> findAll(Product pageable, Integer isHot, Integer isNew, Integer level, String words) {
		String[] param;

		String sql = "select p.*, lv3.name as category, br.name as brand, cl.name as collection " +
				" from products p " +
				" join products_brand br on br.id = p.brand_id " +
				" join products_group lv3 on lv3.id = p.group_id ";
		if (level <= 2)
			sql += " join products_group lv2 on lv2.id = lv3.parent_id ";
		if (level == 1)
			sql += " join products_group lv1 on lv1.id = lv2.parent_id ";

		sql += " join products_collection cl on cl.id = p.collection_id " +
				" where p.status = 1 ";

		if (isHot != null)
			sql += " and hot = ? ";
		else
			sql += " and hot is not ?";
		if (isNew != null)
			sql += " and new = ?";
		else
			sql += " and new is not ?";
		if (pageable.getGroupNameArr() != null) {
			for (int i = 0; i < pageable.getGroupNameArr().length; i++) {
				if (i == 0)
					sql += " and ( lv" + level + ".name = ? ";
				else
					sql += " or lv" + level + ".name = ? ";
			}
			sql += " ) ";
		} else
			sql += " and lv" + level + ".name is not ? ";
		if (pageable.getBrandNameArr() != null) {
			for (int i = 0; i < pageable.getBrandNameArr().length; i++) {
				if (i == 0)
					sql += " and ( br.name = ? ";
				else
					sql += " or br.name = ? ";
			}
			sql += " ) ";
		} else
			sql += " and br.name is not ? ";
		if (pageable.getCollectionNameArr() != null) {
			for (int i = 0; i < pageable.getCollectionNameArr().length; i++) {
				if (i == 0)
					sql += "and ( cl.name = ?";
				else
					sql += " or cl.name = ? ";
			}
			sql += " ) ";
		} else
			sql += " and cl.name is not ?";
		//tiem kiem
		if (level == 1)
			sql += " and ( lv3.name like " + " ? or " + " lv2.name like " + " ? or" +
					" lv1.name like " + " ? or " + " p.name like " + " ? " + " ) ";
		else if (level == 2)
			sql += " and ( lv3.name like " + " ? or " + " lv2.name like " + " ? or" +
					" p.name like " + " ? " + " ) ";

		sql += " and sell_price between ? and ? ";
		sql += " order by hot, new desc ";
		sql += " limit ? offset ? ";

		List<Product> results = new ArrayList<Product>();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Connection connection = getConnection();
		if (connection != null) {
			try {
				preparedStatement = connection.prepareStatement(sql);
				int n = 1;
				if (isHot != null)
					preparedStatement.setInt(n++, isHot);
				else
					preparedStatement.setString(n++, null);
				if (isNew != null)
					preparedStatement.setInt(n++, isNew);
				else
					preparedStatement.setString(n++, null);
				if (pageable.getGroupNameArr() != null)
					for (int i = 0; i < pageable.getGroupNameArr().length; i++) {
						preparedStatement.setString(n++, pageable.getGroupNameArr()[i]);
					}
				else {
					preparedStatement.setString(n++, null);
				}
				if (pageable.getBrandNameArr() != null)
					for (int i = 0; i < pageable.getBrandNameArr().length; i++) {
						preparedStatement.setString(n++, pageable.getBrandNameArr()[i]);
					}
				else
					preparedStatement.setString(n++, null);
				if (pageable.getCollectionNameArr() != null)
					for (int i = 0; i < pageable.getCollectionNameArr().length; i++) {
						preparedStatement.setString(n++, pageable.getCollectionNameArr()[i]);
					}
				else
					preparedStatement.setString(n++, null);
				if (level == 1)
					for (int i = 0; i < 4; i++) {
						preparedStatement.setString(n++, words);
					}
				else if (level == 2)
					for (int i = 0; i < 3; i++) {
						preparedStatement.setString(n++, words);
					}

				preparedStatement.setInt(n++, pageable.getPriceMin());
				preparedStatement.setInt(n++, pageable.getPriceMax());


				preparedStatement.setInt(n++, pageable.getLimit());
				preparedStatement.setInt(n++, pageable.getOffset());


				resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {
					Product product = new Product();
					product.setId(resultSet.getInt("id"));
					product.setCode(resultSet.getString("code"));
					product.setName(resultSet.getString("name"));
					product.setOriginPrice(resultSet.getInt("origin_price"));
					product.setSellPrice(resultSet.getInt("sell_price"));
					product.setGroupProduct(resultSet.getString("category"));
					product.setGroupId(resultSet.getInt("group_id"));
					product.setBrandId(resultSet.getInt("brand_id"));
					product.setBrandProduct(resultSet.getString("brand"));
					product.setCollectionProduct(resultSet.getString("collection"));
					product.setImageUrl(resultSet.getString("image_url"));
					product.setDescription(resultSet.getString("descriptions"));
					product.setStatus(resultSet.getInt("status"));
					product.setNewProduct(resultSet.getInt("new"));
					product.setHotProduct(resultSet.getInt("hot"));

					results.add(product);
				}
				return results;
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
}
