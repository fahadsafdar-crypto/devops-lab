FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80

# Security: nginx:alpine workers run as non-root (user nginx).
# For custom apps, add: RUN adduser -D appuser && USER appuser
# Production rule: never run application containers as root.
