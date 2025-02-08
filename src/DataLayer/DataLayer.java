package DataLayer;

import java.sql.*;
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
                Connection conntion = DriverManager.getConnection(connection.getConnectionString());
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
}
