# SDML mode spell-checking for Emacs

![SDML Logo Text](https://raw.githubusercontent.com/sdm-lang/.github/main/profile/horizontal-text.svg)

This package provides an Emacs tree-sitter based major mode for SDML - the
[Simple Domain Modeling Language](https://github.com/johnstonskj/tree-sitter-sdml). This mode provides spell-checking features for
the `sdml-mode` package.

## Installing

Currently the package is not published and so installation has to be done
manually. You will also need to install the base `sdml-mode` first.

### Install manually

First clone the Git repository to a local path.

```bash
    git clone https://github.com/johnstonskj/emacs-sdml-ispell.git
```

The following uses `use-package` but any equivalent package manager should work.

```elisp
(use-package sdml-ispell
  :after (ispell sdml-mode)
  :load-path "/path/to/repo")
```

## Usage

This minor provides *selective* spell using [ispell](https://www.gnu.org/software/emacs/manual/html_node/emacs/Spelling.html) checking. Following the
behavior of `flyspell-prog-mode`, this mode only checks the nodes corresponding to
comments and strings. This behavior can be overridden with the custom variable
`tree-sitter-ispell-sdml-text-mapping` which is a list of tree-sitter node names
to check.

checking
only specific nodes in the tree.

```elisp
(use-package sdml-ispell
  :after sdml-mode
  :custom
  (tree-sitter-ispell-sdml-text-mapping '(quoted_string comment identifier))
  :load-path "/path/to/repo"
  :config (sdml-ispell-setup))
```

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
