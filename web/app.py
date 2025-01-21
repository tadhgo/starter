from http.server import HTTPServer, BaseHTTPRequestHandler
import time

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/health':
            self.send_response(200)
            self.send_header('Content-type', 'text/plain')
            self.end_headers()
            self.wfile.write(b'healthy')
        else:
            self.send_response(200)
            self.send_header('Content-type', 'text/plain')
            self.end_headers()
            self.wfile.write(b'Hello from web service!')

print("Starting server...")

time.sleep(5)
httpd = HTTPServer(('0.0.0.0', 8000), SimpleHTTPRequestHandler)
print("Server started")
httpd.serve_forever()