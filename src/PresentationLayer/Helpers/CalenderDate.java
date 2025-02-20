package PresentationLayer.Helpers;

import javax.swing.*;
import java.awt.*;

public class CalenderDate extends JPanel {

   public CalenderDate(){
         setLayout(new FlowLayout());
         JTextField field = new JTextField();
        add(field);
        JButton button = new JButton("+");
        button.addActionListener(e->{
            CalenderForm frm = new CalenderForm();
            frm.setLocationRelativeTo(null);
            frm.setSize(500,500);
            frm.setVisible(true);
        });
        add(button);
    }
}
