
=head1 NAME

TRS80 - Deliver TRS-80 Model I style diagnostic messages

=head1 SYNOPSIS

        use TRS80;

=head1 DESCRIPTION

At present, there is no port of Pel to the TRS-80 Model I computer.
Until there is, this module is provided to simulate the TRS-80
environment.

=head1 AUTHOR

Mark-Jason Dominus C<mjd-perl-trs80+@plover.com>

=cut


my @pats;

$TRS80::VERSION = '1.00';

sub trs80 {
  my ($pat, $out, $pp);
  my ($msg) = @_;
#  print STDERR ">> message `$msg'\n";
  for $pp (@pats) {
    ($pat, $out) = @$pp;
    if ($msg =~ /^$pat/) {
#      print STDERR ">> matched pattern $pat \n";
#      print STDERR ">> delivering $out \n";
      print $out, "\n";
      return 1;
    }
  }
  print $msg, "\n";
  return;
}

my $MSG; 
while (<DATA>) {
  chomp;
  if (/^==(.*)/) {
    $MSG = $1;
#    print ">> MESSAGE TYPE $MSG\n";
    next;
  } elsif (/\S/) {
    push @pats, [$_, $MSG];
  }
}
# print STDERR "Read ", scalar(@pats), " patterns.\n";

my $pid = open STDERR, "|-";
# print STDERR "pid $pid\n";
die "SORRY\n" unless defined $pid;
if ($pid == 0) {
  while (<STDIN>) {
    chomp;
    last if trs80($_);
  }
  1 while <STDIN>;
  exit 0;
}

END { 
  close STDERR;
  waitpid($pid,0) if $pid;
}

1;

