package PresentationLayer.Helpers;

import com.toedter.calendar.JCalendar;

import javax.swing.*;
import java.awt.*;

public class CalenderForm extends JFrame {
    public String date;
    public CalenderForm(){
        setLayout(new BorderLayout());
        JCalendar calendar = new JCalendar();
        add(calendar,BorderLayout.CENTER);
        JButton button = new JButton("Save");
        add(button,BorderLayout.SOUTH);
    }
}
