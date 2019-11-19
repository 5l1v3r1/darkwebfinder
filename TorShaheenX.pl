# *************************************************************************************** #
# ---------------------------------- EULA NOTICE ---------------------------------------- #
#                     Agreement between "Haroon Awan" and "You"(user).                    #
# ---------------------------------- EULA NOTICE ---------------------------------------- #
#  1. By using this piece of software your bound to these point.                          #
#  2. This an End User License Agreement (EULA) is a legal between a software application #
#     author "Haroon Awan" and (YOU) user of this software.                               #
#  3. This software application grants users rights to use for any purpose or modify and  #
#     redistribute creative works.                                                        #
#  4. This software comes in "is-as" warranty, author "Haroon Awan" take no responsbility #
#     what you do with by/this software as your free to use this software.                #
#  5. Any other purpose(s) that it suites as long as it is not related to any kind of     #
#     crime or using it in un-authorized environment.                                     #
#  6. You can use this software to protect and secure your data information in any        #
#     environment.                                                                        #
#  7. It can also be used in state of being protection against the unauthorized use of    #
#     information.                                                                        #
#  8. It can be used to take measures achieve protection.                                 #
# *************************************************************************************** #

#!/usr/bin/perl 

use HTML::TokeParser;
use Mojo;
use Mojo::DOM;
use HTML::TokeParser;
use HTTP::Request;
use LWP::Simple;
use LWP::UserAgent;
use IO::Socket::INET;
use Term::ANSIColor;
use IO::Select;
use HTTP::Response;
use HTTP::Request::Common qw(POST);
use HTTP::Request::Common qw(GET);
use URI::URL;
use feature ':5.10';
use LWP::UserAgent;
no warnings 'uninitialized';
use Term::ANSIColor;
use Data::Validate::Domain qw(is_domain);

print color('bold red');
print color('bold yellow');
print "\n";
print "[ + ] Programmer         :    Haroon Awan\n";
print "[ + ] License            :    EULA\n";
print "[ + ] Version            :    1.0\n";
print "[ + ] Contact            :    mrharoonawan\@gmail\.com \n";
print "[ + ] Github             :    Https://www.github.com/haroonawanofficial\n";
print "[ + ] Design Scheme      :    Tor Powered ShaheenX\n";

# USER AGENT ALGORITHM ######
$ag = LWP::UserAgent->new();
$ag->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ag->timeout(10);
#$ag->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36");
#Extra user-agent in case, google block any kind of request

# DORK AND QUERY ALGORITHM ######
print color("bold Green"),"[+] Enter Search         :    ";
chomp($dork=<STDIN>);
print color("yellow"), "\n";


# PAGE SCRAPE ALROGITHM ######
for (my $i=1; $i<=200; $i+=10) {
$url = "https://ahmia.fi/search/?q=$dork";
$resp = $ag->request(HTTP::Request->new(GET => $url));
$rrs = $resp->content;

# ERROR HANDLGING ALGORITHM ######
if ($rrs =~ m/^Error/i) {
print "[!] Error [!] Blocked, clear cache \n\n";
exit;
}
else {}

#while ($rrs =~ m/<a href>\s*(.*?)\s*<\/a>/g) {
#   if (is_domain($1)) {
#      print "$_\n";
#}

$p = HTML::TokeParser->new(\$rrs);
  while ($p->get_tag("cite")) {
      my @link = $p->get_trimmed_text("/cite");
      foreach(@link) { print "$_\n"; }
      open(OUT, ">>onions.txt"); print OUT "@link\n"; close(OUT);
  }
 } 
exit;
