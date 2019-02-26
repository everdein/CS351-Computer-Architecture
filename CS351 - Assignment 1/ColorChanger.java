// Matthew Clark
// CS351 - Computer Architecture
// Assignment 1 - Maniplate Hue

import java.awt.*;
import java.io.*;
import javax.imageio.*; 
import java.awt.image.*; 

public class ColorChanger{
    public static void main(String args[])throws IOException 
    {
        BufferedImage raw,processed;
        raw = ImageIO.read(new File("flower.png"));        
        int width = raw.getWidth();
        int height = raw.getHeight();
        processed = new BufferedImage(width, height, raw.getType()); 
        for(int y=0; y < height; y++)
        {
            for(int x=0; x < width; x++)
            {
                //this is how we grab the RGB value of a pixel at x,y coordinates in the image 
                int rgb = raw.getRGB(x,y);
                
                //extract the red value
                int red = (rgb >> 16) & 0x000000FF;
                
                //extract the green value
                int green = (rgb >>8 ) & 0x000000FF;
                
                //extract the blue value
                int blue = (rgb) & 0x000000FF;
                
                //user Color.RGBtoHSB() method to convert RGB values to HSB
                float[] hsb = Color.RGBtoHSB(red, green, blue, null);
                float hue = 90/360.0f; //hard coded hue value
                // float hue = 180/360.0f;
                // float hue = 270/360.0f;
                float saturation = hsb[1];
                float brightness = hsb[2];

                //then use Color.HSBtoRGB() method to convert the HSB value to a new RGB 
                //value
                int newRGB = Color.HSBtoRGB(hue, saturation, brightness);
                
                // set the new RGB value to a pixel at x,y coordinates in the image
                processed.setRGB(x, y, newRGB);
            } 
        }
        ImageIO.write(processed, "PNG", new File("processed.png")); 
    }
}