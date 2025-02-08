package DataLayer;

public class MicrosoftDataLayerConnection {


    private  String server;
    private  String database;
    private  String userName;
    private  String password;
    private  int port;
    public MicrosoftDataLayerConnection(String server, String userName , String password, String database){
        this.server = server;
        this.userName = userName;
        this.password = password;
        this.database = database;
        this.port = 1433;
    }

    public String getServer() {
        return server;
    }

    public void setServer(String server) {
        this.server = server;
    }

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public String getConnectionString() {
        return "jdbc:sqlserver://"+server+":"+port+";databaseName="+database+";user="+userName+";password="+password+";encrypt=false";
    }
}
