#include <cmath>
#include <cstring>
#include <ctime>

#include <iostream>
#include <sstream>
#include <vector>

#include <GL/glut.h>
#include "Window.hpp"

namespace Window {
  //private:
  void (*draw_content)() = [](){std::cout << "No function passed to draw_content callback !\n";throw;};
  void reshape(int width, int height);
  void draw();

  void init(int width, int height, std::string titre, int argc, char** argv) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_DEPTH | GLUT_MULTISAMPLE);
    glutInitWindowSize(width, height);
    //Note : retrun int [index of created window]
    glutCreateWindow(titre.c_str());
    glEnable(GL_MULTISAMPLE);
  }

  void launch() {
    // Background color
    glClearColor(0.1, 0.1, 0.1, 1);
    // callback define reshape behavior
    glutReshapeFunc(reshape);
    // callback draw content to be displayed 
    glutDisplayFunc(draw);
    glutWarpPointer(WIDTH/2, HEIGHT/2);
    glutMainLoop();
  }

  void set_draw_content_func(void (*func)())
  {
    draw_content = func;
  }

  void draw() {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    //callback here
    draw_content();
    glutSwapBuffers();
    glutPostRedisplay();
  }

  void reshape(int width, int height) {
    glViewport(0, 0, width, height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
  }

}


