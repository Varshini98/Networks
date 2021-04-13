#!/usr/bin/awk  -f
BEGIN {
     old2 = 0
     old1 = 0

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


	 
	if (type == "cbr" && action == "r" && from ="2" && to == "3" ) 
	{
            dif = seq_no - old2
            if(dif == 0) dif = 1 
            if(dif > 0) 
	    { 	
                print  seq_no, (time - old1) / dif >> "jitter.txt"
            	old1 = time
	        old2 = seq_no
            }
	}       
 }
END {
       
 }


