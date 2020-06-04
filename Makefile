SHELL:=/opt/local/bin/bash
JIRA_USER:=charles@tile.com
JIRA_PASS:=TsEkv6ros3kl2lOR8SVg8822
JIRA_URL:=https://thetileapp.atlassian.net
JIRA_TICKET:=TTGE-4966
TIMESTAMP:=$(shell /bin/date "+_%Y_%m_%d.svg")


run:
	python3 jira-dependency-graph.py \
--user=${JIRA_USER} \
--password=${JIRA_PASS} \
--jira=${JIRA_URL} \
--word-wrap \
-d inward \
-l \
${JIRA_TICKET} \
| sed -e '3i\'$$'\n''edge [dir="back"];' \
| dot -Tsvg -Nfontname=Helvetica -Nfontsize=10 -Efontname=Helvetica -Efontsize=7 \
> ${JIRA_TICKET}${TIMESTAMP}
