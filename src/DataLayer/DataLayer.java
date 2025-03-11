package DataLayer;

import javax.swing.table.DefaultTableModel;
import java.sql.*;
import java.util.List;
import java.util.Map;

public class DataLayer {
    MicrosoftDataLayerConnection connection;
    public DataLayer(){
        connection = new MicrosoftDataLayerConnection("localhost","sa","hell0104859520","JavaProject");
    }
    public ResultSet SelectStoreProcedure(String storeProcedure, Map<String,Object> params) throws SQLException {
        StringBuilder storedProcedure = new StringBuilder("{call " + storeProcedure + "(");
        for (int i = 0; i < params.size(); i++) {
            storedProcedure.append(i == 0 ? "?" : ",?");
        }
        storedProcedure.append(")}");
        try {
            Connection conntion = getConntion();
            CallableStatement cmd = conntion.prepareCall(storedProcedure.toString());
              int index = 1;
             for (Object value : params.values()) {
                 cmd.setObject(index++, value);
            }
             return cmd.executeQuery();

            }catch (Exception exception){
            System.out.println(exception.getMessage());
            throw  exception;
        }
    }
    public DefaultTableModel SelectGetTable(String proc , Map<String,Object> params) throws SQLException {
        DefaultTableModel model = new DefaultTableModel();

        StringBuilder storedProcedure = new StringBuilder("{call " + proc + "(");
        if(params != null) {
            for (int i = 0; i < params.size(); i++) {
                storedProcedure.append(i == 0 ? "?" : ",?");
            }
        }
        storedProcedure.append(")}");
        try{
            Connection conntion = getConntion();
            Statement stmt = conntion.createStatement();
            ResultSet rs = stmt.executeQuery(storedProcedure.toString());
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            for (int i = 1; i <= columnCount; i++) {
                model.addColumn(metaData.getColumnName(i));
            }
            while (rs.next()) {
                Object[] row = new Object[columnCount];
                for (int i = 1; i <= columnCount; i++) {
                    row[i - 1] = rs.getObject(i);
                }
                model.addRow(row);
            }
            rs.close();
            stmt.close();
            conntion.close();
            return model;

        }
        catch (Exception exception){
            throw exception;
        }
    }


    public DefaultTableModel SelectGetTable(String query ) throws SQLException {
        DefaultTableModel model = new DefaultTableModel();
        try{
            Connection conntion = getConntion();
            Statement stmt = conntion.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            for (int i = 1; i <= columnCount; i++) {
                model.addColumn(metaData.getColumnName(i));
            }
            while (rs.next()) {
                Object[] row = new Object[columnCount];
                for (int i = 1; i <= columnCount; i++) {
                    row[i - 1] = rs.getObject(i);
                }
                model.addRow(row);
            }
            rs.close();
            stmt.close();
            conntion.close();
            return model;

        }
        catch (Exception exception){
            throw exception;
        }
    }

    public void InsertOrUpdateOrDelete(String proc , List<Object> obj){


        StringBuilder storedProcedure = new StringBuilder("{call " + proc + "(");
        for (int i = 0; i < obj.size(); i++) {
            storedProcedure.append(i == 0 ? "?" : ",?");
        }
        storedProcedure.append(")}");

        try {
            Connection conntion = getConntion();
            var stmt = conntion.prepareCall(storedProcedure.toString());
            int index = 1;
            for (Object value : obj) {
                stmt.setObject(index++, value);
            }
            stmt.execute();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }



    }

    public Connection getConntion() throws SQLException {
        Connection conntion = DriverManager.getConnection(connection.getConnectionString());
        return conntion;
    }

    public int InsertOrUpdateOrDelete(String proc , List<Object> obj, int outputParamterIndex){
        StringBuilder storedProcedure = new StringBuilder("{call " + proc + "(");
        for (int i = 0; i < obj.size()+1; i++) {
            storedProcedure.append(i == 0 ? "?" : ",?");
        }
        storedProcedure.append(")}");

        try {
            Connection conntion = getConntion();
            var stmt = conntion.prepareCall(storedProcedure.toString());
            int index = 1;
            for (Object value : obj) {
                stmt.setObject(index++, value);
            }
            stmt.registerOutParameter(outputParamterIndex , Types.INTEGER);
            stmt.execute();

            return stmt.getInt(outputParamterIndex);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int InsertOrUpdateOrDelete(String proc , List<Object> obj, int[] outputParamterIndex){
        StringBuilder storedProcedure = new StringBuilder("{call " + proc + "(");
        for (int i = 0; i < obj.size()+1; i++) {
            storedProcedure.append(i == 0 ? "?" : ",?");
        }
        storedProcedure.append(")}");

        try {
            Connection conntion = getConntion();
            var stmt = conntion.prepareCall(storedProcedure.toString());
            int index = 1;
            for (Object value : obj) {
                stmt.setObject(index++, value);
            }
            for (int outParam : outputParamterIndex) {
                stmt.registerOutParameter(outParam, Types.INTEGER);
            }
            stmt.execute();

            return stmt.getInt(outputParamterIndex[0]);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
