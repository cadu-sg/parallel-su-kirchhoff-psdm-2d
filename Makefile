# Makefile for ...su/main

include $(CWPROOT)/src/Makefile.config

MPICC = mpicc

D = $L/libcwp.a $L/libpar.a $L/libsu.a

B = .

OPTC = -g

OMPFLAGS = -fopenmp

LFLAGS= $(PRELFLAGS) -L$L -lsu -lpar -lcwp -lm $(POSTLFLAGS) $(OMPFLAGS)


PROGS =			\
	$B/sukdmig2d_parallel	\
	$B/sumigtopo2d_parallel


INSTALL	:	$(PROGS)
	@-rm -f INSTALL
	@touch $@


$(PROGS):	$(CTARGET) $D 
	-$(MPICC) $(CFLAGS) $(OMPFLAGS) $(@F).c $(LFLAGS) -o $@
	@$(MCHMODLINE)
	@echo $(@F) installed in $B

remake	:
	-rm -f $(PROGS) INSTALL
	$(MAKE) 
	
clean::
	rm -f a.out junk* JUNK* core
