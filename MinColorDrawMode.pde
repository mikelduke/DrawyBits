// Basically holder for values used for minimums on random color generator
abstract class MinColorDrawMode implements DrawMode {
    float min = 20;
    float max = 200;

    float minR = random(min, max);
    float minG = random(min, max);
    float minB = random(min, max);

    void reset() {
        background(0);

        stroke(0);
        strokeWeight(1);

        this.minR = random(min, max);
        this.minG = random(min, max);
        this.minB = random(min, max);
    }
}
