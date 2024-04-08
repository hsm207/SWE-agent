create-keys-config:
	@if [ -f keys.cfg ]; then \
        echo "keys.cfg file already exist. Skipping creation."; \
    else \
        echo "Creating keys.cfg file..."; \
        echo "GITHUB_TOKEN: 'GitHub Token Here (required)'" > keys.cfg; \
        echo "OPENAI_API_KEY: 'OpenAI API Key Here if using OpenAI Model (optional)'" >> keys.cfg; \
        echo "ANTHROPIC_API_KEY: 'Anthropic API Key Here if using Anthropic Model (optional)'" >> keys.cfg; \
        echo "TOGETHER_API_KEY: 'Together API Key Here if using Together Model (optional)'" >> keys.cfg; \
        echo "AZURE_OPENAI_API_KEY: 'Azure OpenAI API Key Here if using Azure OpenAI Model (optional)'" >> keys.cfg; \
        echo "AZURE_OPENAI_ENDPOINT: 'Azure OpenAI Endpoint Here if using Azure OpenAI Model (optional)'" >> keys.cfg; \
        echo "AZURE_OPENAI_API_VERSION: 'Azure OpenAI API Version Here if using Azure OpenAI Model (optional)'" >> keys.cfg; \
        echo "#OPENAI_API_BASE_URL: 'LLM base URL here if using Local or alternative api Endpoint (optional)'" >> keys.cfg; \
        echo "keys.cfg file has been created."; \
    fi

install-editable:
	@echo "Installing the sweagent package in editable mode..."
	@pip install -e .
	@echo "Installation complete."
    
build-docker-images:
	./setup.sh

setup:
	@make install-editable
	@make create-keys-config
	@make build-docker-images