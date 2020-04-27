#include <GL/glut.h>

#include "Window.hpp"

void draw_triangle();

int main(int argc, char** argv)
{
    Window::init(WIDTH, HEIGHT, "Title", argc, argv);
    Window::set_draw_content_func(draw_triangle);
	Window::launch();
	return 0;
}

void draw_triangle()
{
    glBegin(GL_TRIANGLES);
		glVertex3f(-0.5,-0.5,0.0);
		glVertex3f(0.5,0.0,0.0);
		glVertex3f(0.0,0.5,0.0);
	glEnd();
}
