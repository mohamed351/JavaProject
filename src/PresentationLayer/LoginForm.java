package PresentationLayer;

import BusineesLayer.Employee;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.util.Objects;

public class LoginForm  extends JFrame {
    JTextField userNameField;
    JPasswordField  passwordField;
    public LoginForm(){
        IntializationForm();


    }

    private void IntializationForm() {
        setLayout(new BorderLayout());
        setSize(600,400);
        setLocationRelativeTo(null);
        setResizable(false);
        getContentPane().setBackground(ThemeColor.primaryColor);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        ImageIcon imageIcon = new ImageIcon(LoginForm.class.getResource("../images/logo2.png")); // Adjust the path as needed

        Image resizedImage = imageIcon.getImage().getScaledInstance(200, 200, Image.SCALE_SMOOTH);
        ImageIcon resizedIcon = new ImageIcon(resizedImage);
        // Create JLabel with the image
        JLabel label = new JLabel(resizedIcon);
        label.setBounds(50, 50, imageIcon.getIconWidth(), imageIcon.getIconHeight());
        JPanel panel = new JPanel();
        panel.setBackground(ThemeColor.primaryColor);
        panel.setLayout(new CardLayout());
        panel.setBorder(new EmptyBorder(20,20,20,20));
        panel.add(label);
        add(panel,BorderLayout.WEST);
        add(AddingLoginForm(),BorderLayout.CENTER);

    }

    private  JPanel  AddingLoginForm(){
        JPanel panel = new JPanel(new GridLayout(8,1,2,2));
        panel.setBorder(new EmptyBorder(20,20,20,20));
        panel.setBackground(ThemeColor.primaryColor);

       var label = new JLabel("UserName :");
       label.setForeground(ThemeColor.fontColor);

        panel.add(label);
        userNameField= new JTextField();
        panel.add(userNameField);
        label = new JLabel("Password :");
        label.setForeground(ThemeColor.fontColor);
        panel.add(label);

        passwordField= new JPasswordField();

        panel.add(passwordField);

        JPanel buttonsPanel = new JPanel();
        buttonsPanel.setBackground(ThemeColor.primaryColor);
        var loginButton = new JButton("Login");
        loginButton.addActionListener(e -> {

            var emp = Employee.LoginEmployee(userNameField.getText(),passwordField.getText());
            if(emp == null){
                JOptionPane.showMessageDialog(null,"User Name and Password is Wrong");
            }
            else{
                this.setVisible(false);
                MainForm form = new MainForm();
                form.setVisible(true);

            }

        });
        buttonsPanel.add(loginButton);
       var cancelButton =  new JButton("Cancel");
        cancelButton.addActionListener(a->{
            System.exit(0);
        });
        buttonsPanel.add(cancelButton);;
        panel.add(buttonsPanel);

        return panel;
    }

}