__DATA__
==WHAT?
"my sub" not yet implemented
"my" variable .* can't be in a package
"no" not allowed in expression
"use" not allowed in expression
'!' allowed only after types .*
.* argument is not a HASH or ARRAY element
.* argument is not a HASH or ARRAY element or slice
.* argument is not a subroutine name
.* found where operator expected
\(Missing semicolon on previous line\?\)
\?\+\* follows nothing in regexp
\@ outside of string
<> should be quotes
Argument ".*" isn't numeric.*
Array \@.* missing the \@ in argument \d+ of .*\(\)
Assignment to both a list and a scalar
Bad evalled substitution pattern
Bad name after .*::
Bareword ".*" not allowed while "strict subs" in use
Bareword found in conditional
BEGIN failed--compilation aborted
BEGIN not safe after errors--compilation aborted
Can't declare class for non-scalar .* in ".*"
Can't declare .* in ".*"
Can't do \{n,m\} with n > m
Can't emulate -.* on #! line
Can't exec .*
Can't execute .*
Can't find .* on PATH, '\.' not in PATH
Can't find .* on PATH
Can't find string terminator .* anywhere before EOF
Can't localize through a reference
Can't localize lexical variable .*
Can't localize pseudo-hash element
Can't modify .* in .*
Can't modify non-lvalue subroutine call
Can't open bidirectional pipe
Can't rename .* to .*: .*, skipping file
Can't return outside a subroutine
Can't use %! because Errno\.pm is not available
Can't use "my .*" in sort comparison
Can't use .* for loop variable
Can't use bareword \(".*"\) as .* ref while "strict refs" in use
Can't use global .* in "my"
Can't use subscript on .*
Character class \[:.*:\] unknown
Character class syntax \[.*\] belongs inside character classes
Character class syntax \[\. \.\] is reserved for future extensions
Character class syntax \[= =\] is reserved for future extensions
Compilation failed in require
CORE::.* is not a keyword
Delimiter for here document is too long
elseif should be elsif
.* failed--call queue aborted
.*: Eval-group in insecure regular expression
.*: Eval-group not allowed, use re 'eval'
.*: Eval-group not allowed at run time
Excessively long <> operator
Execution of .* aborted due to compilation errors
fcntl is not implemented
Final $ should be \\$ or $name
Final \@ should be \\\@ or \@name
Format not terminated
gethostent not implemented
Glob not terminated
Global symbol ".*" requires explicit package name
goto must have label
Identifier too long
Illegal character .* \(carriage return\)
Illegal binary digit .*
Illegal octal digit .*
Illegal binary digit .* ignored
Illegal octal digit .* ignored
Illegal hexadecimal digit .* ignored
Illegal switch in PERL5OPT: .*
In string, \@.* now must be written as \\\@.*
Invalid .* attribute: .*
Invalid .* attributes: .*
invalid \[\] range ".*" in regexp
Invalid separator character .* in attribute list
ioctl is not implemented
junk on end of regexp
Lvalue subs returning .* not implemented yet
Misplaced _ in number
Missing $ on loop variable
Missing .*brace.* on \\N\{\}
Missing comma after first argument to .* function
Missing command in piped open
Missing right curly or square bracket
Module name must be constant
msg.* not implemented
Missing name in "my sub"
nested \*\?\+ in regexp
No #! line
No .* specified for -.
No comma allowed after .*
No package name allowed for variable .* in "our"
No space allowed after -.
Not enough arguments for .*
Null picture in formline
Number too long
Octal number in vector unsupported
Operator or semicolon missing before .*
Precedence problem: open .* should be open\(.*\)
Prototype mismatch: .* vs .*
Recompile perl with B<-D>DEBUGGING to use B<-D> switch
regexp \*\+ operand could be empty
Search pattern not terminated
select not implemented
sem.* not implemented
Sequence \(\? incomplete
Sequence \(\?#\.\.\. not terminated
Sequence \(\?.*\.\.\.\) not implemented
Sequence \(\?.*\.\.\.\) not recognized
setegid\(\) not implemented
seteuid\(\) not implemented
setpgrp can't take arguments
setrgid\(\) not implemented
setruid\(\) not implemented
shm.* not implemented
sort is now a reserved word
Strange \*\+\?\{\} on zero-length expression
Substitution pattern not terminated
Substitution replacement not terminated
syntax error
syntax error at line \d+: `.*' unexpected
System V .* is not implemented on this machine
That use of $\[ is unsupported
The .* function is unimplemented
The crypt\(\) function is unimplemented due to excessive paranoia
times not implemented
Too few args to syscall
Too many \('s
Too many \)'s
Too many args to syscall
Too many arguments for .*
trailing \\ in regexp
Transliteration pattern not terminated
Transliteration replacement not terminated
truncate not implemented
Type of arg \d+ to .* must be .* \(not .*\)
umask not implemented
Unknown open\(\) mode '.*'
unmatched \(\) in regexp
Unmatched right .* bracket
unmatched \[\] in regexp
Unrecognized character .*
Unrecognized escape \\. passed through
Unrecognized signal name ".*"
Unrecognized switch: -.*  \(-h will show valid options\)
Unsupported directory function ".*" called
Unsupported function fork
Unsupported function .*
Unsupported socket function ".*" called
Unterminated <> operator
Unterminated attribute parameter in attribute list
Unterminated attribute list
Use of $# is deprecated
Use of $\* is deprecated
Use of .* in printf format not supported
Use of bare << to mean <<"" is deprecated
Use of implicit split to \@_ is deprecated
Use of inherited AUTOLOAD for non-method .*\(\) is deprecated
Use of reserved word ".*" is deprecated
Use of .* is deprecated
Use of uninitialized value.*
Useless use of "re" pragma
Useless use of .* in void context
Variable ".*" is not imported.*
Version number must be a constant number
Warning: Use of ".*" without parentheses is ambiguous
You need to quote ".*"

==HOW?
/ cannot take a count
/ must be followed by a, A or Z
/ must be followed by a\*, A\* or Z\*
/ must follow a numeric type
% may only be used in unpack
.* did not return a true value
C<-T> and C<-B> not implemented on filehandles
C<-p> destination: .*
Arg too short for msgsnd
Bad arg length for .*, is \d+, should be \d+
Attempt to join self
Bad filehandle: .*
Bad index while coercing array into hash
Callback called exit
Can't "goto" out of a pseudo block
Can't "goto" into the middle of a foreach loop
Can't "last" outside a loop block
Can't "next" outside a loop block
Can't "redo" outside a loop block
Can't bless non-reference value
Can't call method ".*" in empty package ".*"
Can't call method ".*" on unblessed reference
Can't call method ".*" without a package or object reference
Can't call method ".*" on an undefined value
Can't chdir to .*
Can't coerce .* to integer in .*
Can't coerce .* to number in .*
Can't coerce .* to string in .*
Can't coerce array into hash
Can't do inplace edit on .*: .*
Can't do inplace edit without backup
Can't do inplace edit: .* would not be unique
Can't do inplace edit: .* is not a regular file
Can't do setegid!
Can't do seteuid!
Can't do setuid
Can't do waitpid with flags
Can't find label .*
Can't fork
Can't goto subroutine outside a subroutine
Can't goto subroutine from an eval-string
Can't locate auto/.*\.al in \@INC
Can't locate .*
Can't locate object method ".*" via package ".*"
Can't locate package .* for \@.*::ISA
Can't msgrcv to read-only var
Can't open .*: .*
Can't open perl script ".*": .*
Can't redefine active sort subroutine .*
Can't remove .*: .*, skipping file 
Can't return .* from lvalue subroutine
Can't take log of .*
Can't take sqrt of .*
Can't undef active subroutine
Can't unshift
Can't use .* ref as .* ref
Can't use string \(".*"\) as .* ref while "strict refs" in use
Can't use an undefined value as .* reference
Can't weaken a nonreference
Can't x= to read-only value
Can't find an opnumber for ".*"
Can't resolve method `.*' overloading `.*' in package `.*'
Constant is not .* reference
Copy method did not return a reference
Died
Illegal division by zero
Illegal modulus zero
Illegal number of bits in vec
Integer overflow in .* number
Invalid type in pack: '.*'
Invalid type in unpack: '.*'
Label not found for "last .*"
Label not found for "next .*"
Label not found for "redo .*"
Method for operation .* not found in package .* during blessing
Modification of a read-only value attempted
Modification of non-creatable array value attempted, subscript \d+
Modification of non-creatable hash value attempted, subscript ".*"
Negative length
No such pseudo-hash field ".*"
No such pseudo-hash field ".*" in variable .* of type .*
No such signal: SIG.*
Not a CODE reference
Not a format reference
Not a GLOB reference
Not a HASH reference
Not a SCALAR reference
Not a subroutine reference
Not a subroutine reference in overload table
Not an ARRAY reference
Null filename used
Offset outside string
Operation `.*': no method found, .*
pid .* not a child
POSIX getpgrp can't take an argument
Range iterator outside integer range
Recursive inheritance detected in package '.*'
Recursive inheritance detected while looking for method '.*' in package '.*'
Reference is already weak
Repeat count in pack overflows
Repeat count in unpack overflows
Runaway format
Sort subroutine didn't return a numeric value
Sort subroutine didn't return single value
Stub found while resolving method `.*' overloading `.*' in package `.*'
Substitution loop
substr outside of string
switching effective .* is not implemented
Target of goto is too deeply nested
The stat preceding C<-l _> wasn't an lstat
Undefined format ".*" called
Undefined sort subroutine ".*" called
Undefined subroutine &.* called
Undefined subroutine called
Undefined subroutine in sort
Undefined top format ".*" called
Warning: unable to close filehandle .* properly
X outside of string
x outside of string
Xsub ".*" called in sort
Xsub called in sort
You can't use C<-l> on a filehandle

==SORRY
.* had compilation errors
.* has too many errors
.* matches null string many times
.* never introduced
B<-P> not allowed for setuid/setgid script
Allocation too large: .*
Args must match #! line
assertion botched: .*
Assertion failed: file ".*"
Attempt to free non-arena SV: 0x.+
Attempt to free nonexistent shared string
Attempt to free temp prematurely
Attempt to free unreferenced glob pointers
Attempt to free unreferenced scalar
Bad free\(\) ignored
Bad hash
Bad realloc\(\) ignored
Bad symbol for array
Bad symbol for filehandle
Bad symbol for hash
Bizarre copy of .* in .*
Can't check filesystem of script ".*" for nosuid
Can't modify nonexistent substring
Can't stat script ".*"
Can't swap uid and euid
Can't upgrade that kind of scalar
Can't upgrade to undef
Constant subroutine .* redefined
constant\(.*\): .*
Corrupt malloc ptr 0x%.* at 0x.*
corrupted regexp pointers
corrupted regexp program
Don't know how to handle magic of type '.*'
do_study: out of memory
Duplicate free\(\) ignored
entering effective .* failed
gdbm store returned \d+, errno \d+, key ".*"
Had to create .* unexpectedly
Insecure dependency in .*
Insecure directory in .*
Insecure $ENV\{.*\} while running .*
internal disaster in regexp
internal urp in regexp at /.*/
leaving effective .* failed
No .* allowed while running setuid
No B<-e> allowed in setuid scripts
No DB::DB routine defined
No dbm on this machine
No DBsub routine
No Perl script found in input
No setregid available
No setreuid available
Not a perl script
NULL OP IN RUN
Null realloc
NULL regexp argument
NULL regexp parameter
oops: oopsAV
oops: oopsHV
Out of memory!
Out of memory for yacc stack
Out of memory during request for .*
Out of memory during "large" request for .*
Out of memory during ridiculously large request
page overflow
panic: ck_grep
panic: ck_split
panic: corrupt saved stack index
panic: del_backref
panic: die .*
panic: do_match
panic: do_split
panic: do_subst
panic: do_trans
panic: frexp
panic: goto
panic: INTERPCASEMOD
panic: INTERPCONCAT
panic: kid popen errno read
panic: last
panic: leave_scope clearsv
panic: leave_scope inconsistency
panic: malloc
panic: magic_killbackrefs
panic: mapstart
panic: null array
panic: pad_alloc
panic: pad_free curpad
panic: pad_free po
panic: pad_reset curpad
panic: pad_sv po
panic: pad_swipe curpad
panic: pad_swipe po
panic: pp_iter
panic: realloc
panic: restartop
panic: return
panic: scan_num
panic: sv_insert
panic: top_env
panic: yylex
panic: .*
Perl .* required--this is only version .*, stopped
Permission denied
realloc\(\) of freed memory ignored
Reallocation too large: .*
regexp memory corruption
regexp out of space
Script is not setuid/setgid in suidperl
semi-panic: attempt to dup freed string
Setuid/gid script is writable by world
Split loop
suidperl is no longer needed since .*
Too late for "B<-T>" option
Too late for "-.*" option
Too late to run .* block
Unable to create sub named ".*"
Unbalanced context: \d+ more PUSHes than POPs
Unbalanced saves: \d+ more saves than restores
Unbalanced scopes: \d+ more ENTERs than LEAVEs
Unbalanced tmps: \d+ more allocs than frees
unexec of .* into .* failed!
Unknown BYTEORDER
perl: warning: Setting locale failed\.
YOU HAVEN'T DISABLED SET-ID SCRIPTS IN THE KERNEL YET!
