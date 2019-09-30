public class RandomSquares implements DrawMode {
    float minR = random(20, 200);
    float minG = random(20, 200);
    float minB = random(20, 200);
    
    public void draw() {
        float w = random(10, width / 2);
        float h = random(10, height / 2);
        float x = random(0, width - w);
        float y = random(0, height - h);

        Rectangle rect = new Rectangle(x, y, w, h);
        rect.randomColor(minR, minG, minB);
        rect.draw();
    }

    void reset() {
        this.minR = random(20, 200);
        this.minG = random(20, 200);
        this.minB = random(20, 200);
    }
}