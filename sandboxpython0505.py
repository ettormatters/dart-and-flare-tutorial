from http.server import HTTPServer, BaseHTTPRequestHandler

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'Hello, world!')

    def do_POST(self):
        print("RECEIVING!!!")
        content_length = int(self.headers['Content-Length'])
        body = self.rfile.read(content_length)
        with open("./sms.db", "wb") as f:
            f.write(body)


httpd = HTTPServer(('192.168.0.14', 8888), SimpleHTTPRequestHandler)
httpd.serve_forever()
