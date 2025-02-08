package PresentationLayer;

import PresentationLayer.Helpers.ElementsFormData;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainForm extends JFrame {

    public MainForm(){
        setExtendedState(JFrame.MAXIMIZED_BOTH);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setTitle("Full Width JFrame with Menu and Image");
        getContentPane().setBackground(ThemeColor.primaryColor);
        // Create Menu Bar
        JMenuBar menuBar = new JMenuBar();
        JMenu fileMenu = new JMenu("Master Data");
        JMenuItem employeesMenu = new JMenuItem("Employees");
        JMenuItem customersMenu = new JMenuItem("Customers");
        JMenuItem productMenu = new JMenuItem("Products");
        employeesMenu.addActionListener(this::showEmployeeForm);

        // Exit Action


     fileMenu.add(employeesMenu);
     menuBar.add(fileMenu);
        setJMenuBar(menuBar);


        ImageIcon imageIcon = new ImageIcon(MainForm.class.getResource("/images/logo2.png")); // Replace with your image path
        JLabel imageLabel = new JLabel(imageIcon);
        imageLabel.setHorizontalAlignment(SwingConstants.CENTER);
        imageLabel.setVerticalAlignment(SwingConstants.CENTER);


        JPanel imagePanel = new JPanel(new GridBagLayout());
        imagePanel.setBackground(ThemeColor.primaryColor);
        imagePanel.add(imageLabel);

        // Add to Frame
        add(imagePanel, BorderLayout.CENTER);

        setVisible(true);;
    }
    private  void showEmployeeForm(ActionEvent  e){
        var ab = new ElementsFormData();
        ab.title ="Employees";
        ab.actionListenerAddButton = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(null,"Hello");
            }
        };

        ElementForm form = new ElementForm(ab);
        form.setVisible(true);
    }
}
