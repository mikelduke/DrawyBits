public class NonOverlappingCircles implements DrawMode {
    float maxRadius = 300;
    
    float minR = random(20, 200);
    float minG = random(20, 200);
    float minB = random(20, 200);

    int maxAttempts = 10000;

    ArrayList<Circle> circleList = new ArrayList<Circle>();

    void draw() {
        for (int i = 0; i < maxAttempts; i++) {
            if (drawCirclesNextToCircles()) {
                return;
            }
        }
        reset();
    }

    boolean drawCirclesNextToCircles() {
        Circle c = new Circle(random(0,width), random(0,height), random(10, maxRadius));
        
        if (!CircleUtil.isOverlapping(c, circleList)) {
            circleList.add(c);
            c.randomColor(minR, minG, minB);
            c.draw();

            return true;
        }

        return false;
    }


    void reset() {
        background(0);
        circleList.clear();

        this.minR = random(20, 200);
        this.minG = random(20, 200);
        this.minB = random(20, 200);
    }
}
