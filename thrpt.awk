#!/usr/bin/awk  -f
BEGIN {
     last = 0
     tcp_sz = 0
     cbr_sz = 0
     total_sz = 0
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


	
	if (type == "tcp" && action == "r" && to == "3" ) 
    
                    tcp_sz += pktsize
    
	if (type == "cbr" && action == "r" && to == "3" ) 
                    cbr_sz += pktsize
    
            total_sz += pktsize
     

 }
END {
     print time , (tcp_sz * 8 / 1000000 ) , (cbr_sz * 8 / 1000000 ) , ( total_sz * 8 / 1000000)
 }


