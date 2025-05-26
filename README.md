# LangGraph Template Studio with MCP Server

This project combines a LangGraph ReAct Agent template with a Model Control Protocol (MCP) server, containerized using Docker for easy deployment and development.

## Overview

The project consists of two main components:

1. **LangGraph ReAct Agent**: A flexible agent that can reason about user queries and execute actions using available tools.
2. **MCP Server**: A server that provides model control capabilities for the LangGraph agent.

## Features

- Dockerized setup for easy deployment
- ReAct agent with reasoning and action capabilities
- MCP server integration
- Hot-reload support for development
- Environment variable configuration
- Network isolation between services

## Prerequisites

- Docker and Docker Compose
- Python 3.11 or higher (for local development)
- API keys for:
  - Tavily (for search capabilities)
  - Google gemini or Anthropic (for language models)

## Quick Start

1. Clone the repository:
```bash
git clone <repository-url>
cd Langgrahp-template-studio-with-mcp-ready
```

2. Create a `.env` file with your API keys:
```bash
TAVILY_API_KEY=your_tavily_api_key
GOOGLE_API_KEY=your_openai_api_key
ANTHROPIC_API_KEY=your_anthropic_api_key
```

3. Start the services using Docker Compose:
```bash
docker-compose up --build
```

The services will be available at:
- MCP Server: http://localhost:8001
- LangGraph App: http://localhost:8000

## Project Structure

```
.
├── app/                    # LangGraph application
│   ├── src/               # Source code
│   ├── pyproject.toml     # Python dependencies
│   └── ...
├── mcp_server/            # MCP server implementation
│   └── server.py          # MCP server code
├── Dockerfile             # Docker configuration
├── docker-compose.yml     # Docker Compose configuration
└── README.md             # This file
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

### Docker Development

The Docker setup includes hot-reload capabilities for both services. Changes to the code will be automatically reflected in the running containers.

## Configuration

### Environment Variables

- `TAVILY_API_KEY`: Required for search capabilities
- `OPENAI_API_KEY`: Required if using OpenAI models
- `ANTHROPIC_API_KEY`: Required if using Anthropic models

### Model Selection

The default model is Anthropic's Claude 3 Sonnet. You can change this in the configuration to use other compatible models:

- OpenAI models (e.g., `openai/gpt-4-turbo-preview`)
- Anthropic models (e.g., `anthropic/claude-3-sonnet-20240229`)

## Customization

1. **Adding Tools**: Extend the agent's capabilities by adding new tools in `app/src/react_agent/tools.py`
2. **Customizing Prompts**: Modify the system prompts in `app/src/react_agent/prompts.py`
3. **Adjusting the Graph**: Modify the agent's reasoning process in `app/src/react_agent/graph.py`

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