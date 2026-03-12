import os,requests,datetime
from pathlib import Path

API_KEY=os.environ.get("CLAUDE_API_KEY","")
TASK=os.environ.get("BOT_TASK","搜索今天最新科技新闻整理成报告")
Path("results").mkdir(exist_ok=True)

def run():
    print(f"任务:{TASK}")
    r=requests.post("https://api.anthropic.com/v1/messages",
        headers={"x-api-key":API_KEY,"anthropic-version":"2023-06-01","Content-Type":"application/json"},
        json={"model":"claude-sonnet-4-20250514","max_tokens":4096,
        "tools":[{"type":"web_search_20250305","name":"web_search"}],
        "messages":[{"role":"user","content":TASK}]},timeout=120)
    data=r.json()
    text=""
    for b in data.get("content",[]):
        if b["type"]=="text":text+=b["text"]
    ts=datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    open(f"results/result_{ts}.txt","w").write(text)
    print(text)

if __name__=="__main__":run()
