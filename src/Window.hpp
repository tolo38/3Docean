#ifndef WINDOW_HPP
#define WINDOW_HPP

#define WIDTH  640
#define HEIGHT 480

#include <string>

namespace Window {

  /** Initialyse windows
   * @param[in] width     window width
   * @param[in] height    window height
   * @param[in] title     window title
   * @param[in] argc      number of arg in
   * @param[in] argv      tab    of arg in
   */
  void init(int, int, std::string, int, char**);

  /** Execute display :
   *   - set init variables
   *   - listen events (not implemented : keyboard and mouse)
   *   - start display
   */
  void launch();

  /** set the function callback to draw window content
  */
  void set_draw_content_func(void (*func)());
}

#endif
