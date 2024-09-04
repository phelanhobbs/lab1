hello.txt:
	echo "hello world!" > hello.txt

CPP=/usr/bin/cpp

main.i: main.c
	$(CPP) main.c > main.i	

clean: 
	rm -f main.i hello.txt
