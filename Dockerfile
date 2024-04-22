FROM nikolaik/python-nodejs:python3.9-nodejs18

# Set default environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="America/New_York"
ENV PYTHONUNBUFFERED=1

# Create working directory and relevant dirs
WORKDIR /app
RUN chmod 777 /app

# Install jq
RUN apt-get update && apt-get install -y jq

# Install dependencies including Playwright
RUN apt-get install -y \
    xvfb \
    gunicorn \
    libgbm-dev \
    libnss3 \
    libasound2 \
    libxss1 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    && rm -rf /var/lib/apt/lists/*

RUN cp /usr/share/zoneinfo/$TZ /etc/localtime

RUN pip install -U pip

# Add often-changed files in order to cache above
COPY . .

RUN --mount=type=secret,id=accounts_json,dst=/etc/secrets/accounts.json cp /etc/secrets/accounts.json ./src

RUN --mount=type=secret,id=config_json,dst=/etc/secrets/config.json cp /etc/secrets/config.json ./src


RUN pip3 install --no-cache-dir -r requirements.txt

# Install application dependencies
RUN npm install

# Build the script
RUN npm run build

# Install playwright chromium
RUN npx playwright install chromium


# Make the entrypoint executable
RUN chmod +x entrypoint.sh

# Set the entrypoint to our entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]

#END