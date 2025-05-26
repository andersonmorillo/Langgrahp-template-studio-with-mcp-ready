# LangGraph Template Studio with MCP Server

This project combines a LangGraph ReAct Agent template with a Model Control Protocol (MCP) server for development and deployment.

## Overview

The project consists of two main components:

1. **LangGraph ReAct Agent**: A flexible agent that can reason about user queries and execute actions using available tools.
2. **MCP Server**: A server that provides model control capabilities for the LangGraph agent.

## Features

- ReAct agent with reasoning and action capabilities
- MCP server integration
- Environment variable configuration
- Comprehensive testing suite
- Static file serving capabilities

## Prerequisites

- Python 3.11 or higher
- API keys for:
  - Tavily (for search capabilities)
  - Google Gemini or Anthropic (for language models)

## Quick Start

1. Clone the repository:
```bash
git clone <repository-url>
cd Langgrahp-template-studio-with-mcp-ready
```

2. Create a `.env` file with your API keys:
```bash
TAVILY_API_KEY=your_tavily_api_key
GOOGLE_API_KEY=your_google_api_key
ANTHROPIC_API_KEY=your_anthropic_api_key
```

3. Set up and run the services:
```bash
# Set up Python virtual environment
python -m venv env
source env/bin/activate  # On Windows: env\Scripts\activate

# Install dependencies
cd app
pip install -e .

# Run the services
# Terminal 1 - MCP Server
python mcp_server/server.py

# Terminal 2 - LangGraph App
langgraph run
```

The services will be available at:
- MCP Server: http://localhost:8001
- LangGraph App: http://localhost:8000

## Project Structure

```
.
├── app/                    # LangGraph application
│   ├── src/               # Source code
│   ├── static/            # Static files
│   ├── tests/             # Test suite
│   ├── pyproject.toml     # Python dependencies
│   ├── Makefile          # Build and development commands
│   └── langgraph.json    # LangGraph configuration
├── mcp_server/            # MCP server implementation
│   └── server.py         # MCP server code
├── env/                   # Python virtual environment
└── README.md            # This file
```

## Development

### Local Development

1. Set up a Python virtual environment:
```bash
python -m venv env
source env/bin/activate  # On Windows: env\Scripts\activate
```

2. Install dependencies:
```bash
cd app
pip install -e .
```

3. Run the services:
```bash
# Terminal 1 - MCP Server
python mcp_server/server.py

# Terminal 2 - LangGraph App
langgraph run
```

## Configuration

### Environment Variables

- `TAVILY_API_KEY`: Required for search capabilities
- `GOOGLE_API_KEY`: Required if using Google Gemini models
- `ANTHROPIC_API_KEY`: Required if using Anthropic models

### Model Selection

The default model is Anthropic's Claude 3 Sonnet. You can change this in the configuration to use other compatible models:

- Google Gemini models (e.g., `google/gemini-pro`)
- Anthropic models (e.g., `anthropic/claude-3-sonnet-20240229`)

## Customization

1. **Adding Tools**: Extend the agent's capabilities by adding new tools in `app/src/react_agent/tools.py`
2. **Customizing Prompts**: Modify the system prompts in `app/src/react_agent/prompts.py`
3. **Adjusting the Graph**: Modify the agent's reasoning process in `app/src/react_agent/graph.py`
4. **Static Files**: Add static assets in the `app/static` directory

## Testing

The project includes a comprehensive test suite. Run tests using:

```bash
cd app
make test
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- [LangGraph](https://github.com/langchain-ai/langgraph) for the base template
- [LangGraph Studio](https://github.com/langchain-ai/langgraph-studio) for the development environment
- [LangSmith](https://smith.langchain.com/) for tracing and collaboration features