package com.cafe.order.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.cafe.order.model.Kind;
import com.cafe.order.model.Menu;

public interface OrderDao {

	List<Kind> selectAllKind() throws SQLException;

	List<Menu> selectAllMenu() throws SQLException;

}
