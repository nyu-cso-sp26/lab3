OBJS := ex1.o ex2.o ex3.o ex4.o ex5.o
SOLOBJS := objs/ex1_sol.o objs/ex2_sol.o objs/ex3_sol.o objs/ex4_sol.o objs/ex5_sol.o 
TESTEROBJ := objs/tester.o
OVERFLOWOBJ := objs/overflow.o
CFLAGS := -Werror -c -Og -g -std=gnu11 -fomit-frame-pointer -fno-stack-protector
SOLCFLAGS := -Werror -c -Og -std=gnu11 -fomit-frame-pointer -fno-stack-protector

GCC = gcc

all : tester tester_sol overflow

submitfiles: 
	zip submitfiles.zip *.c *.h bad_arg Makefile

%.o : %.c
	$(GCC) $(CFLAGS) $*.c

tester : $(OBJS) $(TESTEROBJ)
	$(GCC) -no-pie $^ -o $@

tester_sol : $(SOLOBJS) $(TESTEROBJ)
	$(GCC) -no-pie $^ -o $@

overflow : $(OVERFLOWOBJ)
	$(GCC) -no-pie $^ -o $@

clean :
	rm -f $(OBJS) tester 
