
static class CircleUtil {
    static boolean isOverlapping(Circle circleTest, ArrayList<Circle> circleList) {
        for (int i = 0; i < circleList.size(); i++) {
            Circle circle = circleList.get(i);
            // https://stackoverflow.com/questions/8367512/how-do-i-detect-intersections-between-a-circle-and-any-other-circle-in-the-same
            float aabb = pow(circleTest.x - circle.x, 2) + pow(circleTest.y - circle.y, 2);
            float cc = pow(circleTest.rad + circle.rad, 2);

            if (aabb <= cc) {
                return true;
            }
        }
        return false;
    }
}
