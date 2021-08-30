package com.example.Artefactos.Model;

import com.example.Artefactos.Service.ConnectionMySQL;
import com.sun.org.slf4j.internal.LoggerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class DaoArtefactos {
    private Connection con;
    private CallableStatement cstm;
    private ResultSet rs;
    final private Logger CONSOLE = LoggerFactory.getLogger(DaoArtefactos.class);

    public List<BeanArtefactos>findAll(){
        List<BeanArtefactos> listArtefactos = new ArrayList<>();

        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call busquedaApa}");
            rs = cstm.executeQuery();

            while (rs.next()){
                BeanArtefactos beanArtefactos = new BeanArtefactos();
                BeanDirect beanDirect = new BeanDirect();

                beanArtefactos.setIdApa(rs.getLong("idApa"));
                beanArtefactos.setNombreApa(rs.getString("nombreApa"));
                beanArtefactos.setDiaApa(rs.getString("diaApa"));
                beanArtefactos.setStatusApa(rs.getInt("statusApa"));
                beanDirect.setIdDirect(rs.getLong("idDirect"));
                beanDirect.setDireccion(rs.getString("direccion"));
                beanDirect.setUrb(rs.getString("postal"));
                beanDirect.setEstado(rs.getString("estado"));
                beanDirect.setPais(rs.getString("pais"));
                beanArtefactos.setIdDirect(beanDirect);
                listArtefactos.add(beanArtefactos);


            }
        }catch (SQLException e){
            CONSOLE.error("Se ha encontrado el error: " + e);
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return listArtefactos;


    }
    public boolean create(BeanArtefactos beanArtefactos){
        boolean flag = false;
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call crear(?,?,?,?,?,?,?)}");
            cstm.setString(1,beanArtefactos.getNombreApa());
            cstm.setString(2,beanArtefactos.getIdDirect().getDireccion());
            cstm.setString(3,beanArtefactos.getIdDirect().getUrb());
            cstm.setInt(4,beanArtefactos.getIdDirect().getPostal());
            cstm.setString(5,beanArtefactos.getIdDirect().getEstado());
            cstm.setString(7,beanArtefactos.getDiaApa());
            flag = cstm.execute();

        }catch (SQLException e){
            CONSOLE.error("Se ha producido el error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
        return flag;
    }
    public BeanArtefactos findById(long id){
        BeanArtefactos beanArtefactos = null;
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call busquedaId(?)}");
            cstm.setLong(1,id);
            rs = cstm.executeQuery();

            if (rs.next()){
                beanArtefactos = new BeanArtefactos();
                BeanDirect beanDirect = new BeanDirect();

                beanArtefactos.setIdApa(rs.getLong("idApa"));
                beanArtefactos.setNombreApa(rs.getString("nombreApa"));
                beanArtefactos.setDiaApa(rs.getString("diaApa"));
                beanArtefactos.setStatusApa(rs.getInt("statusApa"));
                beanDirect.setIdDirect(rs.getLong("idDirect"));
                beanDirect.setDireccion(rs.getString("direccion"));
                beanDirect.setUrb(rs.getString("urb"));
                beanDirect.setPostal(rs.getInt("postal"));
                beanDirect.setEstado(rs.getString("estado"));
                beanDirect.setPais(rs.getString("pais"));
                beanArtefactos.setIdDirect(beanDirect);
            }
        }catch (SQLException e){
            CONSOLE.error("Se ha producido el error: " + e);
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return beanArtefactos;
    }
    public boolean update(BeanArtefactos beanArtefactos){
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call actualizar(?,?,?,?,?,?,?,?,?)}");
            cstm.setLong(1,beanArtefactos.getIdApa());
            cstm.setLong(2,beanArtefactos.getIdDirect().getIdDirect());
            cstm.setString(3,beanArtefactos.getNombreApa());
            cstm.setString(4,beanArtefactos.getIdDirect().getDireccion());
            cstm.setString(5,beanArtefactos.getIdDirect().getUrb());
            cstm.setInt(6,beanArtefactos.getIdDirect().getPostal());
            cstm.setString(7,beanArtefactos.getIdDirect().getEstado());
            cstm.setString(8,beanArtefactos.getIdDirect().getPais());
            cstm.setString(9,beanArtefactos.getDiaApa());
            flag = cstm.execute();

        }catch (SQLException e){
            CONSOLE.error("Se ha producido el error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
        return flag;
    }
    public boolean delete(long id){
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call eliminar(?)}");
            cstm.setLong(1, id);
            flag = cstm.execute();
        }catch(SQLException e){
            CONSOLE.error("Se ha encontrado el error: " + e.getMessage());
        }finally{
            ConnectionMySQL.closeConnection(con,cstm);
        }
        return flag;
    }


}
