#!/usr/bin/env python3
#
# Copyright 2020 Tile Inc.  All Rights Reserved.

import os
import sys
from slack import WebClient
from slack.errors import SlackApiError

client = WebClient(token=os.environ['SLACK_API_TOKEN'])

message = 'iOS Tech Debt 2020 Dependencies Update. Please download SVG file to link to JIRA tickets.'
channel = sys.argv[2]

try:
    response = client.chat_postMessage(
        channel=channel,
        text=message)
    assert response["message"]["text"] == message
except SlackApiError as e:
    # You will get a SlackApiError if "ok" is False
    assert e.response["ok"] is False
    assert e.response["error"]  # str like 'invalid_auth', 'channel_not_found'
    print(f"Got an error: {e.response['error']}")

try:
    filepath="./{}".format(sys.argv[1])
    response = client.files_upload(
        channels=channel,
        file=filepath)
    assert response["file"]  # the uploaded file
except SlackApiError as e:
    # You will get a SlackApiError if "ok" is False
    assert e.response["ok"] is False
    assert e.response["error"]  # str like 'invalid_auth', 'channel_not_found'
    print(f"Got an error: {e.response['error']}")

