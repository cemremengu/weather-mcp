# SSE-based Server for [MCP](https://modelcontextprotocol.io/introduction)

This demonstrates a working pattern for SSE-based MCP servers.

## Usage

```
uv run weather.py
```

## Why?

This means the MCP server can now be some running process that agents (clients) connect to, use, and disconnect from whenever and wherever they want. In other words, an SSE-based server and clients can be decoupled processes (potentially even, on decoupled nodes). This is different and better fits "cloud-native" use-cases compared to the STDIO-based pattern where the client itself spawns the server as a subprocess.

### Server

`weather.py` is a SSE-based MCP server that presents some tools based on the National Weather Service APIs. Adapted from the MCP docs' [example STDIO server implementation.](https://modelcontextprotocol.io/quickstart/server)

By default, server runs on 0.0.0.0:8080, but is configurable with command line arguments like:

```
uv run weather.py --host <your host> --port <your port>
```
