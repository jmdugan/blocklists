#!/usr/bin/env bash
# https://github.com/drduh/blocklists/blob/master/generate-ipv6.sh

for list in $(find corporations -type f \
	! -name "README*" ! -name "*.easylist*" ! -name "*.ipv6") ; do

	ipv6="${list}.ipv6" && printf "creating ${ipv6}\n"

	touch ${ipv6}
	for ip in $(grep "0.0.0.0" ${list} | awk '{print $2}' | sort) ; do
		printf "::1 ${ip}\n"
	done >> ${ipv6}
done
