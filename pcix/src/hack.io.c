/*
 * Hack.io.c
 */

#include "hack.h"
#include <termio.h>

short   ospeed;			/* Used by tputs */

getlin (str)
register char  *str;
{
	register char  *ostr = str;

	flags.topl = 0;
	flush ();
	for (;;) {
		*str = getchar ();
		if (*str == '\b') {
			if (str != ostr) {
				str--;
				write (1, "\b \b", 3);
			}
			else
				write (1, "\7", 1);
		}
		else if (*str == '\n') {
			*str = 0;
			return;
		}
		else if (*str >= ' ') {
			write (1, str, 1);
			str++;
		}
	}
}

getret () {
	printf ("\nHit space to continue: ");
	flush ();
	while (getchar () != ' ');
}

struct termio ttyo;
h_io_init() {
	ioctl(1, TCGETA, &ttyo);
}


/*
 * Put together cbreak-mode and echo --- Michiel
 */

	int speed_table[] = { 0, 50, 75, 110, 134, 150, 200, 300, 600,
			     1200, 1800, 2400, 4800, 9600, 0, 0 };

hackmode (x)
register        x;
{
	struct termio   ttyp;

	ioctl (1, TCGETA, &ttyp);/* Use of basic functions */
	ospeed = ttyp.c_cflag & 017; /* mask out other bits */
	ospeed = speed_table[ospeed];
	if (x) {
		ttyp.c_lflag &= ~ (ECHO | ICANON);
		ttyp.c_cc[4]=0;
		ttyp.c_cc[5]=0; /* set min and time to 0 */
	}
	else {
		ttyp.c_lflag = ttyo.c_lflag;  /* reset back to original */
		ttyp.c_cc[4]=ttyo.c_cc[4];      /* set EOF */
		ttyp.c_cc[5]=ttyo.c_cc[5];      /* set EOL */
	}
	if (ioctl (1, TCSETA, &ttyp) < 0) {
		printf ("ERROR: Cannot change tty");
		exit (1);
	}
}

more () {
	printf (" --More--");
	flush ();
	while (getchar () != ' ');
	flags.topl = 0;
}

#ifndef NORMAL_IO
getchar () {
	char    c;

	read (0, &c, 1);
	return (c);
}
#endif NORMAL_IO
