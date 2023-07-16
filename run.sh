#!/bin/sh
set -xe

curl "https://uic.campusgroups.com/ics?uid=6e5c8fe1-dbbd-11ed-902f-0e3e5d452619&type=group&eid=ccad7241c88a1d61aa0a73173e0e9648" |

# CRLF<space> is used to fold long lines
sed -z "s/\r\n //g" |

# Black magic
gawk -E script.awk |

# \n is better anyway
sed 's/\r//g' > public/events.xml

# Generate rss feed
xsltproc content/rss.xsl public/events.xml > public/rss.xml
