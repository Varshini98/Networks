#!/usr/bin/awk  -f
BEGIN {
     last = 0
     tcp_drp = 0
     cbr_drp = 0
     total_drp = 0
	#print "TIME\tTCP\tCBR\tTOT"
	#print "-----------------------------------------"

}
{
       
   action = $1;
   time = $2;
   from = $3;
   to = $4;
   type = $5;
   pktsize = $6;
   flow_id = $8;
   src = $9;
   dst = $10;
   seq_no = $11;
   packet_id = $12; 
	
	if (type == "tcp" && action == "d") 
                    tcp_drp += 1
	if (type == "cbr" && action == "d") 
                    cbr_drp += 1

     #every second
     if (time - 1 > last) {
            last = time
            print time , tcp_drp >> "tcpdrp.tr"
            print time , cbr_drp >> "cbrdrp.tr"
	    print time , cbr_drp + tcp_drp >> "totdrp.tr"  
            tcp_drp = 0
            cbr_drp = 0
            total_drp = 0
     }

 }
END {
            print time , tcp_drp >> "tcp.tr"
            print time , cbr_drp >> "cbr.tr"
	    print time , cbr_drp + tcp_drp >> "tot.tr"  
 }


