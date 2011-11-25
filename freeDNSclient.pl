################### 
##
##  FreeDNS.Afraid.org Dynamic IP script
##  v1.0
##  April 9, 2010
##
###################

use Sys::Hostname;
use LWP::UserAgent;

## set log file and ip file names
## default path is current folder, can change it to whatever... ie: /var/log or c:/temp
$logfile   = 'fda-ip.log';
$ipfile    = 'fda-ip.txt';

#clear the logfile
clear();

mark("START","Starting dynamic IP program");

while (1) {
    #read the previous ip address
    open S, "$ipfile";
    $prev_ip = <S>;
    close S;

    #get the current ip address
    ($name,$aliases,$addrtype,$length,@addrs) = gethostbyname(Sys::Hostname::ghname());

    ($a,$b,$c,$d) = unpack('C4',$addrs[0]);

    $ip = "$a.$b.$c.$d";

    if (!($ip eq $prev_ip)) {

        mark("CHANGE","Updating dynamic IPs");

        ###################################################
        # CUSTOM RECORD UPDATES GO HERE!!!
        ###################################################
        ## repeat for each A Record to be updated
        update("http://freedns.afraid.org/dynamic/update.php?Vmcyb002dmdhRlVBM0FqU0ZmZ2k6Njc0NDY5NQ==");
        ###################################################

        #update ip file
        open S, ">$ipfile";
        print S $ip;
        close S;
    }
    
    sleep(60);
}


sub update {
    my ($url) = @_;

    $type = "UPDATE";
    
    $ua = new LWP::UserAgent;
    $request = new HTTP::Request('GET', $url);
    $response = $ua->request($request);
    $result = $response->content();

    open  E, ">>$logfile";
    print localtime()."\t$type\t".$result."\n";
    print E localtime()."\t$type\t".$result."\n";
    close E;
}


sub mark {
    my ($type, $message) = @_;
    
    open  E, ">>$logfile";
    print localtime()."\t$type\t".$message."\n";
    print E localtime()."\t$type\t".$message."\n";
    close E;
}

sub clear {
    open  E, ">$logfile";
    close E;
}
