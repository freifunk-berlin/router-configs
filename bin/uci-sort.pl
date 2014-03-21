#!/usr/bin/perl

0 <= $#ARGV || die("Usage: $0 uci-config-file");

foreach my $file(@ARGV) {
	open(INF, $file) || die("Cannot read $file");
	my @all = <INF>;
	close(INF);

	my $i = 0;
	while($i <= $#all) {
		if ($all[$i++] =~ m#^config\b#s) {
			my $j = $i;
			my @k = ();
			while($j <= $#all && ($all[$j] =~ m#^\s*\n#s || $all[$j] =~ m#^\s+option\b#s)) {
				push(@k, $all[$j]) if (!($all[$j] =~ m#^\s*\n#s));
				$j++;
			}
			if ($j > $#all || $all[$j] =~ m#^config\b#s) {
				# Otherwise we have comments or dirt: dont sort
				splice(@all, $i, $j - $i, (sort @k), "\n");
				$j = $i + $#k + 1;
			}
			$i = $j;
		}
	}

	open(OUT, ">$file") || die("Cannot write $file");
	print OUT @all;
	close(OUT);
}
