#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void explode_bomb(int phase) {
  printf("<<< Phase %i Failed. Shutdown.\n",phase);
  exit(0);
}

void display_flag(char* fname) {
   FILE *fp;
   char buff[255];
   fp = fopen(fname, "r");
   fscanf(fp, "%s", buff);
   printf("<<< Congratulations: %s\n", buff );
}

void complete_phase(int phase) {
  char flag[10];
  printf("<<< Phase %i Complete\n",phase);
  display_flag("flag.txt");
}

void phase1() {
  char input[20];
  printf("Defuse Phase >>> ");
  scanf("%21s", input);
  if (strcmp(input, "GoPanthers!")!=0) {
    explode_bomb(1);
  }
  else {
    complete_phase(1);
  }
}


int main(int argc, char *argv[]) {
  phase1();
}
