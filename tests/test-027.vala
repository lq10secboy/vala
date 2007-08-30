using GLib;

class Maman.Bar : Object {
	public int foo { get; set; }

	public void run () {
		/* test with local variable */
		int i = 1;
		stdout.printf (" %d", ++i);

		stdout.printf (" %d", i + 1);

		i = 4;
		stdout.printf (" %d", i++);
		
		stdout.printf (" %d", i);

		i = 7;
		stdout.printf (" %d", --(i));

		stdout.printf (" %d", i + 1);

		i = 8;
		stdout.printf (" %d", (i)--);

		stdout.printf (" %d", i + 2);

		/* test with field */
		foo = 9;
		stdout.printf (" %d", ++foo);

		stdout.printf (" %d", foo + 1);

		foo = 12;
		stdout.printf (" %d", foo++);
		
		stdout.printf (" %d", foo);

		foo = 15;
		stdout.printf (" %d", --(foo));

		stdout.printf (" %d", foo + 1);

		foo = 16;
		stdout.printf (" %d", (foo)--);

		stdout.printf (" %d", foo + 2);
	}

	static void test_postfix_and_prefix_expressions () {
		stdout.printf ("Postfix and Prefix Expression Test: 1");
		
		var bar = new Bar ();
		bar.run ();

		stdout.printf (" 18\n");
	}

	static void test_prefix_increment_in_loop () {
		stdout.printf ("Prefix Increment in Loop Test: ");

		int i = 0, j = 0;

		do {
			stdout.printf (" %d", i);
			j = j + 1;
		} while (++i < 10 && j < 15);

		stdout.printf (" %d\n", i);
	}

	static int main (string[] args) {
		test_postfix_and_prefix_expressions ();
		test_prefix_increment_in_loop ();

		return 0;
	}
}
