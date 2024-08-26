package com.mycompany.ecommerce.dao;

import com.mycompany.ecommerce.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean b=false;
        try {
            Session session = this.factory.openSession();
            Transaction ts=session.beginTransaction();
            session.save(product);
            ts.commit();
            session.close();
            b=true;
        } 
        catch (Exception e) {
            e.printStackTrace();;
            b=false;
        }
        return b;
    }
    public List<Product> getAllProducts(){
        Session s=this.factory.openSession();
        Query q=s.createQuery("from Product");    
        List<Product> list=q.list();
        s.close();
        return list;
    }
    public List<Product> getAllProductsById(int cid){
        Session s=this.factory.openSession();
        Query q=s.createQuery("from Product as p where p.category.categoryId=: id");    
        q.setParameter("id", cid);
        List<Product> list=q.list();
        s.close();
        return list;
    }
}
