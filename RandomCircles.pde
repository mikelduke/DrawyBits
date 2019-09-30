public class RandomCircles implements DrawMode {
    float minR = random(20, 200);
    float minG = random(20, 200);
    float minB = random(20, 200);

    void draw() {
        Circle c = new Circle(random(0,width), random(0,height), random(10, maxRadius));
        c.randomColor(minR, minG, minB);

        c.draw();
    }

    void reset() {
        background(0);
        this.minR = random(20, 200);
        this.minG = random(20, 200);
        this.minB = random(20, 200);
    }
}
