# Use a Python image with uv pre-installed
FROM astral/uv:python3.13-alpine AS uv

# Set the working directory
WORKDIR /app

# Copy the necessary files for dependency installation
COPY pyproject.toml uv.lock ./

# Install the project's dependencies using cache mount
RUN --mount=type=cache,target=/root/.cache/uv \
  uv sync --frozen --no-dev --no-editable

# Copy the rest of the application files
COPY . .

# Expose the port that the server will run on
EXPOSE 8080

# Default command to run the server
CMD ["uv", "run", "weather.py"]
