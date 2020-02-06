#!/usr/bin/env bash
# https://github.com/drduh/blocklists/blob/master/generate-easylists.sh

for list in $(find corporations -type f \
	! -name "README*" ! -name "*.easylist*") ; do

	easylist="${list}.easylist"

	printf "[Adblock Plus 2.0]\n" > ${easylist}
	for ip in $(grep "0.0.0.0" ${list} | awk '{print $2}' | sort) ; do
		for mod in \^ \^\$popup \^\$third-party ; do
			printf "||" ; printf ${ip} ; printf "${mod}\n"
		done
	done >> ${easylist}
done
