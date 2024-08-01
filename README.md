# SDML mode spell-checking for Emacs

![SDML Logo Text](https://raw.githubusercontent.com/sdm-lang/.github/main/profile/horizontal-text.svg)

This package provides an Emacs tree-sitter based major mode for SDML - the
[Simple Domain Modeling Language](https://github.com/johnstonskj/tree-sitter-sdml). This minor provides *selective* spell using
[ispell](https://www.gnu.org/software/emacs/manual/html_node/emacs/Spelling.html) checking.

Following the behavior of `flyspell-prog-mode`, this mode only checks the nodes
corresponding to comments and strings.

## Installing

Install is easiest from MELPA, here's how with `use-package`.

```elisp
(use-package sdml-ispell
  :after (ispell sdml-mode))
```

Or, interactively; `M-x package-install RET sdml-ispell RET`

### Install manually

First clone the Git repository to a local path.

```bash
git clone https://github.com/johnstonskj/emacs-sdml-ispell.git
```

Usage

The following should now work.

```elisp
(use-package sdml-ispell
  :after (ispell sdml-mode)
  :load-path "/path/to/repo"))
```

## Bindings

- `C-c C-s s` -- spell check the item at point
- `C-c C-s C-s` -- spell check all items in the buffer

## Contributing

The packages in this repository should pass the standard package checks,
including:

- `byte-compile-file`
- `package-lint`
- `checkdoc`

## License

This package is released under the Apache License, Version 2.0. See the LICENSE
file in this repository for details.

## Changes

The `0.1.x` series are all pre-release and do not appear in ELPA/MELPA.
