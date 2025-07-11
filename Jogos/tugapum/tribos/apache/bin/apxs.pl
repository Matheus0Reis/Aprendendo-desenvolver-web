#!C:\Users\Kfeast\Desktop\tribos\xampp\perl\bin\perl.EXE -w
# ====================================================================
#
#  Copyright 2003-2004  The Apache Software Foundation
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

# apxs script designed to allow easy command line access to Apache
# configuration parameters.

require 5.003;
use strict;
package apxs;
use File::Copy;
use File::Spec::Functions;

##
##  Configuration
##

my %config_vars = ();

my $installbuilddir = 'H:\apache\build';
get_config_vars("$installbuilddir/config_vars.mk",\%config_vars);

# read the configuration variables once

my $prefix          = get_vars('prefix');
my $CFG_PREFIX      = $prefix;
my $exec_prefix     = get_vars('exec_prefix');
my $datadir         = get_vars('datadir');
my $localstatedir   = get_vars('localstatedir');
my $CFG_TARGET      = get_vars('progname');
my $progname        = get_vars('progname');
my $CFG_SYSCONFDIR  = get_vars('sysconfdir');
my $CFG_SYSCONF     = get_vars('sysconf');
my $CFG_CFLAGS      = join ' ', map { get_vars($_) }
    qw(SHLTCFLAGS CFLAGS NOTEST_CPPFLAGS EXTRA_CPPFLAGS EXTRA_CFLAGS);
my $includedir      = get_vars('includedir');
my $CFG_INCLUDEDIR  = $includedir;
my $libdir          = get_vars('libdir');
my $CFG_LIBDIR      = $libdir;
my $CFG_CC          = get_vars('CC');
my $CFG_LD          = get_vars('LD');
my $CFG_LDFLAGS     = get_vars('LDFLAGS');
my $libexecdir      = get_vars('libexecdir');
my $CFG_LIBEXECDIR  = $libexecdir;
my $sbindir         = get_vars('sbindir');
my $CFG_SBINDIR     = $sbindir;
my $ltflags         = $ENV{LTFLAGS};
my $apr_libname     = get_vars('APR_LIBNAME');
my $aprutil_libname = get_vars('APRUTIL_LIBNAME');

$ltflags or $ltflags = '--silent';

my %internal_vars = map {$_ => 1}
    qw(TARGET CC CFLAGS CFLAGS_SHLIB LD_SHLIB LDFLAGS_SHLIB LIBS_SHLIB
       PREFIX SBINDIR INCLUDEDIR LIBEXECDIR SYSCONFDIR SYSCONF);

my $CP    = 'C:\Users\Kfeast\Desktop\tribos\xampp\perl\bin\perl.EXE -MExtUtils::Command -e cp';
my $CHMOD = 'C:\Users\Kfeast\Desktop\tribos\xampp\perl\bin\perl.EXE -MExtUtils::Command -e chmod';
my $RM_F  = 'C:\Users\Kfeast\Desktop\tribos\xampp\perl\bin\perl.EXE -MExtUtils::Command -e rm_f';
my $TOUCH = 'C:\Users\Kfeast\Desktop\tribos\xampp\perl\bin\perl.EXE -MExtUtils::Command -e touch';

##
##  parse argument line
##

#   defaults for parameters
my $opt_n = '';
my $opt_g = '';
my $opt_c = 0;
my $opt_o = '';
my @opt_D = ();
my @opt_I = ();
my @opt_L = ();
my @opt_l = ();
my @opt_W = ();
my @opt_S = ();
my $opt_e = 0;
my $opt_i = 0;
my $opt_a = 0;
my $opt_A = 0;
my $opt_q = 0;
my $opt_h = 0;
my $opt_p = 0;
my $opt_d = 0;

