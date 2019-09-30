public class ParametricsLines extends MinColorDrawMode implements DrawMode {
    
    float t = 0;

    void draw() {
        float red   = random(minR, 255);
        float green = random(minG, 255);
        float blue  = random(minB, 255);

        stroke(red, green, blue);
        strokeWeight(10);
        
        translate(width/2, height/2);
        
        point (x(t), y(t));
        t+=.1;

        if (t > 100) {
            t = 0;
            reset();
        }
    }

    float x(float t) {
        return sin(t*.1)*300;
    }

    float y(float t) {
        return cos(t * .5)*200;
    }
}
