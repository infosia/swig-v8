TOP        = ../..
SWIG       = $(TOP)/../preinst-swig
CXXSRCS    = 
TARGET     = example
INTERFACE  = example.i
LIBS       = -lm

all:: Example.class
	$(MAKE) -f $(TOP)/Makefile CXXSRCS='$(CXXSRCS)' SWIG='$(SWIG)' \
	TARGET='$(TARGET)' INTERFACE='$(INTERFACE)' CXX="gcj"  \
	TCL_CXXSHARED="gcj -fpic -shared Example.class " LIBS="-lstdc++" DEFS='' tcl_cpp


clean::
	$(MAKE) -f $(TOP)/Makefile tcl_clean
	rm -f *.class Example.h

check: all

run:
	tclsh runme.tcl

Example.class: Example.java
	gcj -fPIC -C -c -g Example.java
	gcjh  Example

