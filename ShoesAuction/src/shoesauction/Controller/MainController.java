/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoesauction.Controller;

import java.sql.ResultSet;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;
import shoesauction.Helper.Helper;
import shoesauction.Model.MainModel;
import shoesauction.Query.MainQuery;

/**
 *
 * @author basazard
 */
public class MainController extends BaseController {
    Helper helper = new Helper();
    MainQuery query = new MainQuery();
    
    public boolean register(MainModel model) throws ParseException{
        Map <Integer, Object> map = new HashMap<>();
        map.put(1, model.getEmail());
        map.put(2, model.getUsername());
        map.put(3, model.getPassword());
        
        String sql = this.query.register;
        
        return this.preparedStatement(map, sql);
    }
    
    public boolean createBid(MainModel model) throws ParseException{
        Map <Integer, Object> map = new HashMap<>();
        map.put(1, model.getId_bid());
        map.put(2, model.getId_product());
        map.put(3, model.getTotal_bid());
        map.put(4, model.getUsername());
        String sql = this.query.createBid;
        
        return this.preparedStatement(map, sql);
    }
    
    public boolean updateBid(MainModel model) throws ParseException {
        Map <Integer, Object> map = new HashMap<>();
        map.put(1, model.getId_bid());
        map.put(2, model.getId_product());
        map.put(3, model.getTotal_bid());
        map.put(4, model.getUsername());
        String sql = this.query.updateBid;
        
        return this.preparedStatement(map, sql);
    }
    
    public boolean deleteBid(MainModel model) throws ParseException {
        Map <Integer, Object> map = new HashMap<>();
        map.put(1, model.getId_bid());
        
        String sql = this.query.deleteBid;
        
        return this.preparedStatement(map, sql);
    }
    
    public ResultSet get(){
        String sql = this.query.get;
        return this.get(sql);
    }
    
    public ResultSet showById(String id){
        String sql = this.query.showById;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, id);
        
        return this.getWithParamater(map, sql);
    }
    
    public ResultSet showByName(String name){
        String sql = this.query.showByName;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, helper.parseLikeQuery(name));
        
        return this.getWithParamater(map, sql);
    }
}
