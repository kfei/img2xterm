# img2xterm

This project was originally a fork from [rossy/img2xterm][1].

[1]: https://github.com/rossy/img2xterm

## Dependencies

Before compilation, make sure you have the development packages of
[ImageMagick][2] and [Ncurses][3] (for *terminfo* support).

[2]: http://www.imagemagick.org
[3]: http://www.gnu.org/software/ncurses/ncurses.html

  - *Arch Linux*: `pacman -S imagemagick-doc ncurses`
  - *Debian*/*Ubuntu*: `apt-get install libmagickwand4 libncurses5-dev`

## Getting img2xterm

The GNU Autotools are not required. To compile and install from source, simply
run:

```bash
make
make install
```
## Usage

To display an image on a 256-color compatible terminal:

```bash
img2xterm image.jpg
```

Use [CIE94][4] for color difference algorithm:

```bash
img2xterm -p image.jpg
```

Display in grayscale:

```bash
img2xterm -b image.jpg
```

More usage:

```bash
img2xterm -h
```

[4]: http://en.wikipedia.org/wiki/Color_difference#CIE94
