import os
from slack import WebClient
from slack.errors import SlackApiError

client = WebClient(token=os.environ['SLACK_API_TOKEN'])

message = 'iOS Tech Debt 2020 Dependencies as of 2020-06-04'

try:
    response = client.chat_postMessage(
        channel='#ios-tech-debt-2020',
        text=message)
    assert response["message"]["text"] == message
except SlackApiError as e:
    # You will get a SlackApiError if "ok" is False
    assert e.response["ok"] is False
    assert e.response["error"]  # str like 'invalid_auth', 'channel_not_found'
    print(f"Got an error: {e.response['error']}")

try:
    filepath="./TTGE-4966_2020_06_04.svg"
    response = client.files_upload(
        channels='#ios-tech-debt-2020',
        file=filepath)
    assert response["file"]  # the uploaded file
except SlackApiError as e:
    # You will get a SlackApiError if "ok" is False
    assert e.response["ok"] is False
    assert e.response["error"]  # str like 'invalid_auth', 'channel_not_found'
    print(f"Got an error: {e.response['error']}")

