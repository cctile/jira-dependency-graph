# Tile-flavored JIRA Dependency Graph

## Prerequisites

You should have the following installed before moving further.

- Python 3.8
- Graphviz

## Install

1. Install using the instructions described in README.md.
1. Define the following shell variables in your `.profile` or configuration file of choice.

| Shell Variable | Description                                                                           |
| :---           | :---                                                                                  |
| `JIRA_USER`    | Typically your Tile email address.                                                    |
| `JIRA_PASS`    | An API token generated at https://id.atlassian.com/manage-profile/security/api-tokens |

## Running

Use the following `Makefile` targets to achieve a particular end.

### Generate a dependency graph SVG file given a JIRA ticket
```
$ make JIRA_TICKET=<ticket>
```

### Generate a dependency graph SVG file given a JIRA ticket and view the result on MacOS
```
$ make JIRA_TICKET=<ticket> view
```













