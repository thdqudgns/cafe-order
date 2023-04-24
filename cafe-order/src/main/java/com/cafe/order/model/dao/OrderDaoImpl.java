package com.cafe.order.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.stereotype.Repository;

import com.cafe.order.model.Kind;
import com.cafe.order.model.Menu;

@Repository
public class OrderDaoImpl implements OrderDao{

	private DataSource dataSource;
	public OrderDaoImpl(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	public List<Kind> selectAllKind() throws SQLException {
		List<Kind> list = new ArrayList<>();
		try (
				Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(
						"select kind_id, kind_name from kind"
						);
		) {
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Kind k = new Kind();
				k.setKindId(rs.getInt("kind_id"));
				k.setKindName(rs.getString("kind_name"));
				list.add(k);
			}
			return list;
		}
	}
	@Override
	public List<Menu> selectAllMenu() throws SQLException {
		List<Menu> list = new ArrayList<>();
		try (
				Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(
						"select menu_id, kind_id, menu_name, img_path, hot_price, iced_price from menu"
						);
		) {
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Menu m = new Menu();
				m.setMenuId(rs.getInt("menu_id"));
				m.setKindId(rs.getInt("kind_id"));
				m.setMenuName(rs.getString("menu_name"));
				m.setImgPath(rs.getString("img_path"));
				m.setHotPrice(rs.getInt("hot_price"));
				m.setIcedPrice(rs.getInt("iced_price"));
				list.add(m);
			}
			return list;
		}
	}
	
}
