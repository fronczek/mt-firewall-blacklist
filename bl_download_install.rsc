# This script downloads BlackLists from server and installs it on Mikrotik router.

/tool fetch url="http://194.33.83.115/mtbl_dshield.rsc" mode=http
/tool fetch url="http://194.33.83.115/mtbl_firehol.rsc" mode=http
/tool fetch url="http://194.33.83.115/mtbl_spamhaus.rsc" mode=http
/tool fetch url="http://194.33.83.115/mtbl_spamhause.rsc" mode=http
:log info "Downloaded BlackLists"

/ip firewall address-list remove [find where comment="DShield"]
/ip firewall address-list remove [find where comment="Firehol"]
/ip firewall address-list remove [find where comment="SpamHausDrop"]
/ip firewall address-list remove [find where comment="SpamHauseDrop"]
:log info "Deleted BlackLists"

/import file-name=mtbl_dshield.rsc
/import file-name=mtbl_firehol.rsc
/import file-name=mtbl_spamhaus.rsc
/import file-name=mtbl_spamhause.rsc
:log info "Imported new BlackLists"
