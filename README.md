# shcolor

DRY shell script coloring

## Description

The script exposes a function `C` (that's an uppercase C) that can be used
in bash and zsh shell scripts.

## Installation

Either install it locally and source it:

```bash
source /path/to/shcolor.sh
```

or source it directly from Github (dangerous but neat):

```bash
source <(https://raw.githubusercontent.com/kba/shcolor/master/shcolor.sh)
```

## Syntax

```
C <ForegroundColor> [<StyleFlags>] [<BackgroundColor>]
```

* `ForegroundColor` Number between 0 and 255 or '-' to not set the foreground
* `StyleFlags` Can be either `b` or `u` for bold and underline
* `BackgroundColor` Number between 0 and 255

If no arguments are given, everything is reset to defaults.

## Examples

```bash
echo -e "Roses are $(C 1)red$(C), violets are $(C 3)blue."  # 'red' is printed in red, 'violet' in blue
echo -e "Roses are `C 1`red$`C`, violets are `C 3`blue."    # same thing different syntax
```
