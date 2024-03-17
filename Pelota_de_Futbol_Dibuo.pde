void setup() {
  size(400, 400);
  background(0, 255, 0); // Fondo verde
  drawFutbol(width/2, height/2, 200); // Dibujar la pelota de fútbol en el centro
}

void draw() {
  // No se necesita nada aquí para este ejemplo
}

void drawFutbol(float x, float y, float diameter) {
  // Dibujar la forma circular blanca
  fill(255);
  ellipse(x, y, diameter, diameter);
  
  // Dibujar el pentágono central
  drawPentagono(x, y, diameter * 0.15);
  
  // Dibujar las líneas negras pentagonales alrededor del círculo
  drawPentagonos(x, y, diameter);
}

void drawPentagonos(float x, float y, float diameter) {
  float radius = diameter / 2;
  float side = radius * 0.25; // Ajustar el tamaño de los pentágonos
  
  float angleOffset = TWO_PI / 10;
  
  for (int i = 0; i < 5; i++) {
    float angle = angleOffset + i * TWO_PI / 5;
    float xOffset = cos(angle) * (radius - side * 1.2);
    float yOffset = sin(angle) * (radius - side * 1.2);
    
    drawPentagono(x + xOffset, y + yOffset, side);
  }
}

void drawPentagono(float x, float y, float side) {
  float angle = TWO_PI / 5;
  fill(0); // Ajustar el color de relleno a negro
  beginShape();
  for (int i = 0; i < 5; i++) {
    float xVertex = x + cos(angle * i) * side;
    float yVertex = y + sin(angle * i) * side;
    vertex(xVertex, yVertex);
  }
  endShape(CLOSE);
}
