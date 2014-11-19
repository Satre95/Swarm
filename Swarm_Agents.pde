class Agent {
  PVector p, pOld;
  float stepSize, angle;
  boolean outOfbounds = false;

  Agent() {
    p = new PVector(random(width), random(height));
    pOld = new PVector(p.x, p.y);
    stepSize = random(1, 5);
  }

  void update1() {
    angle = noise(p.x/noiseScale, p.y/noiseScale) * noiseStrength;

    p.x += cos(angle) * stepSize;
    p.y += sin(angle) * stepSize;

    if (p.x > res || p.x < 0 || p.y > res || p.y < 0)
      outOfbounds = true;

    if (outOfbounds) {
      p.x = random(width);
      p.y = random(height);
      pOld.set(p);
    }

    if (pointMode == 3) {
      noStroke();
      fill(shade, opacity);
      ellipse(p.x, p.y, rad, rad);
    } 
    else if (pointMode == 4) {
      stroke(shade, opacity);
      strokeWeight(strokeWidth*stepSize);
      line(pOld.x, pOld.y, p.x, p.y);
    }

    pOld.set(p);
    outOfbounds = false;
  }

  void update2() {
    angle = noise(p.x/noiseScale, p.y/noiseScale) * 32;
    angle = (angle - int(angle)) * noiseStrength;

    p.x += cos(angle) * stepSize;
    p.y += sin(angle) * stepSize;

    if (p.x > res || p.x < 0 || p.y > res || p.y < 0)
      outOfbounds = true;

    if (outOfbounds) {
      p.x = random(width);
      p.y = random(height);
      pOld.set(p);
    }
    if (pointMode == 3) {
      noStroke();
      fill(shade, opacity);
      ellipse(p.x, p.y, rad, rad);
    } 
    else if (pointMode == 4) {
      stroke(shade, opacity);
      strokeWeight(strokeWidth*stepSize);
      line(pOld.x, pOld.y, p.x, p.y);
    }

    pOld.set(p);

    outOfbounds = false;
  }
}
