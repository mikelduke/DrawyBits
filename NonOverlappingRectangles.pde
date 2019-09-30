public class NonOverlappingRectangles extends MinColorDrawMode implements DrawMode {
    ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();

    int maxAttempts = 100000;

    public void draw() {
        for (int i = 0; i < maxAttempts; i++) {
            if (drawNewRect()) {
                return;
            }
        }
        reset();
    }

    private boolean drawNewRect() {
        float w = random(10, width / 2);
        float h = random(10, height / 2);
        float x = random(0, width - w);
        float y = random(0, height - h);

        Rectangle rect = new Rectangle(x, y, w, h);
        if (!isOverlapping(rect)) {
            rectangles.add(rect);
            rect.randomColor(minR, minG, minB);
            rect.draw();
            return true;
        }
        return false;
    }

    public void reset() {
        super.reset();
        rectangles.clear();
    }

    private boolean isOverlapping(Rectangle rTest) {
        for (int i = 0; i < rectangles.size(); i++) {
            Rectangle rect = rectangles.get(i);

            if(rTest.x < rect.x + rect.w &&
                rTest.x + rTest.w > rect.x &&
                rTest.y < rect.y + rect.h &&
                rTest.y + rTest.h > rect.y)
            {
                return true;
            }
        }
        return false;
    }
}