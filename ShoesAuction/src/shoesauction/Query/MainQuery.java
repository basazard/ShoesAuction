/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoesauction.Query;
/**
 *
 * @author basazard
 */
public class MainQuery {
    public String register = "INSERT INTO pengguna (email, username, password) values (?,?,?)";
    public String login = "SELECT * FROM pengguna WHERE username = ? AND password = ?";
    
    public String createBid = "INSERT INTO bid (id_bid, id_product, total_bid, username) values (?,?,?,?)";
    public String updateBid = "UPDATE bid SET id_product = ?, total_bid = ?, username = ? WHERE id_bid =?";
    public String deleteBid = "DELETE FROM bid WHERE id_bid = ?";
    
    public String createProduct = "INSERT INTO product (id_product, nama_product, stock, start_bid, start_date, end_date) VALUES (?,?,?,?,?,?)";
    public String updateProduct = "UPDATE product SET nama_product = ?, stock = ?, start_bid = ?, start_date = ?, end_date = ? WHERE id_product =? ";
    public String deleteProduct = "DELETE FROM product WHERE id_product = ?";
    
    public String createTransaction = "INSERT INTO transaksi (id_transaksi, id_bid, id_product, username, jumlah, end_bid) VALUES (?,?,?,?,?,?)";
    public String updateTransaction = "UPDATE transaksi SET id_bid = ?, id_product = ?, username = ?, jumlah = ?, end_bid =? WHERE id_transaksi =?";
    public String deleteTransaction ="DELETE FROM transaksi WHERE id_transaksi = ?";
    
    public String getBid = "SELECT * FROM bid";
    public String getProduct = "SELECT * FROM product";
    public String getTransaction = "SELECT * FROM transaksi";
    
    public String showById = "SELECT * FORM bid WHERE id = ?";
    public String showByName = "SELECT * FROM bid WHERE name LIKE ?";    
    
    public String createIDproduct = "SELECT * FROM product ORDER by id_product DESC";
    public String createIDbid = "SELECT * FROM bid ORDER by id_bid DESC";
    public String createIDtransaction = "SELECT * FROM transaksi ORDER by id_transaksi DESC";
    
    public String cb_product = "select id_product from product order by id_product asc";
    public String getUsername = "select username from pengguna order by username asc";
}
