CARTON ?= carton
EMACS ?= emacs

EL4T_CARTON = EL4T_EMACS=${EMACS} EMACS=./emacs.sh ${CARTON}
TEST_1 = make EMACS=${EMACS} CARTON=${CARTON} test-1

.PHONY : test test-1 compile clean-elpa clean-elc print-deps travis-ci

test: elpa
	make test-1

test-1:
	${EL4T_CARTON} exec ./emacs.sh -Q -batch \
		-l tests/test-el4t.el \
		-f ert-run-tests-batch-and-exit

elpa:
	${EL4T_CARTON} install

clean-elpa:
	rm -rf elpa

clean-elc:
	rm -f *.elc */*.elc

print-deps:
	@echo "----------------------- Dependencies -----------------------"
	$(EMACS) --version
	@echo "------------------------------------------------------------"

travis-ci: print-deps test
