use ExtUtils::MakeMaker;
WriteMakefile(
	      NAME => 'TRS80',
	      VERSION_FROM => 'TRS80.pm',
#	      'linkext' => {LINKTYPE => ''},
	      'dist' => {COMPRESS => 'gzip', SUFFIX => 'gz'},
);
