package com.stock.Jdbcdao;

public class SQLQueries {
	static final String ADD_USER="INSERT INTO `user`(`username`, `password`, `email`, `money`) VALUES (?,?,?,'1000')";
	static final String CHECK_USER="SELECT * FROM `user` WHERE `username` = ?";
	static final String UPDATE_STOCKOWN="INSERT INTO `stockowned` (`SYMBOL`,`COMPANYNAME`,`QUANTITY`,`RATETODAY`, `username`) VALUES (?,?,?,?,?)";
    static final String CHECK_STOCKOWN="SELECT * FROM `stockowned` WHERE `SYMBOL` = ? AND `username` = ?";
    static final String INSERT_STOCKOWN="UPDATE `stockowned` SET `QUANTITY`=? WHERE `SYMBOL` = ? AND `username` = ?";
    static final String RETRIEVE_STOCKOWN="SELECT * FROM `stockowned` WHERE `username` = ?";
    static final String UPDATE_VIRTUAL_MONEY="UPDATE `user` SET `money` = ? WHERE `username` = ?";
    static final String GET_COMPANY_STOCKOWN="SELECT * FROM `stockowned` WHERE `username` = ? AND `SYMBOL`=?";
    static final String DELETE_COMPANY="DELETE FROM `stockowned` WHERE `username` = ? AND `SYMBOL`=?";
}
