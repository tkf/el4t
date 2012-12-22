#!/bin/bash

EL4T_DIR=$(dirname $0)
EL4T_EMACS="${EL4T_EMACS:-emacs}"
exec $EL4T_EMACS -l $EL4T_DIR/lib/el4t.el "$@"
