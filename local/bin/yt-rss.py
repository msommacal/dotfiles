#!/usr/bin/env python3

from bs4 import BeautifulSoup
from urllib.parse import urlparse, parse_qs
import requests
import sys

def channel(url):
    html = requests.get(url, cookies={'CONSENT': 'YES+1'})
    soup = BeautifulSoup(html.content, "lxml")

    return soup.select_one("link[type='application/rss+xml']")["href"]

def playlist(url):
    playlist_id = parse_qs(urlparse(url).query)["list"][0]

    return "https://www.youtube.com/feeds/videos.xml?playlist_id=" + playlist_id

def video(url):
    html = requests.get(url, cookies={'CONSENT': 'YES+1'})
    soup = BeautifulSoup(html.content, "lxml")

    channel_id = soup.select_one("meta[itemprop='channelId']")["content"]

    return channel("https://www.youtube.com/channel/" + channel_id)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: youtube-rss [channel|playlist|video]")
        sys.exit(1)

    url = urlparse(sys.argv[1])

    if url.path[:2] in ["/c", "/@"]:
        print(channel(url.geturl()))
    elif "list" in parse_qs(url.query):
        print(playlist(url.geturl()))
    elif url.path == "/watch":
        print(video(url.geturl()))