#   this subroutine is derived from Perl's getopts.pl with the enhancement of
#   the "+" metacharacter at the format string to allow a list to be built by
#   subsequent occurrences of the same option.
sub Getopts {
    my ($argumentative, @ARGV) = @_;
    my $errs = 0;
    local $_;
    local $[ = 0;

    my @args = split / */, $argumentative;
    while (@ARGV && ($_ = $ARGV[0]) =~ /^-(.)(.*)/) {
        my ($first, $rest) = ($1,$2);
        if ($_ =~ m|^--$|) {
            shift @ARGV;
            last;
        }
        my $pos = index($argumentative,$first);
        if ($pos >= $[) {
            if ($pos < $#args && $args[$pos+1] eq ':') {
                shift @ARGV;
                if ($rest eq '') {
                    unless (@ARGV) {
                        error("Incomplete option: $first (needs an argument)");
                        $errs++;
                    }
                    $rest = shift(@ARGV);
                }
                eval "\$opt_$first = \$rest;";
            }
            elsif ($pos < $#args && $args[$pos+1] eq '+') {
                shift @ARGV;
                if ($rest eq '') {
                    unless (@ARGV) {
                        error("Incomplete option: $first (needs an argument)");
                        $errs++;
                    }
                    $rest = shift(@ARGV);
                }
                eval "push(\@opt_$first, \$rest);";
            }
            else {
                eval "\$opt_$first = 1";
                if ($rest eq '') {
                    shift(@ARGV);
                }
                else {
                    $ARGV[0] = "-$rest";
                }
            }
        }
        else {
            error("Unknown option: $first");
            $errs++;
            if ($rest ne '') {
                $ARGV[0] = "-$rest";
            }
            else {
                shift(@ARGV);
            }
        }
    }
    return ($errs == 0, @ARGV);
}

sub usage {
    print STDERR <<'END';
Usage: apxs -g [-S <var>=<val>] -n <modname>
       apxs -q [-S <var>=<val>] <query> ...
       apxs -c [-S <var>=<val>] [-o <dsofile>] [-D <name>[=<value>]]
               [-I <incdir>] [-L <libdir>] [-l <libname>] [-Wc,<flags>]
               [-Wl,<flags>] [-p] <files> ...
       apxs -i [-S <var>=<val>] [-a] [-A] [-n <modname>] <dsofile> ...
       apxs -e [-S <var>=<val>] [-a] [-A] [-n <modname>] <dsofile> ...

END
    exit(1);
}

#   option handling
my $rc;
($rc, @ARGV) = &Getopts("qn:gco:I+D+L+l+W+S+eiaApd", @ARGV);
&usage if ($rc == 0);
&usage if ($#ARGV == -1 and not $opt_g);
&usage if (not $opt_q and not ($opt_g and $opt_n) 
           and not $opt_i and not $opt_c and not $opt_e);

#   argument handling
my @args = @ARGV;
my $name = 'unknown';
$name = $opt_n if ($opt_n ne '');

if (@opt_S) {
    my ($opt_S);
    foreach $opt_S (@opt_S) {
        if ($opt_S =~ m/^([^=]+)=(.*)$/) {
            my ($var) = $1;
            my ($val) = $2;
            my $oldval = eval "\$CFG_$var";

            unless ($var and $oldval) {
                print STDERR "apxs:Error: no config variable $var\n";
                &usage;
            }

            eval "\$CFG_${var}=\"${val}\"";
        } else {
            print STDERR "apxs:Error: malformatted -S option\n";
            &usage;
        }	
    }
}

##
##  Initial shared object support check
##
my $httpd = catfile get_vars("sbindir"), get_vars("progname");
my $envvars = catfile get_vars("sbindir"), "envvars";

#allow apxs to be run from the source tree, before installation
if ($0 =~ m:support/apxs$:) {
    ($httpd = $0) =~ s:support/apxs$::;
}

unless (-f $httpd) {
    error("$httpd not found or not executable");
    exit 1;
}

sub get_config_vars{
    my ($file, $rh_config) = @_;

    open IN, $file or die "cannot open $file: $!";
    while (<IN>){
        if (/^\s*(.*?)\s*=\s*(.*)$/){
            $rh_config->{$1} = $2;
        }
    }
    close IN;
}

sub get_vars {
    my $result = '';
    my $ok = 0;
    my $arg;
    foreach $arg (@_) {
        if (exists $config_vars{$arg} or exists $config_vars{lc $arg}) {
            my $val = exists $config_vars{$arg}
                ? $config_vars{$arg}
                    : $config_vars{lc $arg};
            $val =~ s/[()]//g;
            $result .= $val if defined $val;
            $result .= ";;"; 
            $ok = 1;
        }
        if (not $ok) {
            if (exists $internal_vars{$arg} 
                or exists $internal_vars{lc $arg}) {
                my $val = exists $internal_vars{$arg} ? $arg : lc $arg;
                $val = eval "\$CFG_$val";
                $result .= $val if defined $val;
                $result .= ";;";
                $ok = 1;
            }
            if (not $ok) {
                error("Invalid query string `$arg'");
                exit(1);
            }
        }
    }
    $result =~ s|;;$||;
    #    $result =~ s|:| |;
    return $result;
}

##
##  Operation
##

#   helper function for executing a list of
#   system command with return code checks
sub execute_cmds {
    my (@cmds) = @_;
    my ($cmd, $rc);

    foreach $cmd (@cmds) {
        notice($cmd);
        $rc = system $cmd;
        if ($rc) {
            error(sprintf "Command failed with rc=%d\n", $rc << 8);
            exit 1 ;
        }
    }
}

if ($opt_g) {
    ##
    ##  SAMPLE MODULE SOURCE GENERATION
    ##

    if (-d $name) {
        error("Directory `$name' already exists. Remove first");
        exit(1);
    }

    my $data = join('', <DATA>);
    $data =~ s!__END__.*!!s;
    $data =~ s|%NAME%|$name|sg;
    $data =~ s|%PROGNAME%|$progname|sg;
    $data =~ s|%SYSCONF%|$CFG_SYSCONF|sg;
    $data =~ s|%PREFIX%|$prefix|sg;
    $data =~ s|%INSTALLBUILDDIR%|$installbuilddir|sg;

    my ($mkf, $src) = ($data =~ m|^(.+)-=\#=-\n(.+)|s);

    notice("Creating [DIR]  $name");
    mkdir $name or die "Cannot mkdir $name: $!";
    notice("Creating [FILE] $name/Makefile");
    open(FP, ">${name}/Makefile") or die "Cannot open ${name}/Makefile: $!";
    print FP $mkf;
    close(FP);
    notice("Creating [FILE] $name/mod_$name.c");
    open(FP, ">${name}/mod_${name}.c") || die;
    print FP $src;
    close(FP);
    notice("Creating [FILE] $name/.deps");
    open(FP, ">${name}/.deps") or die "Cannot open ${name}/.deps: $!";
    close(FP);

    exit(0);
}

if ($opt_q) {
    ##
    ##  QUERY INFORMATION 
    ##
    my $result = get_vars(@args);
    print "$result\n";
}

my $apr_bindir = get_vars("APR_BINDIR");
my $apu_bindir = get_vars("APU_BINDIR");

my $apr_includedir = qq{-I"$prefix/include"};
my $apu_includedir = qq{-I$"prefix/include"};

if ($opt_c) {
    ##
    ##  SHARED OBJECT COMPILATION
    ##
    
    #   split files into sources and objects
    my @srcs = ();
    my @objs = ();
    my $f;
    foreach $f (@args) {
        if ($f =~ m|\.c$|) {
            push(@srcs, $f);
        }
        else {
            push(@objs, $f);
        }
    }

    #   determine output file
    my $dso_file;
    if ($opt_o eq '') {
        if ($#srcs > -1) {
            $dso_file = $srcs[0];
            $dso_file =~ s|\.[^.]+$|.so|;
        }
        elsif ($#objs > -1) {
            $dso_file = $objs[0];
            $dso_file =~ s|\.[^.]+$|.so|;
        }
        else {
            $dso_file = "mod_unknown.so";
        }
    }
    else {
        $dso_file = $opt_o;
    }

    #   create compilation commands
    my @cmds = ();
    my $opt = '';
    my ($opt_Wc, $opt_I, $opt_D);
    foreach $opt_Wc (@opt_W) {
        $opt .= "$1 " if ($opt_Wc =~ m|^\s*c,(.*)$|);
    }
    foreach $opt_I (@opt_I) {
        $opt .= qq{ /I"$opt_I" };
    }
    foreach $opt_D (@opt_D) {
        $opt .= qq{ /D "$opt_D" };
    }
    my $cflags = "$CFG_CFLAGS";
    if ($opt_d) {
        $cflags =~ s!NDEBUG!DEBUG!;
        $cflags .= ' /Zi';
        $cflags =~ s!/MD !/MDd !;
    }
    my $s;
    my $mod;
    foreach $s (@srcs) {
        my $slo = $s;
        $slo =~ s|\.c$|.slo|;
        my $lo = $s;
        $lo =~ s|\.c$|.lo|;
        my $la = $s;
        $la =~ s|\.c$|.la|;
        my $o = $s;
        $o =~ s|\.c$|.o|;
        push(@cmds, qq{$CFG_CC $cflags -I"$CFG_INCLUDEDIR" $opt /c /Fo$lo $s});
        unshift(@objs, $lo);
    }

    #   create link command
    my $o;
    my $lo;
    $opt = '';
    foreach $o (@objs) {
        $lo .= " $o";
    }
    my ($opt_Wl, $opt_L, $opt_l);
    foreach $opt_Wl (@opt_W) {
        if ($CFG_CC !~ m/gcc$/) {
            $opt .= " $1" if ($opt_Wl =~ m|^\s*l,(.*)$|);
        } else {
            $opt .= " -W$opt_Wl";
        }
    }
    foreach $opt_L (@opt_L) {
        $opt .= qq{ /libpath:"$opt_L" };
    }
    foreach $opt_l (@opt_l) {
        $opt_l .= '.lib' unless ($opt_l =~ /\.lib$/); 
        $opt .= " $opt_l";
    }

    if ($opt_p == 1) {
        $opt .= " ".$aprutil_libname." ".$apr_libname;
    }
    else {
        my $apr_ldflags;
        $opt .= " $apr_ldflags";
    }
    my $ldflags = "$CFG_LDFLAGS";
    if ($opt_d) {
        $ldflags .= ' /debug';
    }
    push(@cmds, "$CFG_LD $ldflags /out:$dso_file $opt $lo");

    #   execute the commands
    &execute_cmds(@cmds);

    #   allow one-step compilation and installation
    if ($opt_i or $opt_e) {
        @args = ( $dso_file );
    }
}

if ($opt_i or $opt_e) {
    ##
    ##  SHARED OBJECT INSTALLATION
    ##
    unless (-d $CFG_LIBEXECDIR) {
        die "Directory $CFG_LIBEXECDIR not found";
    }
    #   determine installation commands
    #   and corresponding LoadModule/AddModule directives
    my @lmd = ();
    my @amd = ();
    my @cmds = ();
    my $f;
    foreach $f (@args) {
        my $end = qr{(\.so|\.la)$};
        if ($f !~ m!$end!) {
            error("file $f is not a shared object");
            exit(1);
        }
        my $t = $f;
        $t =~ s|^.+/([^/]+)$|$1|;
        $t =~ s|\.la$|\.so|;
        (my $libf = $f) =~ s!$end!.lib!;
        (my $libt = $t) =~ s!$end!.lib!;
        (my $pdbf = $f) =~ s!$end!.pdb!;
        (my $pdbt = $t) =~ s!$end!.pdb!;

        if ($opt_i) {
            push(@cmds, "$CP $f $CFG_LIBEXECDIR");
            push(@cmds, "$CHMOD 755 $CFG_LIBEXECDIR\\$t");
            if (-f $libf) {
                push(@cmds, "$CP $libf $CFG_LIBDIR");
                push(@cmds, "$CHMOD 755 $CFG_LIBDIR\\$libt");
            }
            if ($opt_d and -f $pdbf) {
                push(@cmds, "$CP $pdbf $CFG_LIBEXECDIR");
                push(@cmds, "$CHMOD 755 $CFG_LIBEXECDIR\\$pdbt");
            }
        }

        #   determine module symbolname and filename
        my $filename = '';
        if ($name eq 'unknown') {
            $name = '';
            my $base = $f;
            $base =~ s|\.[^.]+$||;
            if (-f "$base.c") {
                open(FP, "<$base.c");
                my $content = join('', <FP>);
                close(FP);
                if ($content =~ m|.*module\s+(?:AP_MODULE_DECLARE_DATA\s+)?([a-zA-Z0-9_]+)_module\s*=\s*.*|s) {
                    $name = "$1";
                    $filename = "$base.c";
                    $filename =~ s|^[^/]+/||;
                }
            }
            if ($name eq '') {
                if ($base =~ m|.*mod_([a-zA-Z0-9_]+)\..+|) {
                    $name = "$1";
                    $filename = $base;
                    $filename =~ s|^[^/]+/||;
                }
            }
            if ($name eq '') {
                error("Sorry, cannot determine bootstrap symbol name");
                error("Please specify one with option `-n'");
                exit(1);
            }
        }
        if ($filename eq '') {
            $filename = "mod_${name}.c";
        }
        my $dir = $CFG_LIBEXECDIR;
        $dir =~ s|^$CFG_PREFIX/?||;
        $dir =~ s|(.)$|$1/|;
        $dir =~ s|\\|/|g;
        $t =~ s|\.la$|.so|;
        push(@lmd, 
             sprintf("LoadModule %-18s %s", "${name}_module", qq{"$dir$t"}));
        push(@amd, sprintf("AddModule %s", $filename));
    }

    #   execute the commands
    &execute_cmds(@cmds);

    #   activate module via LoadModule/AddModule directive
    if ($opt_a or $opt_A) {
        if (not -f "$CFG_SYSCONFDIR/$CFG_SYSCONF") {
            error("Config file $CFG_SYSCONFDIR/$CFG_SYSCONF not found");
            exit(1);
        }

        open(FP, "<$CFG_SYSCONFDIR/$CFG_SYSCONF") 
            || die "Cannot open $CFG_SYSCONFDIR/$CFG_SYSCONF: $!";
        my $content = join('', <FP>);
        close(FP);

        if ($content !~ m|\n\#?\s*LoadModule\s+|) {
            error("Activation failed for custom $CFG_SYSCONFDIR/$CFG_SYSCONF file.");
            error("At least one `LoadModule' directive already has to exist.");
            exit(1);
        }

        my $lmd;
        my $c = '';
        $c = '#' if ($opt_A);
        foreach $lmd (@lmd) {
            my $what = $opt_A ? "preparing" : "activating";
            if ($content !~ m|\n\#?\s*$lmd|) {
                # check for open <containers>, so that the new LoadModule
                # directive always appears *outside* of an <container>.

                my $before = 
                    ($content =~ m|^(.*\n)\#?\s*LoadModule\s+[^\n]+\n|s)[0];

                # the '()=' trick forces list context and the scalar
                # assignment counts the number of list members (aka number
                # of matches) then
                my $cntopen = () = ($before =~ m|^\s*<[^/].*$|mg);
                my $cntclose = () = ($before =~ m|^\s*</.*$|mg);

                if ($cntopen == $cntclose) {
                    # fine. Last LoadModule is contextless.
                    $content =~ s|^(.*\n\#?\s*LoadModule\s+[^\n]+\n)|$1$c$lmd\n|s;
                }
                elsif ($cntopen < $cntclose) {
                    error('Configuration file is not valid. There are sections'
                          . ' closed before opened.');
                    exit(1);
                }
                else {
                    # put our cmd after the section containing the last
                    # LoadModule.
                    my $found =
                        $content =~ s!\A (  # string and capture start
                                          (?:(?:
                                              ^\s*  # start of conf line with a
                                              (?:[^<]|<[^/]) # directive which
                                                             # does not
                                                             # start with '</'
                                              
                                              .*(?:$)\n  # rest of the line.
                                                 # the '$' is in parentheses
                                                 # to avoid misinterpreting
                                                 # the string "$\" as
                                                 # perl variable.
                                                 
                                                )* # catch as much as possible
                                                   # of such lines. (including
                                                   # zero)
                                              
                                              ^\s*</.*(?:$)\n? 
                                                   # after the above, we
                                                   # expect a config line with
                                                   # a closing container (</)
                                                       
                                                      ) {$cntopen}       
                                              # the whole pattern (bunch
                                              # of lines that end up with
                                              # a closing directive) must
                                              # be repeated $cntopen
                                              # times. That's it.
                                              # Simple, eh? ;-)
                                    
                                             )  # capture end  
                                           !$1$c$lmd\n!mx;  
                    unless ($found) {
                        error('Configuration file is not valid. There are '
                              . 'sections opened and not closed.');
                        exit(1);
                    }
                }
            }
            else {
                # replace already existing LoadModule line
                $content =~ s|^(.*\n)\#?\s*$lmd[^\n]*\n|$1$c$lmd\n|s;
            }
            $lmd =~ m|LoadModule\s+(.+?)_module.*|;
            notice("[$what module `$1' in $CFG_SYSCONFDIR\\$CFG_SYSCONF]");
        } 
        my $amd;
        foreach $amd (@amd) {
            if ($content !~ m|\n\#?\s*$amd|) {
                $content =~ s|^(.*\n\#?\s*AddModule\s+[^\n]+\n)|$1$c$amd\n|sg;
            } 
            else {
                $content =~ s|^(.*\n)\#?\s*$amd[^\n]*\n|$1$c$amd\n|sg;
            }
        }

        if (@lmd or @amd) {
            my $conf = catfile $CFG_SYSCONFDIR, $CFG_SYSCONF;
            my $conf_new = $conf . '.new';
            my $conf_bak = $conf . '.bak';
            if (open(FP, '>', $conf_new)) {
                print FP $content;
                close(FP);
                copy($conf, $conf_bak) or
                         die "Backup of $conf failed: $!";
                copy($conf_new, $conf) or
                         die "Copying $conf_new to $conf failed: $!";
                unlink $conf_new or
                    die "Removing $conf_new failed: $!";
            } 
            else {
                notice("unable to open configuration file $conf_new");
            }
        }
    }
}

sub error{
    print STDERR "apxs:Error: $_[0].\n";
}

sub notice{
    print STDERR "$_[0]\n";
}

##EOF##
__DATA__
##
##  Makefile -- Build procedure for sample %NAME% Apache module
##  Autogenerated via ``apxs -n %NAME% -g''.
##

builddir=.
top_srcdir=%PREFIX%
top_builddir=%PREFIX%

#   the used tools
APXS=apxs
APACHECTL=%PROGNAME% -k

#   additional defines, includes and libraries
#DEFS=-Dmy_define=my_value
#INCLUDES=-Imy/include/dir
#LIBS=-Lmy/lib/dir -lmylib

#   the default target
all: local-shared-build

#   install the shared object file into Apache 
install: install-modules

#   cleanup
clean:
        -@erase mod_%NAME%.lo mod_%NAME%.ilk mod_%NAME%.so mod_%NAME%.lib mod_%NAME%.exp mod_%NAME%.pdb

#   simple test
test: reload
	GET http://localhost/%NAME%

#   install and activate shared object by reloading Apache to
#   force a reload of the shared object file
reload: install restart

#   the general Apache start/restart/stop
#   procedures
start:
	$(APACHECTL) start
restart:
	$(APACHECTL) restart
stop:
	$(APACHECTL) stop

-=#=-
/* 
**  mod_%NAME%.c -- Apache sample %NAME% module
**  [Autogenerated via ``apxs -n %NAME% -g'']
**
**  To play with this sample module first compile it into a
**  DSO file and install it into Apache's modules directory 
**  by running:
**
**    $ apxs -c -i mod_%NAME%.c
**
**  Then activate it in Apache's %SYSCONF% file for instance
**  for the URL /%NAME% in as follows:
**
**    #   %SYSCONF%
**    LoadModule %NAME%_module modules/mod_%NAME%.so
**    <Location /%NAME%>
**    SetHandler %NAME%
**    </Location>
**
**  Then after restarting Apache via
**
**    $ apachectl restart
**
**  you immediately can request the URL /%NAME% and watch for the
**  output of this module. This can be achieved for instance via:
**
**    $ lynx -mime_header http://localhost/%NAME% 
**
**  The output should be similar to the following one:
**
**    HTTP/1.1 200 OK
**    Date: Tue, 31 Mar 1998 14:42:22 GMT
**    Server: Apache/1.3.4 (Unix)
**    Connection: close
**    Content-Type: text/html
**  
**    The sample page from mod_%NAME%.c
*/ 

#include "httpd.h"
#include "http_config.h"
#include "http_protocol.h"
#include "ap_config.h"

/* The sample content handler */
static int %NAME%_handler(request_rec *r)
{
    if (strcmp(r->handler, "%NAME%")) {
        return DECLINED;
    }
    r->content_type = "text/html";      

    if (!r->header_only)
        ap_rputs("The sample page from mod_%NAME%.c\n", r);
    return OK;
}

static void %NAME%_register_hooks(apr_pool_t *p)
{
    ap_hook_handler(%NAME%_handler, NULL, NULL, APR_HOOK_MIDDLE);
}

/* Dispatch list for API hooks */
module AP_MODULE_DECLARE_DATA %NAME%_module = {
    STANDARD20_MODULE_STUFF, 
    NULL,                  /* create per-dir    config structures */
    NULL,                  /* merge  per-dir    config structures */
    NULL,                  /* create per-server config structures */
    NULL,                  /* merge  per-server config structures */
    NULL,                  /* table of config file commands       */
    %NAME%_register_hooks  /* register hooks                      */
};
