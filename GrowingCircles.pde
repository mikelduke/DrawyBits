public class GrowingCircles implements DrawMode {
    float minR = random(20, 200);
    float minG = random(20, 200);
    float minB = random(20, 200);

    ArrayList<Circle> circleList = new ArrayList<Circle>();
    Circle lastCircle;
    boolean isGrowing = false;

    float rMax = 300;

    void draw() {
        if (!isGrowing) {
            float x = random(0,width);
            float y = random(0,height);
            float r = 50;

            Circle c = new Circle(x ,y, r);
            if (CircleUtil.isOverlapping(c, circleList)) {
                return;
            }

            c.randomColor(minR, minG, minB);
            c.rad = 10;
            c.draw();
            lastCircle = c;
            isGrowing = true;
        } else if (isGrowing) {
            if (!CircleUtil.isOverlapping(lastCircle, circleList) && lastCircle.rad < rMax) {
                lastCircle.rad += 10;
                lastCircle.draw();
            } else {
                circleList.add(lastCircle);
                isGrowing = false;
            }
        }
    }


    void reset() {
        background(0);
        circleList.clear();

        this.minR = random(20, 200);
        this.minG = random(20, 200);
        this.minB = random(20, 200);
    }
}
