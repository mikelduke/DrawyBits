public class RandomCircles extends MinColorDrawMode implements DrawMode {
    float maxRadius = 300;

    void draw() {
        Circle c = new Circle(random(0,width), random(0,height), random(10, maxRadius));
        c.randomColor(minR, minG, minB);

        c.draw();
    }
}
