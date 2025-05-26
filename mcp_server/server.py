# math_server.py
# https://github.com/modelcontextprotocol/python-sdk
from mcp.server.fastmcp import FastMCP
import asyncio
from langchain_tavily import TavilySearch
import os
from dotenv import load_dotenv

load_dotenv(dotenv_path=".env")  # or use full path if it's not in the same directory
PORT=os.getenv("PORT")


mcp = FastMCP("MY app", port=8001)


tavily_search_tool = TavilySearch(max_results=3, search_depth="basic")



# Wrap the TavilySearch tool in a tool decorator and make it async
@mcp.tool()
async def search(query: str) -> str:
    """Search for general web results."""
    return await asyncio.to_thread(tavily_search_tool.invoke, {"query": query})


if __name__ == "__main__":
    mcp.run(transport="streamable-http")
