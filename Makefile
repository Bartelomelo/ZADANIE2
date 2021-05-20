code2.o: objetosc_prostopadloscianu.c pole_prostokata.c pole.h objetosc.h 
	gcc -c code2.c

clean:
	rm *.o *.a *.so
	
pole_prostokata.o: pole_prostokata.c
	gcc -c pole_prostokata.c	
	
objetosc_prostopadloscianu.o: objetosc_prostopadloscianu.c
	gcc -fPIC -c objetosc_prostopadloscianu.c
				
pole.a: pole_prostokata.o
	ar rs pole.a pole_prostokata.o

objetosc.so: objetosc_prostopadloscianu.o
	gcc --shared -o objetosc.so objetosc_prostopadloscianu.o
	
code2: code2.o pole.a objetosc.so
	gcc -Wl,-R -Wl,${PWD} -o code2 code2.c objetosc.so -L. pole.a
