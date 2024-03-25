#!/usr/bin/env bash
# https://github.com/drduh/blocklists/blob/master/generate-ipv6.sh

LC_ALL=C

for list in $(find corporations -type f \
	! -name "README*" ! -name "*.easylist*" ! -name "*.ipv6") ; do

	ipv6="${list}.ipv6" && printf "creating %s\n" "${ipv6}"

	for ip in $(grep "0.0.0.0" ${list} | awk '{print $2}' | sort) ; do
		printf "::1 %s\n" "${ip}"
	done > "${ipv6}"
done
