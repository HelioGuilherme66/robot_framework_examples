"""
An app to make simple drawings
"""

import toga
from toga.colors import BLACK
from toga.style import Pack


class MyDrawingApp(toga.App):
    def startup(self):
        """Construct and show the Toga application.

        Usually, you would add your application to a main content box.
        We then create a main window (with a name matching the app), and
        show the main window.
        """
        self.main_window = toga.MainWindow(title=self.formal_name)
        self.canvas = toga.Canvas(
            style=Pack(flex=1),
            # on_resize=self.on_resize,
            on_press=self.on_press,
            on_release=self.on_release,
        )
        self.xf = self.yf = self.xs = self.ys = 0

        # self.draw()
        box = toga.Box(children=[self.canvas])

        # Add the content on the main window
        self.main_window.content = box

        # self.draw()
        # self.draw_text()

        self.main_window.show()

    def on_press(self, widget, x, y, **kwargs):
        # print(f"Pressed at ({x}, {y})")
        self.xs = x
        self.ys = y
        # await self.main_window.dialog(toga.InfoDialog("Hey!", f"You poked the yak at ({x}, {y})"))
        # self.draw()

    def on_release(self, widget, x, y, **kwargs):
        # print(f"Released at ({x}, {y})")
        self.xf = x
        self.yf = y
        self.draw()

    def draw(self):
        with self.canvas.context.Stroke(x=self.xs, y=self.ys, color=BLACK, line_width=10.0) as stroke:
            stroke.line_to(x=self.xf, y=self.yf)


def main():
    return MyDrawingApp()
