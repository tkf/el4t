;; Library load helper

(defvar el4t-lib (file-name-directory load-file-name))

(unless (locate-library "package")
  (add-to-list 'load-path (expand-file-name "package" el4t-lib)))

(unless (locate-library "ert")
  (add-to-list 'load-path (expand-file-name "ert/lisp/emacs-lisp" el4t-lib)))

(unless (fboundp 'ert-run-tests-batch-and-exit)
  (autoload 'ert-run-tests-batch-and-exit "ert-batch"))

(unless (fboundp 'ert-run-tests-interactively)
  (autoload 'ert-run-tests-interactively "ert-ui"))
