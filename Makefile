# Copyright 2020 Tile Inc.  All Rights Reserved.
#

SHELL:=/opt/local/bin/bash
JIRA_TICKET:=TTGE-4966
JIRA_URL=https://thetileapp.atlassian.net
#SLACK_CHANNEL:=\#engineering
TIMESTAMP:=$(shell /bin/date "+_%Y_%m_%d_%H%M%S%Z.svg")
TICKET_TIMESTAMP:=${JIRA_TICKET}$(shell /bin/date "+ %Y-%m-%d %H:%M:%S")
TITLE=${JIRA_REPORT_TITLE}${TICKET_TIMESTAMP}

run:
	/opt/local/bin/python3 jira-dependency-graph.py \
--user=${JIRA_USER} \
--password=${JIRA_PASS} \
--jira=${JIRA_URL} \
--word-wrap \
-d inward \
-l \
${JIRA_TICKET} \
| /usr/bin/sed -e '3i\'$$'\n''edge [dir="back"];' \
| /usr/bin/sed -e '4i\'$$'\n''labelloc="t";' \
| /usr/bin/sed -e '5i\'$$'\n''label="${TITLE}";' \
| /opt/local/bin/dot -Tsvg -Nfontname=Helvetica -Nfontsize=10 -Efontname=Helvetica -Efontsize=7 -Gfontname=Helvetica -Gfontsize=12 -o ${JIRA_TICKET}${TIMESTAMP}

view: run
	open ${JIRA_TICKET}${TIMESTAMP}

upload: run
	/opt/local/bin/python3 uploadjiradeps2slack.py ${JIRA_TICKET}${TIMESTAMP} "${SLACK_CHANNEL}"

clean:
	rm *.svg
