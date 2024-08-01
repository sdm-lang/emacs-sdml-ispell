;;; sdml-ispell.el --- Spell check text content -*- lexical-binding: t; -*-

;; Copyright (c) 2023, 2024 Simon Johnston

;; Author: Simon Johnston <johnstonskj@gmail.com>
;; Version: 0.1.6
;; Package-Requires: ((emacs "28.2") (tree-sitter-ispell "0.1.0") (sdml-mode "0.1.6"))
;; URL: https://github.com/johnstonskj/emacs-sdml-mode
;; Keywords: languages tools

;;; License:

;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;;; Commentary:

;; This package enables spell checking, with ispell, for elements of the buffer
;; that represent content.  Currently this selects only string values and comments
;; for checking.
;;

;; Install
;;
;; `(use-package sdml-ispell
;;    :ensure t
;;    :after sdml-mode)'
;;

;; Usage
;;
;; `\\[tree-sitter-ispell-run-at-point]' -- spell check the element at point.
;; `\\[tree-sitter-ispell-run-buffer]' -- spell check all elements in the buffer.
;;

;;; Code:

(require 'sdml-mode)
(require 'tree-sitter-ispell)

;; --------------------------------------------------------------------------
;; Customization
;; --------------------------------------------------------------------------

(defconst sdml-ispell-grammar-text-mapping
  '(quoted_string line_comment)
  "Tree-sitter node types to be spell checked with ispell.")

;; --------------------------------------------------------------------------
;; Key Bindings
;; --------------------------------------------------------------------------

(defvar sdml-ispell-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-s s") 'tree-sitter-ispell-run-at-point)
    (define-key map (kbd "C-c C-s C-s") 'tree-sitter-ispell-run-buffer)
    map)
  "Keymap for SDML ispell major mode.")

;; --------------------------------------------------------------------------
;; Spelling Minor Mode
;; --------------------------------------------------------------------------

;;;###autoload
(define-minor-mode
  sdml-ispell-mode
  "Minor mode to allow `ispell' checking in SDML text content.

Currently only the tree-sitter nodes `quoted_string' and `line_comment'.

Key bindings:
\\{sdml-ispell-mode-map}"
  :group 'sdml
  :tag "Enable SDML ispell minor mode"
  :lighter nil
  (add-to-list 'tree-sitter-ispell-grammar-text-mapping
               `(sdml-mode . ,sdml-ispell-grammar-text-mapping)))

;;;###autoload
(add-hook 'sdml-mode-hook #'sdml-ispell-mode)

(provide 'sdml-ispell)

;;; sdml-ispell.el ends here
