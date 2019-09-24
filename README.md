Group project to catalog and list domain names that people may want to block.  

Current focus on corporations, for which there are no other maintained lists.

Files in this project list the domain names of servers, one per line that can be added to your local hosts file to tell your computer to never talk to servers on that domain name or added to your [pi-hole](https://github.com/pi-hole/pi-hole) blocklists for network wide blocking.


## FAQ

* "This would be so much cleaner if one were writing this as a dnsmasq config"

  Yes.  If you want that solution, see [dnsmasq](http://www.thekelleys.org.uk/dnsmasq/doc.html)
  and projects like these: [FreeContributor](https://github.com/evilneuro/FreeContributor).

  These options require slightly more technical skill than adding entries to your hosts file, 
  and can work better in some ways.
