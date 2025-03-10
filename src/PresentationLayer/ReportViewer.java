package PresentationLayer;

import DataLayer.DataLayer;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.swing.JRViewer;
import net.sf.jasperreports.view.JasperViewer;

import javax.swing.*;
import java.awt.*;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class ReportViewer extends JFrame {

    DataLayer layer = new DataLayer();
    public ReportViewer(String reportPath, Map<String, Object> parameters ) {
        try {

            // Load the Jasper file
           // JasperCompileManager.compileReportToFile("D:\\New folder\\Invoice.jrxml", "D:\\New folder\\Invoice.jasper");
            Connection conn = layer.getConntion();
           var report = JasperCompileManager.compileReport(reportPath);

            JasperPrint jp = JasperFillManager.fillReport(report,parameters,conn);
            JasperViewer.viewReport(jp,false);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
